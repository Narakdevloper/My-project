import 'package:flutter/material.dart';
import 'package:narak_news/providers/theme_provider.dart';
import 'package:narak_news/ui/count_app.dart';
import 'package:provider/provider.dart';

Widget Stateprovider() {
  return MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
    child: CountApp(),
  );
}
