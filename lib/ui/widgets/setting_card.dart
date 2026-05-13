import 'package:flutter/material.dart';
import 'package:narak_news/contant/app_theme.dart';

class SettingCard extends StatelessWidget {
  final bool isDark;
  final List<Widget> children;
  const SettingCard({super.key, required this.isDark, required this.children});

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
