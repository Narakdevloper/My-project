import 'package:flutter/material.dart';
import 'package:narak_news/providers/theme_provider.dart';
import 'package:narak_news/ui/bottom_navbar.dart';
import 'package:provider/provider.dart';

class CountApp extends StatelessWidget {
  const CountApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool theme = context.watch<ThemeProvider>().theme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavbar(),
      themeMode: theme ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
    );
  }
}
