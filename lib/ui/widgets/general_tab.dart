import 'package:flutter/material.dart';
import 'package:narak_news/ui/widgets/setting_card.dart';
import 'package:narak_news/ui/widgets/theme_row.dart';
import '../widgets/section_title.dart';

class GeneralTab extends StatelessWidget {
  final String title;
  final bool isDark;

  const GeneralTab({super.key, required this.title, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 2.5,
        color: isDark ? Colors.white : Colors.black54, // example
      ),
    );
  }
}
