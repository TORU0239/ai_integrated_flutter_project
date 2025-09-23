import 'package:flutter/material.dart';

import '../resources/app_strings.dart';
import '../widgets/app_card.dart';

class ChatbotConversationPage extends StatefulWidget {
  const ChatbotConversationPage({super.key});

  @override
  State<ChatbotConversationPage> createState() => _ChatbotConversationPageState();
}

class _ChatbotConversationPageState extends State<ChatbotConversationPage> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _showComingSoon(BuildContext context) {
    final strings = AppStrings.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(strings.snackBarComingSoon)),
    );
  }

  void _handleSendMessage() {
    if (_messageController.text.trim().isEmpty) {
      return;
    }
    _showComingSoon(context);
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strings = AppStrings.of(context);
    final messages = strings.chatbotSampleMessages;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.chatbotAppBarTitle),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                children: [
                  _SafetyBanner(strings: strings, theme: theme),
                  const SizedBox(height: 16),
                  if (messages.isEmpty)
                    AppCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            strings.chatbotEmptyStateTitle,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(strings.chatbotEmptyStateBody),
                        ],
                      ),
                    )
                  else
                    ...messages.map(
                      (message) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _ChatBubble(
                          text: message.text,
                          isUser: message.isUser,
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          strings.chatbotQuickActionsTitle,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () => _showComingSoon(context),
                                icon: const Icon(Icons.assignment_turned_in_outlined),
                                label: Text(strings.chatbotSelfAssessmentCta),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () => _showComingSoon(context),
                                icon: const Icon(Icons.spa_outlined),
                                label: Text(strings.chatbotResourceCentreCta),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            _MessageComposer(
              controller: _messageController,
              inputHint: strings.chatbotInputHint,
              sendLabel: strings.chatbotSendCta,
              onSend: _handleSendMessage,
            ),
          ],
        ),
      ),
    );
  }
}

class _SafetyBanner extends StatelessWidget {
  const _SafetyBanner({
    required this.strings,
    required this.theme,
  });

  final AppStrings strings;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final colorScheme = theme.colorScheme;
    return AppCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.shield_outlined,
            color: colorScheme.primary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  strings.chatbotSafetyBannerTitle,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(strings.chatbotSafetyBannerBody),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({
    required this.text,
    required this.isUser,
  });

  final String text;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final bubbleColor = isUser
        ? colorScheme.primary
        : colorScheme.surfaceContainerHighest;
    final textColor = isUser ? colorScheme.onPrimary : colorScheme.onSurface;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 280),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(18),
              topRight: const Radius.circular(18),
              bottomLeft: Radius.circular(isUser ? 18 : 4),
              bottomRight: Radius.circular(isUser ? 4 : 18),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageComposer extends StatelessWidget {
  const _MessageComposer({
    required this.controller,
    required this.inputHint,
    required this.sendLabel,
    required this.onSend,
  });

  final TextEditingController controller;
  final String inputHint;
  final String sendLabel;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: 8,
      color: theme.scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                minLines: 1,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: inputHint,
                  border: const OutlineInputBorder(),
                  isDense: true,
                ),
              ),
            ),
            const SizedBox(width: 12),
            FilledButton(
              onPressed: onSend,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              ),
              child: Text(sendLabel),
            ),
          ],
        ),
      ),
    );
  }
}
