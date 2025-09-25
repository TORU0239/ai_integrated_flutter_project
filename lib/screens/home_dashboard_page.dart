import 'package:flutter/material.dart';

import '../resources/app_strings.dart';
import '../widgets/app_card.dart';
import 'chatbot_conversation_page.dart';
import 'expert_connect_page.dart';
import 'mood_history_page.dart';
import 'report_self_care_page.dart';

class HomeDashboardPage extends StatelessWidget {
  const HomeDashboardPage({super.key});

  void _showComingSoon(BuildContext context) {
    final strings = AppStrings.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(strings.snackBarComingSoon)),
    );
  }

  void _openChatbot(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ChatbotConversationPage(),
      ),
    );
  }

  void _openMoodHistory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MoodHistoryPage(),
      ),
    );
  }

  void _openExpertConnect(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ExpertConnectPage(),
      ),
    );
  }

  void _openReportSelfCare(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ReportSelfCarePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strings = AppStrings.of(context);
    final conversations = strings.homeRecentConversations;
    final highlights = strings.homeReportHighlights;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.homeAppBarTitle),
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
                    strings.homeGreeting,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    strings.homeCheckInPrompt,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FilledButton.icon(
                    onPressed: () => _showComingSoon(context),
                    icon: const Icon(Icons.edit_note),
                    label: Text(strings.homeRecordEmotionCta),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => _openChatbot(context),
                icon: const Icon(Icons.chat_bubble_outline),
                label: Text(strings.homeStartChatCta),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              strings.homeQuickActionsTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _openMoodHistory(context),
                    icon: const Icon(Icons.auto_graph),
                    label: Text(strings.homeEmotionHistoryCta),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _openExpertConnect(context),
                    icon: const Icon(Icons.support_agent),
                    label: Text(strings.expertAppBarTitle),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
              const SizedBox(height: 24),
              AppCard(
                margin: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            strings.homeRecentConversationsTitle,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ),
                      TextButton(
                        onPressed: () => _showComingSoon(context),
                        child: Text(strings.homeViewAll),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (conversations.isEmpty)
                    Text(
                      strings.homeRecentConversationsEmpty,
                      style: theme.textTheme.bodyMedium,
                    )
                  else
                    ...List.generate(conversations.length, (index) {
                      final conversation = conversations[index];
                      final isLast = index == conversations.length - 1;
                      return Padding(
                        padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          leading: CircleAvatar(
                            backgroundColor:
                                theme.colorScheme.primary
                                    .withValues(alpha: 0.15),
                            foregroundColor: theme.colorScheme.primary,
                            child: const Icon(Icons.mood),
                          ),
                          title: Text(
                            conversation.title,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(conversation.subtitle),
                          trailing: Icon(
                            Icons.chevron_right,
                            color: theme.colorScheme.outline,
                          ),
                          onTap: () => _showComingSoon(context),
                        ),
                      );
                    }),
                ],
                ),
              ),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            strings.homeReportHighlightsTitle,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        TextButton(
                        onPressed: () => _openReportSelfCare(context),
                          child: Text(strings.homeViewAll),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                  ...highlights.map(
                    (highlight) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            size: 20,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 12),
                          Expanded(child: Text(highlight)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
