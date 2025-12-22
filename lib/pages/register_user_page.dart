import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reserva_ja/app_colors.dart';
import 'package:reserva_ja/l10n/app_localizations.dart';
import 'package:reserva_ja/services/storage_service.dart';
import 'package:reserva_ja/utils/routes.dart';
import 'package:reserva_ja/utils/validators.dart';
import 'package:reserva_ja/widgets/text_input.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  final _formKey = GlobalKey<FormState>();

  Future<void> _handleRegister() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return print('Form has errors');
    }

    try {
      final db = FirebaseFirestore.instance;

      final data = await db.collection('users').add({
        'name': name,
        'email': email,
        'password': password,
        'created_at': FieldValue.serverTimestamp(),
      });

      final storage = StorageService();
      await storage.saveUser(data.id, name);
      await Navigator.pushNamed(context, Routes.userHomeRoute);
    } catch (e) {
      print('Error during registration: $e');
      return;
    }
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        actionsIconTheme: IconThemeData(size: 24.0),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: AppColors.primary,
          onPressed: () async => {
            await Future.delayed(Duration(milliseconds: 500)),
            await Navigator.pushNamed(ctx, Routes.welcomeRoute),
          },
        ),
      ),
      body: Container(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24.0, vertical: 32.0),
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
              AppLocalizations.of(ctx)!.joinUs,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextInput(
                    label: 'Nome',
                    required: true,
                    decoration: InputDecoration(
                      hintText: 'Nome',
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    validator: Validators.validateName,
                    onChanged: (value) {
                      name = value!.trim();
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextInput(
                    label: 'E-mail',
                    required: true,
                    decoration: InputDecoration(
                      hintText: 'example@example.com',
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    validator: Validators.validateEmail,
                    onChanged: (value) {
                      email = value!.trim();
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextInput(
                    label: 'Senha',
                    required: true,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    validator: Validators.validatePassword,
                    onChanged: (value) {
                      password = value!;
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'A senha deve conter:',
                          style: TextTheme.of(ctx).bodySmall?.copyWith(
                            color: AppColors.secondaryText,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          '• Pelo menos 8 caracteres',
                          style: TextTheme.of(ctx).bodySmall?.copyWith(
                            color: AppColors.secondaryText,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          '• Uma letra maiúscula (A-Z)',
                          style: TextTheme.of(ctx).bodySmall?.copyWith(
                            color: AppColors.secondaryText,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          '• Um número (0-9)',
                          style: TextTheme.of(ctx).bodySmall?.copyWith(
                            color: AppColors.secondaryText,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          '• Um símbolo (!@#\$%^&*()_+-=[]{};:,.<>?)',
                          style: TextTheme.of(ctx).bodySmall?.copyWith(
                            color: AppColors.secondaryText,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextInput(
                    label: 'Confirmar senha',
                    required: true,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) =>
                        Validators.validateConfirmPassword(value, password),
                    onChanged: (value) {
                      confirmPassword = value!;
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.primary,
              ),
              child: TextButton(
                onPressed: _handleRegister,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.deepPurple),
                  minimumSize: WidgetStateProperty.all(
                    Size(double.infinity, 48),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(ctx)!.register.toUpperCase(),
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
    );
  }
}
