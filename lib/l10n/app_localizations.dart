import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  /// The conventional newborn programmer greeting
  ///
  /// In pt, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// Message with single parameter
  ///
  /// In pt, this message translates to:
  /// **'Hello {userName}'**
  String hello(String userName);

  /// The name of the application
  ///
  /// In pt, this message translates to:
  /// **'Reserva Já'**
  String get appName;

  /// No description provided for @reservation.
  ///
  /// In pt, this message translates to:
  /// **'Reservar'**
  String get reservation;

  /// No description provided for @searchEstablishments.
  ///
  /// In pt, this message translates to:
  /// **'Busque por quadras...'**
  String get searchEstablishments;

  /// No description provided for @searchBySport.
  ///
  /// In pt, this message translates to:
  /// **'Busque por esporte'**
  String get searchBySport;

  /// No description provided for @searchByLocation.
  ///
  /// In pt, this message translates to:
  /// **'Quadras perto de você'**
  String get searchByLocation;

  /// No description provided for @registerAccount.
  ///
  /// In pt, this message translates to:
  /// **'Crie sua conta'**
  String get registerAccount;

  /// No description provided for @joinUs.
  ///
  /// In pt, this message translates to:
  /// **'Junte-se a nós para começar a jogar'**
  String get joinUs;

  /// No description provided for @register.
  ///
  /// In pt, this message translates to:
  /// **'Registrar'**
  String get register;

  /// No description provided for @soccer.
  ///
  /// In pt, this message translates to:
  /// **'Futebol'**
  String get soccer;

  /// No description provided for @tennis.
  ///
  /// In pt, this message translates to:
  /// **'Tênis'**
  String get tennis;

  /// No description provided for @basketball.
  ///
  /// In pt, this message translates to:
  /// **'Basquete'**
  String get basketball;

  /// No description provided for @volleyball.
  ///
  /// In pt, this message translates to:
  /// **'Vôlei'**
  String get volleyball;

  /// No description provided for @badminton.
  ///
  /// In pt, this message translates to:
  /// **'Badminton'**
  String get badminton;

  /// No description provided for @cycling.
  ///
  /// In pt, this message translates to:
  /// **'Ciclismo'**
  String get cycling;

  /// No description provided for @handball.
  ///
  /// In pt, this message translates to:
  /// **'Handebol'**
  String get handball;

  /// No description provided for @rugby.
  ///
  /// In pt, this message translates to:
  /// **'Rúgbi'**
  String get rugby;

  /// No description provided for @baseball.
  ///
  /// In pt, this message translates to:
  /// **'Beisebol'**
  String get baseball;

  /// No description provided for @tableTennis.
  ///
  /// In pt, this message translates to:
  /// **'Tênis de mesa'**
  String get tableTennis;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
