import 'package:flutter/material.dart';
import 'package:reserva_ja/app_colors.dart';
import 'package:reserva_ja/l10n/app_localizations.dart';

class EstablishmentPage extends StatelessWidget {
  final String title;
  final String address;
  final double price;
  final bool hasSnackbar;
  final bool hasLockerRoom;
  final List sports;

  const EstablishmentPage({
    super.key,
    required this.title,
    required this.address,
    required this.price,
    required this.sports,
    this.hasSnackbar = false,
    this.hasLockerRoom = false,
  });

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextTheme.of(ctx).titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: AppColors.primary,
          onPressed: () => {
            print('Cliquei no botão de voltar')
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            color: AppColors.primary,
            onPressed: () => {
              print('deu bom')
            }
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 16),
        alignment: AlignmentDirectional.centerStart,
        color: AppColors.background,
        child: Column(
          children: [
            Card(
              elevation: 4,
              color: Colors.white,
              margin: EdgeInsetsGeometry.directional(bottom: 16),
              child: Container(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          spacing: 4,
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.primary600,
                              child: Icon(
                                Icons.sports_soccer,
                                color: AppColors.primary,
                                size: 24,
                              ),
                            ),
                            Text(
                              'Esportes',
                              style: TextTheme.of(ctx).bodyMedium?.copyWith(
                                color: AppColors.primaryText,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          sports.join(', '),
                          style: TextTheme.of(ctx).bodySmall?.copyWith(
                            color: AppColors.secondaryText,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'R\$ $price/h',
                          style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        TextButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(Colors.yellow),
                              padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)),
                              shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)))
                          ),
                          child: Text(
                            AppLocalizations.of(ctx)!.reservation,
                            style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w400),
                          ),
                          onPressed: () => {
                            print('Cliquei no botão de reservar')
                          }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 4,
              color: Colors.white,
              child: Container(
                height: 220,
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      spacing: 4,
                      children: [
                        Icon(Icons.storefront, color: AppColors.primary),
                        Text(
                          'Lancheria:',
                          style: TextTheme.of(ctx).bodyMedium?.copyWith(
                            color: AppColors.primaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                          hasSnackbar ? 'Sim' : 'Não',
                          style: TextTheme.of(ctx).bodyMedium?.copyWith(
                            color: AppColors.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                          )
                        ),
                      ],
                    ),
                    Row(
                      spacing: 4,
                      children: [
                        Icon(Icons.bathroom_outlined, color: AppColors.primary),
                        Text(
                          'Vestiário:',
                          style: TextTheme.of(ctx).bodyMedium?.copyWith(
                            color: AppColors.primaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                          hasLockerRoom ? 'Sim' : 'Não',
                          style: TextTheme.of(ctx).bodyMedium?.copyWith(
                            color: AppColors.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                          )
                        ),
                      ],
                    ),
                    Row(
                      spacing: 4,
                      children: [
                        Icon(Icons.location_on, color: AppColors.primary),
                        Text(
                          'Endereço:',
                          style: TextTheme.of(ctx).bodyMedium?.copyWith(
                            color: AppColors.primaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                            address,
                            style: TextTheme.of(ctx).bodyMedium?.copyWith(
                              color: AppColors.secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}