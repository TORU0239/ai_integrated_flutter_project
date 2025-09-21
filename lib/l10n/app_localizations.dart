import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ko')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Mental Care'**
  String get appTitle;

  /// No description provided for @landingHeadline.
  ///
  /// In en, this message translates to:
  /// **'AI Mental Care Chatbot'**
  String get landingHeadline;

  /// No description provided for @landingSubheadline.
  ///
  /// In en, this message translates to:
  /// **'Your trusted partner for suicide prevention and emotional support'**
  String get landingSubheadline;

  /// No description provided for @servicePolicyHeading.
  ///
  /// In en, this message translates to:
  /// **'Service & Security Policy'**
  String get servicePolicyHeading;

  /// No description provided for @servicePolicy1.
  ///
  /// In en, this message translates to:
  /// **'All conversations are protected with end-to-end encryption.'**
  String get servicePolicy1;

  /// No description provided for @servicePolicy2.
  ///
  /// In en, this message translates to:
  /// **'We guide you through emergency procedures when risk signals are detected.'**
  String get servicePolicy2;

  /// No description provided for @servicePolicy3.
  ///
  /// In en, this message translates to:
  /// **'We may request verification in urgent situations to protect your safety.'**
  String get servicePolicy3;

  /// No description provided for @languageSelectionLabel.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get languageSelectionLabel;

  /// No description provided for @consentTitle.
  ///
  /// In en, this message translates to:
  /// **'I agree to identity verification in emergencies.'**
  String get consentTitle;

  /// No description provided for @consentSubtitle.
  ///
  /// In en, this message translates to:
  /// **'I have reviewed the Terms of Service and Privacy Policy.'**
  String get consentSubtitle;

  /// No description provided for @anonymousCta.
  ///
  /// In en, this message translates to:
  /// **'Continue anonymously'**
  String get anonymousCta;

  /// No description provided for @socialCta.
  ///
  /// In en, this message translates to:
  /// **'Sign in with social account'**
  String get socialCta;

  /// No description provided for @featureSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Key Features'**
  String get featureSectionTitle;

  /// No description provided for @featureChatTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Chatbot Counseling'**
  String get featureChatTitle;

  /// No description provided for @featureChatDescription.
  ///
  /// In en, this message translates to:
  /// **'Detect crisis signals through real-time emotional conversations and receive safe guidance.'**
  String get featureChatDescription;

  /// No description provided for @featureDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Home Dashboard'**
  String get featureDashboardTitle;

  /// No description provided for @featureDashboardDescription.
  ///
  /// In en, this message translates to:
  /// **'Record today’s feelings and review recent counseling insights at a glance.'**
  String get featureDashboardDescription;

  /// No description provided for @featureExpertTitle.
  ///
  /// In en, this message translates to:
  /// **'Expert Connection'**
  String get featureExpertTitle;

  /// No description provided for @featureExpertDescription.
  ///
  /// In en, this message translates to:
  /// **'Automatically connect with counselors and schedule video sessions when risks are detected.'**
  String get featureExpertDescription;

  /// No description provided for @featureReportTitle.
  ///
  /// In en, this message translates to:
  /// **'Reports & Self-care'**
  String get featureReportTitle;

  /// No description provided for @featureReportDescription.
  ///
  /// In en, this message translates to:
  /// **'Track emotional trends, access mindfulness content, and stay consistent with care.'**
  String get featureReportDescription;

  /// No description provided for @premiumSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Premium Benefits'**
  String get premiumSectionTitle;

  /// No description provided for @premiumBenefit1.
  ///
  /// In en, this message translates to:
  /// **'1:1 personal counseling'**
  String get premiumBenefit1;

  /// No description provided for @premiumBenefit2.
  ///
  /// In en, this message translates to:
  /// **'Export emotional reports and share externally'**
  String get premiumBenefit2;

  /// No description provided for @premiumBenefit3.
  ///
  /// In en, this message translates to:
  /// **'Access to exclusive healing content'**
  String get premiumBenefit3;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Service coming soon. Stay tuned!'**
  String get comingSoon;

  /// No description provided for @snackBarComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon.'**
  String get snackBarComingSoon;

  /// No description provided for @languageNameKo.
  ///
  /// In en, this message translates to:
  /// **'한국어'**
  String get languageNameKo;

  /// No description provided for @languageNameEn.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageNameEn;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ko': return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
