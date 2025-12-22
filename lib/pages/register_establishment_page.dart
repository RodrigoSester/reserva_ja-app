import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reserva_ja/app_colors.dart';
import 'package:reserva_ja/enums/sports_enum.dart';
import 'package:reserva_ja/l10n/app_localizations.dart';
import 'package:reserva_ja/services/storage_service.dart';
import 'package:reserva_ja/utils/routes.dart';
import 'package:reserva_ja/widgets/text_input.dart';
import 'package:reserva_ja/widgets/user_form.dart';

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

  bool userCreated = false;
  final _formKey = GlobalKey<FormState>();
  late final List<String> sports = Sports.values.map((e) => e.name).toList();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
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

  void userFormCallback() {
    setState(() {
      userCreated = true;
      _tabController.animateTo(1);
    });
  }

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
          dividerColor: Colors.transparent,
          tabs: [
            Tab(
              icon: Icon(
                userCreated
                    ? Icons.check_circle
                    : Icons.account_circle_outlined,
                color: AppColors.primary,
              ),
              text: 'Criar conta',
            ),
            Tab(
              icon: Icon(Icons.apartment, color: AppColors.primary),
              text: 'Cadastrar estabelecimento',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(ctx)!.registerAccount,
                    style: TextTheme.of(ctx).titleLarge?.copyWith(
                      fontSize: 32,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Primeiro crie sua conta para seguir para a próxima etapa.',
                    textAlign: TextAlign.center,
                    style: TextTheme.of(ctx).bodyMedium?.copyWith(
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  UserForm(registerCallback: userFormCallback),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Column(
                children: [
                  Text(
                    'Cadastre seu espaço',
                    style: TextTheme.of(ctx).titleLarge?.copyWith(
                      fontSize: 32,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Agora vamos cadastrar os dados de seu estabelecimento',
                    textAlign: TextAlign.center,
                    style: TextTheme.of(ctx).bodyMedium?.copyWith(
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextInput(
                          label: 'Nome do estabelecimento',
                          required: true,
                          decoration: InputDecoration(
                            hintText: 'Nome do estabelecimento',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide: BorderSide(
                                color: AppColors.secondaryText,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obrigatório';
                            }

                            value.length < 5
                                ? 'Nome precisa ser maior do que 5'
                                : null;

                            return null;
                          },
                          onChanged: (value) {
                            title = value!;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextInput(
                          label: 'Endereço completo',
                          required: true,
                          decoration: InputDecoration(
                            hintText: 'Park avenue, 1001',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obrigatório';
                            }

                            return null;
                          },
                          onChanged: (value) {
                            address = value!.trim();
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextInput(
                          label: 'Custo por hora',
                          required: true,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          decoration: InputDecoration(
                            prefixText: 'R\$',
                            prefixStyle: TextStyle(
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.w600,
                            ),
                            hintText: '100,00',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obrigatório';
                            }

                            return null;
                          },
                          onChanged: (value) {
                            price = double.parse(value!);
                            setState(() {});
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextInput(
                          label: 'Descrição (opcional)',
                          decoration: InputDecoration(
                            hintText: 'Descrição',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) {
                            description = value!.trim();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Esportes oferecidos',
                        style: TextTheme.of(ctx).bodyLarge?.copyWith(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        height: 200,
                        padding: EdgeInsetsGeometry.all(16.0),
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          alignment: WrapAlignment.center,
                          children: sports.map((sport) {
                            bool isSelected = offeredSports.contains(sport);
                            final locales = AppLocalizations.of(ctx)!;
                            final translatedSports = {
                              'soccer': locales.soccer,
                              'basketball': locales.basketball,
                              'volleyball': locales.volleyball,
                              'tennis': locales.tennis,
                              'cycling': locales.cycling,
                              'badminton': locales.badminton,
                              'handball': locales.handball,
                              'baseball': locales.baseball,
                              'tableTennis': locales.tableTennis,
                              'rugby': locales.rugby,
                            };
                            String sportTitle =
                                translatedSports[sport] ?? sport;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected) {
                                    offeredSports.remove(sport);
                                  } else {
                                    offeredSports.add(sport);
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsetsGeometry.symmetric(
                                  horizontal: 8.0,
                                  vertical: 12.0,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.primary.withOpacity(0.2)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primary
                                        : AppColors.secondaryText,
                                    width: 2.0,
                                  ),
                                ),
                                child: Text(
                                  sportTitle,
                                  style: TextTheme.of(ctx).bodyMedium?.copyWith(
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Possui lancheria?',
                        style: TextTheme.of(ctx).bodyMedium?.copyWith(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Switch(
                        value: hasSnackbar,
                        hoverColor: AppColors.primary600,
                        onChanged: (value) => {
                          setState(() {
                            hasSnackbar = value;
                          }),
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Possui vestiário?',
                        style: TextTheme.of(ctx).bodyMedium?.copyWith(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Switch(
                        value: hasLockerRoom,
                        hoverColor: AppColors.primary600,
                        onChanged: (value) => {
                          setState(() {
                            hasLockerRoom = value;
                          }),
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.primary,
                    ),
                    child: TextButton(
                      onPressed: () => _handleRegister(),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Colors.deepPurple,
                        ),
                        minimumSize: WidgetStateProperty.all(
                          Size(double.infinity, 48),
                        ),
                      ),
                      child: Text(
                        'Cadastrar'.toUpperCase(),
                        style: TextTheme.of(ctx).titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
