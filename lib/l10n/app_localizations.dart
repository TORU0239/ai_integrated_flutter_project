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

  /// No description provided for @homeAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeAppBarTitle;

  /// No description provided for @homeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hello! How are you feeling today?'**
  String get homeGreeting;

  /// No description provided for @homeCheckInPrompt.
  ///
  /// In en, this message translates to:
  /// **'Take a moment to record your current mood and any notes.'**
  String get homeCheckInPrompt;

  /// No description provided for @homeRecordEmotionCta.
  ///
  /// In en, this message translates to:
  /// **'Log mood'**
  String get homeRecordEmotionCta;

  /// No description provided for @homeStartChatCta.
  ///
  /// In en, this message translates to:
  /// **'Start AI counseling'**
  String get homeStartChatCta;

  /// No description provided for @homeRecentConversationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Recent conversations'**
  String get homeRecentConversationsTitle;

  /// No description provided for @homeViewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get homeViewAll;

  /// No description provided for @homeRecentConversationsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No conversations yet. Start a session to see them here.'**
  String get homeRecentConversationsEmpty;

  /// No description provided for @homeConversation1Title.
  ///
  /// In en, this message translates to:
  /// **'AI counseling · Yesterday'**
  String get homeConversation1Title;

  /// No description provided for @homeConversation1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'You completed a breathing exercise and reported feeling calmer.'**
  String get homeConversation1Subtitle;

  /// No description provided for @homeConversation2Title.
  ///
  /// In en, this message translates to:
  /// **'Mood check-in · 2 days ago'**
  String get homeConversation2Title;

  /// No description provided for @homeConversation2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Mood improved from 4/10 to 6/10 after journaling.'**
  String get homeConversation2Subtitle;

  /// No description provided for @homeReportHighlightsTitle.
  ///
  /// In en, this message translates to:
  /// **'Report highlights'**
  String get homeReportHighlightsTitle;

  /// No description provided for @homeReportHighlight1.
  ///
  /// In en, this message translates to:
  /// **'This week\'s mood trend is steady with fewer low points.'**
  String get homeReportHighlight1;

  /// No description provided for @homeReportHighlight2.
  ///
  /// In en, this message translates to:
  /// **'You received 3 positive feedback messages recently.'**
  String get homeReportHighlight2;

  /// No description provided for @homeReportHighlight3.
  ///
  /// In en, this message translates to:
  /// **'Recommended today: 5-minute mindful breathing audio.'**
  String get homeReportHighlight3;

  /// No description provided for @homeQuickActionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick actions'**
  String get homeQuickActionsTitle;

  /// No description provided for @homeEmotionHistoryCta.
  ///
  /// In en, this message translates to:
  /// **'View mood history'**
  String get homeEmotionHistoryCta;

  /// No description provided for @homeReportCenterCta.
  ///
  /// In en, this message translates to:
  /// **'Open wellness library'**
  String get homeReportCenterCta;

  /// No description provided for @chatbotAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Counseling'**
  String get chatbotAppBarTitle;

  /// No description provided for @chatbotSafetyBannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Safety notice'**
  String get chatbotSafetyBannerTitle;

  /// No description provided for @chatbotSafetyBannerBody.
  ///
  /// In en, this message translates to:
  /// **'If you ever feel in danger, reach out to local emergency services or trusted contacts. I\'m here to support you, but I\'m not a substitute for professional crisis help.'**
  String get chatbotSafetyBannerBody;

  /// No description provided for @chatbotQuickActionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Helpful tools'**
  String get chatbotQuickActionsTitle;

  /// No description provided for @chatbotSelfAssessmentCta.
  ///
  /// In en, this message translates to:
  /// **'Start self-assessment'**
  String get chatbotSelfAssessmentCta;

  /// No description provided for @chatbotResourceCentreCta.
  ///
  /// In en, this message translates to:
  /// **'Open calming resources'**
  String get chatbotResourceCentreCta;

  /// No description provided for @chatbotEmptyStateTitle.
  ///
  /// In en, this message translates to:
  /// **'How can I support you today?'**
  String get chatbotEmptyStateTitle;

  /// No description provided for @chatbotEmptyStateBody.
  ///
  /// In en, this message translates to:
  /// **'Share how you\'re feeling or what\'s on your mind. I\'ll listen and guide you step by step.'**
  String get chatbotEmptyStateBody;

  /// No description provided for @chatbotInputHint.
  ///
  /// In en, this message translates to:
  /// **'Type your feelings or questions here...'**
  String get chatbotInputHint;

  /// No description provided for @chatbotSendCta.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get chatbotSendCta;

  /// No description provided for @chatbotSampleUserMessage1.
  ///
  /// In en, this message translates to:
  /// **'I\'ve been feeling overwhelmed and can\'t focus lately.'**
  String get chatbotSampleUserMessage1;

  /// No description provided for @chatbotSampleBotMessage1.
  ///
  /// In en, this message translates to:
  /// **'Thank you for sharing that. Would it feel okay to take a deep breath together and explore what\'s been weighing on you?'**
  String get chatbotSampleBotMessage1;

  /// No description provided for @chatbotSampleUserMessage2.
  ///
  /// In en, this message translates to:
  /// **'I think it\'s mostly work stress and not sleeping well.'**
  String get chatbotSampleUserMessage2;

  /// No description provided for @chatbotSampleBotMessage2.
  ///
  /// In en, this message translates to:
  /// **'That sounds exhausting. We can look at small steps to ease your mind tonight. Would a short breathing exercise or journaling prompt help?'**
  String get chatbotSampleBotMessage2;
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
