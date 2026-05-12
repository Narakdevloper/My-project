import 'package:flutter/material.dart';
import 'package:narak_news/providers/theme_provider.dart';
import 'package:narak_news/ui/count_app.dart';
import 'package:provider/provider.dart';

class StateProvider extends StatelessWidget {
  const StateProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
      child: CountApp(),
    );
  }
}
