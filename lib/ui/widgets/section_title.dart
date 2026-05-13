import 'package:flutter/material.dart';
import 'package:narak_news/contant/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool isDark;
  const SectionTitle({super.key, required this.title, required this.isDark});

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
