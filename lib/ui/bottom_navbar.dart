import 'package:flutter/material.dart';
import 'package:narak_news/contant/app_theme.dart';
import 'package:narak_news/providers/theme_provider.dart';
import 'package:narak_news/ui/screens/aboutus_screen.dart';
import 'package:narak_news/ui/screens/home_screen.dart';
import 'package:narak_news/ui/screens/search_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().theme;

    return PersistentTabView(
      backgroundColor: AppTheme.navBg(isDark),
      tabs: [
        PersistentTabConfig(
          screen: HomeScreen(),
          item: ItemConfig(
            icon: Icon(Icons.movie_rounded),
            title: 'Home',
            activeForegroundColor: AppTheme.primary,
            inactiveForegroundColor: AppTheme.icon(isDark),
          ),
        ),
        PersistentTabConfig(
          screen: SearchScreen(),
          item: ItemConfig(
            icon: Icon(Icons.search_rounded),
            title: 'Search',
            activeForegroundColor: AppTheme.primary,
            inactiveForegroundColor: AppTheme.icon(isDark),
          ),
        ),
        PersistentTabConfig(
          screen: AboutusScreen(),
          item: ItemConfig(
            icon: Icon(Icons.info),
            title: 'Setting',
            activeForegroundColor: AppTheme.primary,
            inactiveForegroundColor: AppTheme.icon(isDark),
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: AppTheme.navBg(isDark),
          border: Border(
            top: BorderSide(color: AppTheme.border(isDark), width: 0.5),
          ),
        ),
      ),
    );
  }
}
