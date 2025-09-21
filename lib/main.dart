import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/app_localizations.dart';
import 'resources/app_colors.dart';
import 'resources/app_strings.dart';
import 'widgets/app_card.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Locale _locale = AppStrings.defaultLocale;

  void _handleLocaleChanged(Locale locale) {
    if (_locale == locale) {
      return;
    }
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: AppStrings.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      onGenerateTitle: (context) => AppStrings.of(context).appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      home: LandingPage(
        selectedLocale: _locale,
        onLocaleChanged: _handleLocaleChanged,
      ),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({
    super.key,
    required this.selectedLocale,
    required this.onLocaleChanged,
  });

  final Locale selectedLocale;
  final ValueChanged<Locale> onLocaleChanged;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late Locale _selectedLocale;
  bool _isConsentGiven = false;

  @override
  void initState() {
    super.initState();
    _selectedLocale = widget.selectedLocale;
  }

  @override
  void didUpdateWidget(covariant LandingPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedLocale != widget.selectedLocale) {
      _selectedLocale = widget.selectedLocale;
    }
  }

  void _showComingSoonMessage() {
    final strings = AppStrings.of(context);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(strings.snackBarComingSoon)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strings = AppStrings.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gradientTop, AppColors.gradientBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  strings.landingHeadline,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  strings.landingSubheadline,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 24),
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        strings.servicePolicyHeading,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...strings.servicePolicies.map(
                        (policy) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text('• $policy'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  strings.languageSelectionLabel,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<Locale>(
                  initialValue: _selectedLocale,
                  items: AppStrings.supportedLocales
                      .map(
                        (locale) => DropdownMenuItem(
                          value: locale,
                          child: Text(strings.languageLabel(locale)),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedLocale = value;
                      });
                      widget.onLocaleChanged(value);
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                CheckboxListTile(
                  value: _isConsentGiven,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(strings.consentTitle),
                  subtitle: Text(strings.consentSubtitle),
                  onChanged: (value) {
                    setState(() {
                      _isConsentGiven = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: _isConsentGiven ? _showComingSoonMessage : null,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  child: Text(strings.anonymousCta),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: _isConsentGiven ? _showComingSoonMessage : null,
                  icon: const Icon(Icons.login),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  label: Text(strings.socialCta),
                ),
                const SizedBox(height: 32),
                Text(
                  strings.featureSectionTitle,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    _LandingFeatureCard(
                      icon: Icons.chat_bubble_outline,
                      title: strings.featureChatTitle,
                      description: strings.featureChatDescription,
                    ),
                    _LandingFeatureCard(
                      icon: Icons.dashboard_customize_outlined,
                      title: strings.featureDashboardTitle,
                      description: strings.featureDashboardDescription,
                    ),
                    _LandingFeatureCard(
                      icon: Icons.support_agent,
                      title: strings.featureExpertTitle,
                      description: strings.featureExpertDescription,
                    ),
                    _LandingFeatureCard(
                      icon: Icons.trending_up,
                      title: strings.featureReportTitle,
                      description: strings.featureReportDescription,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  strings.premiumSectionTitle,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...strings.premiumBenefits.map(
                        (benefit) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text('• $benefit'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    strings.comingSoon,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LandingFeatureCard extends StatelessWidget {
  const _LandingFeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32, color: theme.colorScheme.primary),
          const SizedBox(height: 12),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(description),
        ],
      ),
    );
  }
}
