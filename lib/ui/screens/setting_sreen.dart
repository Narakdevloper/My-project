import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:narak_news/providers/theme_provider.dart';
import 'package:narak_news/ui/widgets/developer_card.dart';
import 'package:narak_news/ui/widgets/feature_item.dart';
import 'package:narak_news/ui/widgets/info_card.dart';
import 'package:narak_news/ui/widgets/row_item.dart';
import 'package:narak_news/ui/widgets/section_title.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = themeProvider.theme;
    final cardColor = isDark ? const Color(0xFF1A1A2E) : Colors.grey.shade100;
    final textColor = isDark ? Colors.white : Colors.black87;
    final subColor = isDark ? Colors.white54 : Colors.black45;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0A0A0F) : Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: isDark ? const Color(0xFF0A0A0F) : Colors.white,
            automaticallyImplyLeading: false,
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
                          const Color(0xFFE50914).withAlpha(200),
                          isDark ? const Color(0xFF0A0A0F) : Colors.white,
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withAlpha(25),
                            border: Border.all(
                              color: const Color(0xFFE50914),
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.movie_rounded,
                            color: isDark ? Colors.white : Colors.black87,
                            size: 40,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'CINEMAX',
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black87,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 6,
                          ),
                        ),
                        Text(
                          'Your Movie Universe',
                          style: TextStyle(
                            color: subColor,
                            fontSize: 13,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(
                    title: 'APPEARANCE',
                  ).animate().fadeIn(delay: 100.ms).slideX(begin: -0.1, end: 0),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isDark ? Icons.dark_mode : Icons.light_mode,
                          color: const Color(0xFFE50914),
                          size: 22,
                        ),
                        SizedBox(width: 12),
                        Text(
                          isDark ? 'Dark Mode' : 'Light Mode',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Switch(
                          value: isDark,
                          onChanged: (_) =>
                              context.read<ThemeProvider>().thememode(),
                          activeThumbColor: const Color(0xFFE50914),
                          activeTrackColor: const Color(
                            0xFFE50914,
                          ).withAlpha(100),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 150.ms).slideY(begin: 0.2, end: 0),
                  SizedBox(height: 24),
                  SectionTitle(
                    title: 'ABOUT APP',
                  ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1, end: 0),
                  SizedBox(height: 12),
                  InfoCard(
                    icon: Icons.info_outline,
                    title: 'About CINEMAX',
                    subtitle:
                        'CINEMAX is a movie discovery app powered by TMDB API. Browse popular movies, search your favorites, and explore details all in one place.',
                    cardColor: cardColor,
                    textColor: textColor,
                    subColor: subColor,
                  ).animate().fadeIn(delay: 250.ms).slideY(begin: 0.2, end: 0),
                  SizedBox(height: 24),
                  SectionTitle(
                    title: 'APP INFO',
                  ).animate().fadeIn(delay: 300.ms).slideX(begin: -0.1, end: 0),
                  SizedBox(height: 12),
                  RowItem(
                    icon: Icons.build_outlined,
                    label: 'Framework',
                    value: 'Flutter',
                    delay: 400,
                    cardColor: cardColor,
                    textColor: textColor,
                    subColor: subColor,
                  ),
                  RowItem(
                    icon: Icons.api_outlined,
                    label: 'Data Source',
                    value: 'TMDB API',
                    delay: 450,
                    cardColor: cardColor,
                    textColor: textColor,
                    subColor: subColor,
                  ),
                  RowItem(
                    icon: Icons.palette_outlined,
                    label: 'State Management',
                    value: 'Provider',
                    delay: 500,
                    cardColor: cardColor,
                    textColor: textColor,
                    subColor: subColor,
                  ),
                  SizedBox(height: 24),
                  SectionTitle(
                    title: 'DEVELOPER',
                  ).animate().fadeIn(delay: 550.ms).slideX(begin: -0.1, end: 0),
                  SizedBox(height: 12),
                  DeveloperCard(
                    cardColor: cardColor,
                    textColor: textColor,
                    subColor: subColor,
                  ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2, end: 0),
                  SizedBox(height: 24),
                  SectionTitle(
                    title: 'FEATURES',
                  ).animate().fadeIn(delay: 650.ms).slideX(begin: -0.1, end: 0),
                  SizedBox(height: 12),
                  FeatureItem(
                    icon: Icons.movie_rounded,
                    label: 'Browse Popular Movies',
                    delay: 700,
                    cardColor: cardColor,
                    textColor: textColor,
                  ),
                  FeatureItem(
                    icon: Icons.search_rounded,
                    label: 'Search Any Movie',
                    delay: 750,
                    cardColor: cardColor,
                    textColor: textColor,
                  ),
                  FeatureItem(
                    icon: Icons.star_rounded,
                    label: 'View Ratings & Details',
                    delay: 800,
                    cardColor: cardColor,
                    textColor: textColor,
                  ),
                  FeatureItem(
                    icon: Icons.refresh_rounded,
                    label: 'Pull to Refresh',
                    delay: 850,
                    cardColor: cardColor,
                    textColor: textColor,
                  ),
                  FeatureItem(
                    icon: Icons.arrow_downward_rounded,
                    label: 'Infinite Scroll',
                    delay: 900,
                    cardColor: cardColor,
                    textColor: textColor,
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
