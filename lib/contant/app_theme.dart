import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xFFE50914);
  static const darkBg = Color(0xFF0A0A0F);
  static const darkCard = Color(0xFF1A1A2E);
  static const darkCard2 = Color(0xFF0D0D14);
  static Color bg(bool isDark) => isDark ? darkBg : Colors.white;
  static Color card(bool isDark) => isDark ? darkCard : Colors.grey.shade100;
  static Color navBg(bool isDark) => isDark ? darkCard2 : Colors.white;
  static Color hint(bool isDark) => isDark ? Colors.white38 : Colors.black38;
  static Color text(bool isDark) => isDark ? Colors.white : Colors.black87;
  static Color sub(bool isDark) => isDark ? Colors.white54 : Colors.black54;
  static Color icon(bool isDark) => isDark ? Colors.white24 : Colors.black26;
  static Color border(bool isDark) => isDark ? Colors.white10 : Colors.black12;
  static Color shimmerBase(bool isDark) =>
      isDark ? darkCard : Colors.grey.shade300;
  static Color shimmerHigh(bool isDark) =>
      isDark ? darkCard2 : Colors.grey.shade100;
}
