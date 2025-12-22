import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reserva_ja/app_theme.dart';
import 'package:reserva_ja/l10n/app_localizations.dart';
import 'package:reserva_ja/pages/register_establishment_page.dart';
import 'package:reserva_ja/pages/register_user_page.dart';
import 'package:reserva_ja/pages/user_home_page.dart';
import 'package:reserva_ja/pages/welcome_page.dart';
import 'package:reserva_ja/utils/routes.dart';

import 'firebase_options.dart';

Future<dynamic> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reserva Já',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: Routes.welcomeRoute,
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/user-login': (context) => const RegisterUserPage(),
        '/home/user': (context) => const UserHomePage(),
        '/establishment-register': (context) =>
            const RegisterEstablishmentPage(),
      },
    );
  }
}
