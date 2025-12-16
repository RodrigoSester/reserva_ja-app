import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:reserva_ja/l10n/app_localizations.dart';
import 'package:reserva_ja/screens/RegisterUserPage.dart';
import 'package:reserva_ja/screens/UserHomePage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reserva Já',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: RegisterUserPage(),
    );
  }
}