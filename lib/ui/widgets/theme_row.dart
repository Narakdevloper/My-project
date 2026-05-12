import 'package:flutter/material.dart';

class ThemeRow extends StatelessWidget {
  final bool isDark;

  const ThemeRow({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Switch(value: isDark, onChanged: (_) {});
  }
}
