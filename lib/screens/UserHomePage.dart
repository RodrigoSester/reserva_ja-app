import 'package:flutter/material.dart';
import 'package:reserva_ja/l10n/app_localizations.dart';
import 'package:reserva_ja/widgets/EstablishmentCard.dart';
import 'package:reserva_ja/widgets/Sport.dart';
import 'package:reserva_ja/widgets/TextInput.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Center(
          child: Text(
              AppLocalizations.of(context)!.appName,
              style: TextTheme.of(context).titleLarge?.copyWith(
                color: Colors.deepPurple,
                fontWeight: FontWeight.w800,
              )
          ),
        ),
      ),
      body: ListView(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24.0,vertical: 16.0),
          children: [
            Column(
              children: [
                SizedBox(
                  child: TextInput(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)
                          )
                      ),
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.purple,
                      suffixIcon: Icon(Icons.settings),
                      suffixIconColor: Colors.purple,
                      hintText: AppLocalizations.of(context)!.searchEstablishments,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.searchBySport,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          spacing: 8,
                          children: <Sport>[
                            Sport(title: 'Futebol', icon: Icons.sports_soccer),
                            Sport(title: 'Vôlei', icon: Icons.sports_volleyball),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          AppLocalizations.of(context)!.searchByLocation,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <EstablishmentCard>[
                            EstablishmentCard(
                              id: 1,
                              title: 'Quadra do seu Zé',
                              sports: ['Futebol', 'Vôlei'],
                              location: 'Rua dos Bobos, 0',
                              price: '100',
                            ),
                            EstablishmentCard(
                              id: 1,
                              title: 'Ginásio JR',
                              sports: ['Futebol', 'Vôlei', 'Handebol'],
                              location: 'Rua Fernando Pessoa, 1001',
                              price: '120',
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ]
      ),
    );
  }
}