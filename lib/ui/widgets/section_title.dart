import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: const Color(0xFFE50914),
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 4,
      ),
    );
  }
}
