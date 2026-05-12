import 'package:flutter/material.dart';

class SettingCard extends StatelessWidget {
  final bool isDark;
  final List<Widget> children;

  const SettingCard({super.key, required this.isDark, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(children: children);
  }
}
