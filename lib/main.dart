import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Mental Care',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5B7BFF)),
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<String> _languages = ['한국어', 'English'];
  String _selectedLanguage = '한국어';
  bool _isConsentGiven = false;

  void _showComingSoonMessage() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('준비 중인 기능입니다.')));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF1F4FF), Color(0xFFFFFFFF)],
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
                  'AI 멘탈케어 챗봇',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '자살 예방과 감정 케어를 위한 안전한 동반자',
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 24),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '서비스 & 보안 정책',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          '• 모든 대화는 종단간 암호화로 보호됩니다.\n'
                          '• 감정 위험 패턴 탐지 시 긴급 대응 절차를 즉시 안내합니다.\n'
                          '• 긴급 상황에서는 신원 확인을 요청할 수 있습니다.',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '언어 선택',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: _selectedLanguage,
                  items: _languages
                      .map(
                        (language) => DropdownMenuItem(
                          value: language,
                          child: Text(language),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedLanguage = value;
                      });
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
                  title: const Text('긴급 상황 시 신원 확인 요청에 동의합니다.'),
                  subtitle: const Text('서비스 이용 약관 및 개인정보 처리방침을 확인했습니다.'),
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
                  child: const Text('익명으로 시작하기'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: _isConsentGiven ? _showComingSoonMessage : null,
                  icon: const Icon(Icons.login),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  label: const Text('소셜 계정으로 연결하기'),
                ),
                const SizedBox(height: 32),
                Text(
                  '서비스 주요 기능',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: const [
                    _LandingFeatureCard(
                      icon: Icons.chat_bubble_outline,
                      title: 'AI 챗봇 상담',
                      description: '실시간 감정 대화를 통해 위기 신호를 감지하고 안전한 상담을 제공합니다.',
                    ),
                    _LandingFeatureCard(
                      icon: Icons.dashboard_customize_outlined,
                      title: '홈 대시보드',
                      description: '오늘의 감정 기록과 최근 상담 이력을 한눈에 확인하세요.',
                    ),
                    _LandingFeatureCard(
                      icon: Icons.support_agent,
                      title: '전문가 연결',
                      description: '위험 감지 시 상담사에게 즉시 연결되고 화상 예약을 도와드립니다.',
                    ),
                    _LandingFeatureCard(
                      icon: Icons.trending_up,
                      title: '리포트 & 자기관리',
                      description:
                          '감정 변화 그래프, 명상 콘텐츠, 건강 정보를 통해 꾸준한 케어를 도와드립니다.',
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  '프리미엄 혜택',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('• 1:1 개인 상담 매칭'),
                        SizedBox(height: 8),
                        Text('• 감정 리포트 내보내기 및 외부 공유'),
                        SizedBox(height: 8),
                        Text('• 스페셜 힐링 콘텐츠 구독'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    '서비스 준비 중입니다. 곧 만나요!',
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

    return SizedBox(
      width: 240,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
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
        ),
      ),
    );
  }
}
