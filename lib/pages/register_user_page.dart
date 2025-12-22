import 'package:flutter/material.dart';
import 'package:reserva_ja/app_colors.dart';
import 'package:reserva_ja/l10n/app_localizations.dart';
import 'package:reserva_ja/utils/routes.dart';
import 'package:reserva_ja/widgets/user_form.dart';

class RegisterUserPage extends StatelessWidget {
  const RegisterUserPage({super.key});

  @override
  Widget build(BuildContext ctx) {
    void callback() async {
      await Navigator.pushNamed(ctx, Routes.userHomeRoute);
    }

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
            UserForm(registerCallback: callback),
          ],
        ),
      ),
    );
  }
}
