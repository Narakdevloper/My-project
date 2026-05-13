import 'package:flutter/material.dart';
import 'package:narak_news/contant/app_theme.dart';
import 'package:narak_news/providers/theme_provider.dart';
import 'package:narak_news/ui/widgets/ai_tab.dart';
import 'package:narak_news/ui/widgets/general_tab.dart';
import 'package:narak_news/ui/widgets/location_tab.dart';
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
            GeneralTab(isDark: isDark),
            LocationTab(isDark: isDark),
            AiTab(
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
