import 'package:flutter/material.dart';
import 'package:reserva_ja/app_colors.dart';
import 'package:reserva_ja/l10n/app_localizations.dart';
import 'package:reserva_ja/widgets/text_input.dart';

class RegisterEstablishmentPage extends StatelessWidget {
  bool hasSnackbar;
  bool hasLockerRoom;
  List offeredSports;

  RegisterEstablishmentPage({
    super.key,
    this.hasSnackbar = false,
    this.hasLockerRoom = false,
    this.offeredSports = const [],
  });

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: AppColors.primary,
          onPressed: () => {
            print('Cliquei no botão de voltar')
          },
        ),
      ),
      body: Container(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          children: [
            Text(
              'Cadastre seu espaço',
              style: TextTheme.of(ctx).titleLarge?.copyWith(
                  fontSize: 32,
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w800
              ),
            ),
            Text(
              'Seu centro esportivo na palma mão',
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
                    label: 'Nome do estabelecimento',
                    required: true,
                    decoration: InputDecoration(
                        hintText: 'Nome do estabelecimento',
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))
                        )
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextInput(
                    label: 'Endereço completo',
                    required: true,
                    decoration: InputDecoration(
                        hintText: 'Park avenue, 1001',
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))
                        )
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextInput(
                    label: 'Custo por hora',
                    required: true,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      prefixText: 'R\$',
                      prefixStyle: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w600
                      ),
                      hintText: '100,00',
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      )
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextInput(
                    label: 'Descrição (opcional)',
                    decoration: InputDecoration(
                        hintText: 'Descrição',
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
            RawChip(
              label: Text('Futebol'),
              onSelected: (value) => {
                print('Cliquei no chip'),
                offeredSports.add(value),
              },
              onDeleted: () => {
                offeredSports.clear(),
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Possui lancheria?',
                  style: TextTheme.of(ctx).bodyMedium?.copyWith(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Switch(
                  value: hasSnackbar,
                  onChanged: (value) => {
                    print('alterei o valor do switch: $value')
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
                      fontWeight: FontWeight.w600
                  ),
                ),
                Switch(
                  value: hasLockerRoom,
                  onChanged: (value) => {
                    print('alterei o valor do switch: $value')
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
                  onPressed: () => {
                    print('Cliquei no botão de cadastrar')
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.deepPurple),
                    minimumSize: WidgetStateProperty.all(Size(double.infinity, 48)),
                  ),
                  child: Text(
                    'Cadastrar'.toUpperCase(),
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