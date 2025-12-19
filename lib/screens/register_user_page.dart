import 'package:flutter/material.dart';
import 'package:reserva_ja/app_colors.dart';
import 'package:reserva_ja/l10n/app_localizations.dart';
import 'package:reserva_ja/widgets/text_input.dart';

class RegisterUserPage extends StatelessWidget {
  const RegisterUserPage({super.key});

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        actionsIconTheme: IconThemeData(size: 24.0),
        actions: [
          IconButton(
            onPressed: () => {
              print('Cliquei no botão de configurações')
            },
            icon: Icon(Icons.arrow_back_ios),
            alignment: AlignmentGeometry.centerLeft,
            color: AppColors.primary,
          ),
        ],
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
                fontWeight: FontWeight.w800
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
              child: Column(
                children: [
                  TextInput(
                    label: 'Nome',
                    required: true,
                    decoration: InputDecoration(
                      hintText: 'Nome',
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      )
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextInput(
                    label: 'E-mail',
                    required: true,
                    decoration: InputDecoration(
                        hintText: 'example@example.com',
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))
                        )
                    ),
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
                            borderRadius: BorderRadius.all(Radius.circular(8))
                        )
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
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
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
                onPressed: () => {
                  print('Cliquei no botão de registrar')
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.deepPurple),
                  minimumSize: WidgetStateProperty.all(Size(double.infinity, 48)),
                ),
                child: Text(
                  AppLocalizations.of(ctx)!.register.toUpperCase(),
                  style: TextTheme.of(ctx).titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}