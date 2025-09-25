import 'package:flutter/material.dart';

import '../resources/app_strings.dart';
import '../widgets/app_card.dart';

class MoodHistoryPage extends StatelessWidget {
  const MoodHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strings = AppStrings.of(context);
    final samples = strings.moodHistorySamples;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.moodHistoryAppBarTitle),
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
                    strings.moodHistoryIntro,
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Text(
              strings.moodHistoryLogTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            if (samples.isEmpty)
              AppCard(
                child: Text(strings.moodHistoryEmpty),
              )
            else
              ...samples.map(
                (log) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          log.date,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          log.summary,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _MoodScoreRow(
                          moodLabel: strings.moodHistoryMoodLabel,
                          energyLabel: strings.moodHistoryEnergyLabel,
                          moodScore: log.moodScore,
                          energyScore: log.energyScore,
                        ),
                        const SizedBox(height: 12),
                        Text(log.body),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _MoodScoreRow extends StatelessWidget {
  const _MoodScoreRow({
    required this.moodLabel,
    required this.energyLabel,
    required this.moodScore,
    required this.energyScore,
  });

  final String moodLabel;
  final String energyLabel;
  final int moodScore;
  final int energyScore;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Widget buildBadge({required IconData icon, required String label}) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: colorScheme.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: colorScheme.primary),
            const SizedBox(width: 6),
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ],
        ),
      );
    }

    return Row(
      children: [
        buildBadge(
          icon: Icons.mood,
          label: '$moodLabel $moodScore/10',
        ),
        const SizedBox(width: 12),
        buildBadge(
          icon: Icons.bolt,
          label: '$energyLabel $energyScore/10',
        ),
      ],
    );
  }
}
