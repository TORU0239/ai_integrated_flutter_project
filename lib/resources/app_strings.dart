import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class AppStrings {
  const AppStrings._(this._l10n);

  final AppLocalizations _l10n;

  static const List<Locale> supportedLocales = [
    Locale('ko'),
    Locale('en'),
  ];

  static const Locale defaultLocale = Locale('ko');

  static AppStrings of(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    assert(localizations != null, 'AppLocalizations not found in context');
    return AppStrings._(localizations!);
  }

  String get appTitle => _l10n.appTitle;
  String get landingHeadline => _l10n.landingHeadline;
  String get landingSubheadline => _l10n.landingSubheadline;
  String get servicePolicyHeading => _l10n.servicePolicyHeading;
  List<String> get servicePolicies => [
        _l10n.servicePolicy1,
        _l10n.servicePolicy2,
        _l10n.servicePolicy3,
      ];
  String get languageSelectionLabel => _l10n.languageSelectionLabel;
  String get consentTitle => _l10n.consentTitle;
  String get consentSubtitle => _l10n.consentSubtitle;
  String get anonymousCta => _l10n.anonymousCta;
  String get socialCta => _l10n.socialCta;
  String get featureSectionTitle => _l10n.featureSectionTitle;
  String get featureChatTitle => _l10n.featureChatTitle;
  String get featureChatDescription => _l10n.featureChatDescription;
  String get featureDashboardTitle => _l10n.featureDashboardTitle;
  String get featureDashboardDescription => _l10n.featureDashboardDescription;
  String get featureExpertTitle => _l10n.featureExpertTitle;
  String get featureExpertDescription => _l10n.featureExpertDescription;
  String get featureReportTitle => _l10n.featureReportTitle;
  String get featureReportDescription => _l10n.featureReportDescription;
  String get premiumSectionTitle => _l10n.premiumSectionTitle;
  List<String> get premiumBenefits => [
        _l10n.premiumBenefit1,
        _l10n.premiumBenefit2,
        _l10n.premiumBenefit3,
      ];
  String get comingSoon => _l10n.comingSoon;
  String get snackBarComingSoon => _l10n.snackBarComingSoon;
  String get homeAppBarTitle => _l10n.homeAppBarTitle;
  String get homeGreeting => _l10n.homeGreeting;
  String get homeCheckInPrompt => _l10n.homeCheckInPrompt;
  String get homeRecordEmotionCta => _l10n.homeRecordEmotionCta;
  String get homeStartChatCta => _l10n.homeStartChatCta;
  String get homeRecentConversationsTitle => _l10n.homeRecentConversationsTitle;
  String get homeViewAll => _l10n.homeViewAll;
  String get homeRecentConversationsEmpty => _l10n.homeRecentConversationsEmpty;
  List<HomeConversationStrings> get homeRecentConversations => [
        HomeConversationStrings(
          title: _l10n.homeConversation1Title,
          subtitle: _l10n.homeConversation1Subtitle,
        ),
        HomeConversationStrings(
          title: _l10n.homeConversation2Title,
          subtitle: _l10n.homeConversation2Subtitle,
        ),
      ];
  String get homeReportHighlightsTitle => _l10n.homeReportHighlightsTitle;
  List<String> get homeReportHighlights => [
        _l10n.homeReportHighlight1,
        _l10n.homeReportHighlight2,
        _l10n.homeReportHighlight3,
      ];
  String get homeQuickActionsTitle => _l10n.homeQuickActionsTitle;
  String get homeEmotionHistoryCta => _l10n.homeEmotionHistoryCta;
  String get homeReportCenterCta => _l10n.homeReportCenterCta;
  String get chatbotAppBarTitle => _l10n.chatbotAppBarTitle;
  String get chatbotSafetyBannerTitle => _l10n.chatbotSafetyBannerTitle;
  String get chatbotSafetyBannerBody => _l10n.chatbotSafetyBannerBody;
  String get chatbotQuickActionsTitle => _l10n.chatbotQuickActionsTitle;
  String get chatbotSelfAssessmentCta => _l10n.chatbotSelfAssessmentCta;
  String get chatbotResourceCentreCta => _l10n.chatbotResourceCentreCta;
  String get chatbotEmptyStateTitle => _l10n.chatbotEmptyStateTitle;
  String get chatbotEmptyStateBody => _l10n.chatbotEmptyStateBody;
  String get chatbotInputHint => _l10n.chatbotInputHint;
  String get chatbotSendCta => _l10n.chatbotSendCta;
  List<ChatMessageStrings> get chatbotSampleMessages => [
        ChatMessageStrings(
          text: _l10n.chatbotSampleUserMessage1,
          isUser: true,
        ),
        ChatMessageStrings(
          text: _l10n.chatbotSampleBotMessage1,
          isUser: false,
        ),
        ChatMessageStrings(
          text: _l10n.chatbotSampleUserMessage2,
          isUser: true,
        ),
        ChatMessageStrings(
          text: _l10n.chatbotSampleBotMessage2,
          isUser: false,
        ),
      ];
  String get expertAppBarTitle => _l10n.expertAppBarTitle;
  String get expertIntroTitle => _l10n.expertIntroTitle;
  String get expertIntroBody => _l10n.expertIntroBody;
  String get expertEmergencyCta => _l10n.expertEmergencyCta;
  String get expertEmergencySubtext => _l10n.expertEmergencySubtext;
  String get expertListTitle => _l10n.expertListTitle;
  String get expertBookSessionCta => _l10n.expertBookSessionCta;
  String get expertMessageCta => _l10n.expertMessageCta;
  String get expertCallCta => _l10n.expertCallCta;
  String get expertMoreSpecialistsCta => _l10n.expertMoreSpecialistsCta;
  List<ExpertProfileStrings> get expertProfiles => [
        ExpertProfileStrings(
          name: _l10n.expertProfile1Name,
          title: _l10n.expertProfile1Title,
          status: _l10n.expertProfile1Status,
        ),
        ExpertProfileStrings(
          name: _l10n.expertProfile2Name,
          title: _l10n.expertProfile2Title,
          status: _l10n.expertProfile2Status,
        ),
      ];

  String languageLabel(Locale locale) {
    switch (locale.languageCode) {
      case 'ko':
        return _l10n.languageNameKo;
      case 'en':
        return _l10n.languageNameEn;
      default:
        return locale.toLanguageTag();
    }
  }
}

class HomeConversationStrings {
  const HomeConversationStrings({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
}

class ChatMessageStrings {
  const ChatMessageStrings({
    required this.text,
    required this.isUser,
  });

  final String text;
  final bool isUser;
}

class ExpertProfileStrings {
  const ExpertProfileStrings({
    required this.name,
    required this.title,
    required this.status,
  });

  final String name;
  final String title;
  final String status;
}
