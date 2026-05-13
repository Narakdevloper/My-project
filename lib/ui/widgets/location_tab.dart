import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:narak_news/contant/app_theme.dart';
import 'package:narak_news/ui/widgets/info_row.dart';
import 'package:narak_news/ui/widgets/section_title.dart';
import 'package:narak_news/ui/widgets/setting_card.dart';

class LocationTab extends StatelessWidget {
  final bool isDark;
  const LocationTab({super.key, required this.isDark});

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
        SectionTitle(
          title: 'OUR LOCATION',
          isDark: isDark,
        ).animate().fadeIn(delay: 80.ms).slideX(begin: -0.1, end: 0),
        const SizedBox(height: 10),
        SettingCard(
          isDark: isDark,
          children: [
            InfoRow(
              icon: Icons.location_city_outlined,
              label: 'City',
              value: 'Phnom Penh',
              isDark: isDark,
            ),
          ],
        ).animate().fadeIn(delay: 120.ms).slideY(begin: 0.15, end: 0),
        const SizedBox(height: 20),
        SectionTitle(
          title: 'BRANCHES',
          isDark: isDark,
        ).animate().fadeIn(delay: 160.ms).slideX(begin: -0.1, end: 0),
        const SizedBox(height: 10),
        SettingCard(
          isDark: isDark,
          children: branches
              .asMap()
              .entries
              .map(
                (e) => InfoRow(
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
