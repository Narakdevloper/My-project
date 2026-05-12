import 'package:flutter/material.dart';
import 'package:narak_news/providers/theme_provider.dart';
import 'package:narak_news/ui/bottom_navbar.dart';
import 'package:narak_news/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class CountApp extends StatelessWidget {
  const CountApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeProvider>().theme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(
          primary: const Color(0xFFE50914),
          surface: Colors.grey.shade100,
        ),
        cardColor: Colors.grey.shade100,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0F),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFE50914),
          surface: const Color(0xFF1A1A2E),
        ),
        cardColor: const Color(0xFF1A1A2E),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF0A0A0F),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
