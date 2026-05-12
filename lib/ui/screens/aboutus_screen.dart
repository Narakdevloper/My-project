import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:narak_news/contant/app_theme.dart';
import 'package:narak_news/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AboutusScreen extends StatefulWidget {
  const AboutusScreen({super.key});

  @override
  State<AboutusScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<AboutusScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final TextEditingController _aiInput = TextEditingController();
  String _aiResponse =
      "Hi! I'm your CINEMAX assistant. Ask me anything about movies, genres, ratings, or our branches in Phnom Penh! 🎬";
  bool _aiLoading = false;

  final List<String> _aiReplies = [
    "Looking for something to watch? Browse popular movies right from the home screen! 🍿",
    "We have branches at Aeon Mall 1, 2, 3, Sorya Center, and Chipmong — all in Phnom Penh! 📍",
    "CINEMAX is powered by TMDB API for the freshest movie data. 🎥",
    "Use search to find any movie by title or keyword! 🔍",
    "Ratings and full details are available on every movie's detail screen. ⭐",
    "Pull down to refresh for the latest popular movies! 🔄",
    "Infinite scroll means you'll never run out of movies to discover. ↓",
  ];
  int _replyIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _aiInput.dispose();
    super.dispose();
  }

  Future<void> _sendAI() async {
    if (_aiInput.text.trim().isEmpty) return;
    _aiInput.clear();
    setState(() => _aiLoading = true);
    await Future.delayed(const Duration(milliseconds: 700));
    setState(() {
      _aiResponse = _aiReplies[_replyIndex % _aiReplies.length];
      _replyIndex++;
      _aiLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().theme;

    return Scaffold(
      backgroundColor: AppTheme.bg(isDark),
      body: NestedScrollView(
        headerSliverBuilder: (_, __) => [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: AppTheme.bg(isDark),
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(46),
              child: TabBar(
                controller: _tabController,
                labelColor: AppTheme.primary,
                unselectedLabelColor: AppTheme.sub(isDark),
                indicatorColor: AppTheme.primary,
                indicatorWeight: 2,
                labelStyle: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
                tabs: const [
                  Tab(text: 'GENERAL'),
                  Tab(text: 'LOCATION'),
                  Tab(text: 'AI CHAT'),
                ],
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppTheme.primary.withAlpha(200),
                          AppTheme.bg(isDark),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 46),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withAlpha(20),
                              border: Border.all(
                                color: AppTheme.primary,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              Icons.movie_rounded,
                              color: AppTheme.text(isDark),
                              size: 34,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'CINEMAX',
                            style: TextStyle(
                              color: AppTheme.text(isDark),
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 6,
                            ),
                          ),
                          Text(
                            'Your Movie Universe',
                            style: TextStyle(
                              color: AppTheme.sub(isDark),
                              fontSize: 12,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            _GeneralTab(isDark: isDark),
            _LocationTab(isDark: isDark),
            _AiTab(
              isDark: isDark,
              aiResponse: _aiResponse,
              aiLoading: _aiLoading,
              aiInput: _aiInput,
              onSend: _sendAI,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── General Tab ─────────────────────────────────────────────────────────────

class _GeneralTab extends StatelessWidget {
  final bool isDark;
  const _GeneralTab({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionTitle(
          title: 'APPEARANCE',
          isDark: isDark,
        ).animate().fadeIn(delay: 80.ms).slideX(begin: -0.1, end: 0),
        const SizedBox(height: 10),
        _SettingCard(
          isDark: isDark,
          children: [_ThemeRow(isDark: isDark)],
        ).animate().fadeIn(delay: 120.ms).slideY(begin: 0.15, end: 0),

        const SizedBox(height: 20),
        _SectionTitle(
          title: 'ABOUT APP',
          isDark: isDark,
        ).animate().fadeIn(delay: 160.ms).slideX(begin: -0.1, end: 0),
        const SizedBox(height: 10),
        _SettingCard(
          isDark: isDark,
          children: [
            _InfoRow(
              icon: Icons.info_outline,
              label: 'About CINEMAX',
              value: 'Movie discovery powered by TMDB',
              isDark: isDark,
            ),
            _InfoRow(
              icon: Icons.build_outlined,
              label: 'Framework',
              value: 'Flutter',
              isDark: isDark,
            ),
            _InfoRow(
              icon: Icons.api_outlined,
              label: 'Data Source',
              value: 'TMDB API',
              isDark: isDark,
            ),
            _InfoRow(
              icon: Icons.tag_outlined,
              label: 'Version',
              value: '1.0.0',
              isDark: isDark,
            ),
          ],
        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.15, end: 0),

        const SizedBox(height: 20),
        _SectionTitle(
          title: 'FEATURES',
          isDark: isDark,
        ).animate().fadeIn(delay: 240.ms).slideX(begin: -0.1, end: 0),
        const SizedBox(height: 10),
        _SettingCard(
          isDark: isDark,
          children: [
            _InfoRow(
              icon: Icons.movie_rounded,
              label: 'Browse Popular Movies',
              isDark: isDark,
            ),
            _InfoRow(
              icon: Icons.search_rounded,
              label: 'Search Any Movie',
              isDark: isDark,
            ),
            _InfoRow(
              icon: Icons.star_rounded,
              label: 'View Ratings & Details',
              isDark: isDark,
            ),
            _InfoRow(
              icon: Icons.refresh_rounded,
              label: 'Pull to Refresh',
              isDark: isDark,
            ),
            _InfoRow(
              icon: Icons.arrow_downward_rounded,
              label: 'Infinite Scroll',
              isDark: isDark,
            ),
          ],
        ).animate().fadeIn(delay: 280.ms).slideY(begin: 0.15, end: 0),

        const SizedBox(height: 30),
      ],
    );
  }
}

// ─── Location Tab ─────────────────────────────────────────────────────────────

class _LocationTab extends StatelessWidget {
  final bool isDark;
  const _LocationTab({required this.isDark});

  @override
  Widget build(BuildContext context) {
    final branches = [
      ('Aeon Mall 1', 'Khan Sen Sok'),
      ('Aeon Mall 2', 'Khan Meanchey'),
      ('Aeon Mall 3', 'Khan Por Sen Chey'),
      ('Sorya Center', 'Khan Doun Penh'),
      ('Chipmong', 'Khan Mean Chey'),
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionTitle(
          title: 'OUR LOCATION',
          isDark: isDark,
        ).animate().fadeIn(delay: 80.ms).slideX(begin: -0.1, end: 0),
        const SizedBox(height: 10),
        _SettingCard(
          isDark: isDark,
          children: [
            _InfoRow(
              icon: Icons.location_city_outlined,
              label: 'City',
              value: 'Phnom Penh',
              isDark: isDark,
            ),
          ],
        ).animate().fadeIn(delay: 120.ms).slideY(begin: 0.15, end: 0),

        const SizedBox(height: 20),
        _SectionTitle(
          title: 'BRANCHES',
          isDark: isDark,
        ).animate().fadeIn(delay: 160.ms).slideX(begin: -0.1, end: 0),
        const SizedBox(height: 10),
        _SettingCard(
          isDark: isDark,
          children: branches
              .asMap()
              .entries
              .map(
                (e) => _InfoRow(
                  icon: Icons.store_outlined,
                  label: 'Branch ${e.key + 1}',
                  value: e.value.$1,
                  subtitle: e.value.$2,
                  isDark: isDark,
                ),
              )
              .toList(),
        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.15, end: 0),

        const SizedBox(height: 20),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: branches
              .map(
                (b) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withAlpha(20),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppTheme.primary.withAlpha(60)),
                  ),
                  child: Text(
                    b.$1,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primary,
                    ),
                  ),
                ),
              )
              .toList(),
        ).animate().fadeIn(delay: 240.ms),

        const SizedBox(height: 30),
      ],
    );
  }
}

// ─── AI Tab ───────────────────────────────────────────────────────────────────

class _AiTab extends StatelessWidget {
  final bool isDark;
  final String aiResponse;
  final bool aiLoading;
  final TextEditingController aiInput;
  final VoidCallback onSend;

  const _AiTab({
    required this.isDark,
    required this.aiResponse,
    required this.aiLoading,
    required this.aiInput,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            title: 'AI ASSISTANT',
            isDark: isDark,
          ).animate().fadeIn(delay: 80.ms).slideX(begin: -0.1, end: 0),
          const SizedBox(height: 10),

          // Response bubble
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.card(isDark),
              borderRadius: BorderRadius.circular(14),
              border: Border(
                left: BorderSide(color: AppTheme.primary, width: 3),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'CINEMAX AI',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                        color: AppTheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                aiLoading
                    ? Row(
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppTheme.primary,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Thinking...',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppTheme.sub(isDark),
                            ),
                          ),
                        ],
                      )
                    : Text(
                        aiResponse,
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.55,
                          color: AppTheme.text(isDark),
                        ),
                      ),
              ],
            ),
          ).animate().fadeIn(delay: 120.ms).slideY(begin: 0.15, end: 0),

          const SizedBox(height: 12),

          // Input row
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: aiInput,
                  style: TextStyle(fontSize: 13, color: AppTheme.text(isDark)),
                  decoration: InputDecoration(
                    hintText: 'Ask about movies or branches...',
                    hintStyle: TextStyle(
                      color: AppTheme.hint(isDark),
                      fontSize: 13,
                    ),
                    filled: true,
                    fillColor: AppTheme.card(isDark),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppTheme.border(isDark)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppTheme.border(isDark)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppTheme.primary),
                    ),
                  ),
                  onSubmitted: (_) => onSend(),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onSend,
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ).animate().fadeIn(delay: 160.ms),
        ],
      ),
    );
  }
}

