import 'package:flutter/material.dart';
import 'package:narak_news/contant/app_theme.dart';
import 'package:narak_news/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeRow extends StatelessWidget {
  final bool isDark;
  const ThemeRow({super.key, required this.isDark});

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
