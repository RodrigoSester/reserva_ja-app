// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get helloWorld => 'Hola Mundo.';

  @override
  String hello(String userName) {
    return 'Hello $userName';
  }

  @override
  String get appName => 'Reserva Já';

  @override
  String get reservation => 'Reservar';

  @override
  String get searchEstablishments => 'Busque por quadras...';

  @override
  String get searchBySport => 'Busque por esporte';

  @override
  String get searchByLocation => 'Quadras perto de você';

  @override
  String get registerAccount => 'Crie sua conta';

  @override
  String get joinUs => 'Junte-se a nós para começar a jogar';

  @override
  String get register => 'Registrar';
}
