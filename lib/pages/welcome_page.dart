import 'package:flutter/material.dart';
import 'package:reserva_ja/app_colors.dart';
import 'package:reserva_ja/utils/routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: AlignmentGeometry.center,
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quem é você?',
              style: TextTheme.of(ctx).titleLarge?.copyWith(
                color: AppColors.primaryText,
                fontSize: 36,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'Escolha seu perfil para começar',
              style: TextTheme.of(ctx).titleLarge?.copyWith(
                color: AppColors.secondaryText,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 40),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: Card(
                elevation: 4,
                margin: EdgeInsetsGeometry.directional(bottom: 24),
                color: AppColors.background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: TextButton(
                  onPressed: () async => {
                    await Future.delayed(Duration(seconds: 1)),
                    await Navigator.pushNamed(ctx, Routes.userRegisterRoute),
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      AppColors.background,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ),
                  child: Container(
                    height: 70,
                    padding: EdgeInsetsGeometry.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusGeometry.all(
                              Radius.circular(4),
                            ),
                            color: AppColors.secondary,
                          ),
                          height: 32,
                          width: 32,
                          child: Icon(
                            Icons.directions_run,
                            size: 24.0,
                            color: Colors.deepOrange,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'Sou usuário',
                          style: TextTheme.of(ctx).titleLarge?.copyWith(
                            color: AppColors.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: Card(
                margin: EdgeInsetsGeometry.directional(bottom: 24),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: TextButton(
                  onPressed: () async => {
                    await Future.delayed(Duration(milliseconds: 500)),
                    await Navigator.pushNamed(
                      ctx,
                      Routes.establishmentRegisterRoute,
                    ),
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(AppColors.primary),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ),
                  child: Container(
                    height: 70,
                    padding: EdgeInsetsGeometry.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: AppColors.primary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.apartment, size: 24.0, color: Colors.white),
                        const SizedBox(width: 16),
                        Text(
                          'Dono de estabelecimento',
                          style: TextTheme.of(ctx).titleLarge?.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Esta escolha não pode ser alterada nas configurações!',
              style: TextTheme.of(ctx).bodyMedium?.copyWith(
                color: AppColors.secondaryText,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
