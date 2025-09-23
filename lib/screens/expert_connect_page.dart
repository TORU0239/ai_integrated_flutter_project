import 'package:flutter/material.dart';

import '../resources/app_strings.dart';
import '../widgets/app_card.dart';

class ExpertConnectPage extends StatelessWidget {
  const ExpertConnectPage({super.key});

  void _showComingSoon(BuildContext context) {
    final strings = AppStrings.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(strings.snackBarComingSoon)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strings = AppStrings.of(context);
    final experts = strings.expertProfiles;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.expertAppBarTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCard(
              margin: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    strings.expertIntroTitle,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(strings.expertIntroBody),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () => _showComingSoon(context),
                    icon: const Icon(Icons.emergency_share),
                    label: Text(strings.expertEmergencyCta),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    strings.expertEmergencySubtext,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              strings.expertListTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...experts.map(
              (expert) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: theme.colorScheme.primary
                                .withValues(alpha: 0.15),
                            foregroundColor: theme.colorScheme.primary,
                            child: const Icon(Icons.support_agent),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  expert.name,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(expert.title),
                                const SizedBox(height: 4),
                                Text(
                                  expert.status,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      OverflowBar(
                        spacing: 12,
                        overflowSpacing: 12,
                        children: [
                          OutlinedButton.icon(
                            onPressed: () => _showComingSoon(context),
                            icon: const Icon(Icons.videocam_outlined),
                            label: Text(strings.expertBookSessionCta),
                          ),
                          OutlinedButton.icon(
                            onPressed: () => _showComingSoon(context),
                            icon: const Icon(Icons.message_outlined),
                            label: Text(strings.expertMessageCta),
                          ),
                          OutlinedButton.icon(
                            onPressed: () => _showComingSoon(context),
                            icon: const Icon(Icons.call_outlined),
                            label: Text(strings.expertCallCta),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (experts.isNotEmpty) ...[
              const SizedBox(height: 8),
              Center(
                child: TextButton(
                  onPressed: () => _showComingSoon(context),
                  child: Text(strings.expertMoreSpecialistsCta),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
