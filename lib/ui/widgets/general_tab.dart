import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:narak_news/contant/app_theme.dart';
import 'package:narak_news/ui/widgets/info_row.dart';
import 'package:narak_news/ui/widgets/section_title.dart';
import 'package:narak_news/ui/widgets/setting_card.dart';
import 'package:narak_news/ui/widgets/theme_row.dart';

class GeneralTab extends StatelessWidget {
  final bool isDark;
  const GeneralTab({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SectionTitle(
          title: 'APPEARANCE',
          isDark: isDark,
        ).animate().fadeIn(delay: 80.ms).slideX(begin: -0.1, end: 0),
        const SizedBox(height: 10),
        SettingCard(
          isDark: isDark,
          children: [ThemeRow(isDark: isDark)],
        ).animate().fadeIn(delay: 120.ms).slideY(begin: 0.15, end: 0),
        const SizedBox(height: 20),
        SectionTitle(
          title: 'ABOUT APP',
          isDark: isDark,
        ).animate().fadeIn(delay: 160.ms).slideX(begin: -0.1, end: 0),
        const SizedBox(height: 10),
        SettingCard(
          isDark: isDark,
          children: [
            InfoRow(
              icon: Icons.info_outline,
              label: 'About CINEMAX',
              value: 'Movie discovery powered by TMDB',
              isDark: isDark,
            ),
            InfoRow(
              icon: Icons.build_outlined,
              label: 'Framework',
              value: 'Flutter',
              isDark: isDark,
            ),
            InfoRow(
              icon: Icons.api_outlined,
              label: 'Data Source',
              value: 'TMDB API',
              isDark: isDark,
            ),
            InfoRow(
              icon: Icons.tag_outlined,
              label: 'Version',
              value: '1.0.0',
              isDark: isDark,
            ),
          ],
        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.15, end: 0),
        const SizedBox(height: 20),
        SectionTitle(
          title: 'FEATURES',
          isDark: isDark,
        ).animate().fadeIn(delay: 240.ms).slideX(begin: -0.1, end: 0),
        const SizedBox(height: 10),
        SettingCard(
          isDark: isDark,
          children: [
            InfoRow(
              icon: Icons.movie_rounded,
              label: 'Browse Popular Movies',
              isDark: isDark,
            ),
            InfoRow(
              icon: Icons.search_rounded,
              label: 'Search Any Movie',
              isDark: isDark,
            ),
            InfoRow(
              icon: Icons.star_rounded,
              label: 'View Ratings & Details',
              isDark: isDark,
            ),
            InfoRow(
              icon: Icons.refresh_rounded,
              label: 'Pull to Refresh',
              isDark: isDark,
            ),
            InfoRow(
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
