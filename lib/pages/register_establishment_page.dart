import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reserva_ja/app_colors.dart';
import 'package:reserva_ja/enums/sports_enum.dart';
import 'package:reserva_ja/services/storage_service.dart';
import 'package:reserva_ja/utils/routes.dart';

class RegisterEstablishmentPage extends StatefulWidget {
  const RegisterEstablishmentPage({super.key});

  @override
  State<RegisterEstablishmentPage> createState() =>
      _RegisterEstablishmentState();
}

class _RegisterEstablishmentState extends State<RegisterEstablishmentPage>
    with SingleTickerProviderStateMixin {
  String title = '';
  String address = '';
  double price = 0.0;
  String description = '';
  bool hasSnackbar = false;
  bool hasLockerRoom = false;
  List offeredSports = [];

  final _formKey = GlobalKey<FormState>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return print('Form has errors');
    }

    try {
      final db = FirebaseFirestore.instance;

      final storage = StorageService();
      dynamic user = await storage.getUser();
      String? userId = user != null ? user['id'] as String : null;

      if (user == null || userId == null) {
        print('No user found in storage');
        return;
      }

      await db.collection('establishment').add({
        'user_id': userId,
        'title': title,
        'address': address,
        'price': price,
        'description': description,
        'has_snackbar': hasSnackbar,
        'has_locker_room': hasLockerRoom,
        'offered_sports': offeredSports,
        'created_at': FieldValue.serverTimestamp(),
      });
      await db.collection('users').doc(userId).update({'is_owner': true});

      await Navigator.pushNamed(context, Routes.establishmentHomeRoute);
    } catch (e) {
      print('Error during registration: $e');
      return;
    }
  }

  List<String> _fetchSports() {
    return Sports.values.map((e) => e.name).toList();
  }

  late final List<String> sports = _fetchSports();

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: AppColors.primary,
          onPressed: () async => {
            await Future.delayed(Duration(milliseconds: 500)),
            await Navigator.pushNamed(ctx, Routes.welcomeRoute),
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.secondaryText,
          indicatorColor: AppColors.primary,
          tabs: [
            Tab(
              icon: Icon(Icons.check_circle, color: Colors.green),
              text: 'Criar Conta',
            ),
            Tab(icon: Icon(Icons.store_outlined), text: 'Cadastrar Espaço'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Text(
              'Formulário de criação de conta de usuário',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Center(
            child: Text(
              'Formulário de cadastro de estabelecimento',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