// ─── Shared Widgets ───────────────────────────────────────────────────────────

class _SectionTitle extends StatelessWidget {
  final String title;
  final bool isDark;
  const _SectionTitle({required this.title, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 2.5,
        color: AppTheme.sub(isDark),
      ),
    );
  }
}

class _SettingCard extends StatelessWidget {
  final bool isDark;
  final List<Widget> children;
  const _SettingCard({required this.isDark, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.card(isDark),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(children: children),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;
  final String? subtitle;
  final bool isDark;

  const _InfoRow({
    required this.icon,
    required this.label,
    this.value,
    this.subtitle,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppTheme.border(isDark))),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: AppTheme.primary.withAlpha(25),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, color: AppTheme.primary, size: 17),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.text(isDark),
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: TextStyle(fontSize: 11, color: AppTheme.sub(isDark)),
                  ),
              ],
            ),
          ),
          if (value != null)
            Text(
              value!,
              style: TextStyle(fontSize: 11, color: AppTheme.sub(isDark)),
            ),
        ],
      ),
    );
  }
}

class _ThemeRow extends StatelessWidget {
  final bool isDark;
  const _ThemeRow({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: AppTheme.primary.withAlpha(25),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(
              isDark ? Icons.dark_mode : Icons.light_mode,
              color: AppTheme.primary,
              size: 17,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              isDark ? 'Dark Mode' : 'Light Mode',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppTheme.text(isDark),
              ),
            ),
          ),
          Switch(
            value: isDark,
            onChanged: (_) => context.read<ThemeProvider>().thememode(),
            activeThumbColor: AppTheme.primary,
            activeTrackColor: AppTheme.primary.withAlpha(100),
          ),
        ],
      ),
    );
  }
}
