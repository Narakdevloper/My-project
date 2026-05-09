import 'package:flutter/material.dart';
import 'package:narak_news/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool theme = context.watch<ThemeProvider>().theme;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Center(
        child: IconButton(
          onPressed: () {
            context.read<ThemeProvider>().thememode();
          },
          icon: Icon(theme ? Icons.light_mode : Icons.dark_mode),
        ),
      ),
    );
  }
}
