import 'package:flutter/material.dart';
import 'package:reserva_ja/app_colors.dart';
import 'package:reserva_ja/l10n/app_localizations.dart';

class EstablishmentCard extends StatelessWidget {
  final int id;
  final String title;
  final List<String> sports;
  final String location;
  final String price;

  const EstablishmentCard({
    super.key,
    required this.id,
    required this.title,
    required this.sports,
    required this.location,
    required this.price,
  });

  @override
  Widget build(BuildContext ctx) {
    return Card(
      elevation: 4.0,
      color: Colors.white,
      margin: const EdgeInsetsGeometry.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsetsGeometry.symmetric(
            horizontal: 16.0,
            vertical: 24.0
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  sports.join(', '),
                  style: Theme.of(ctx).textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14.0, color: Colors.blue),
                    const SizedBox(width: 4.0),
                    Text(
                      location,
                      style: Theme.of(ctx).textTheme.bodySmall,
                    ),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                      backgroundColor: WidgetStateProperty.all<Color>(AppColors.secondary),
                      padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)))
                    ),
                    child: Text(
                      AppLocalizations.of(ctx)!.reservation,
                      style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w400),
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
    );
  }
}