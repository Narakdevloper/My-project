import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool isDark;

  const SectionTitle({super.key, required this.title, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
