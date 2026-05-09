import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:narak_news/ui/screens/home_screen.dart';
import 'package:narak_news/ui/screens/search_screen.dart';
import 'package:narak_news/ui/screens/setting_sreen.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      backgroundColor: const Color(0xFF0D0D14),
      tabs: [
        PersistentTabConfig(
          screen: HomeScreen(),
          item: ItemConfig(
            icon: Icon(Icons.movie_rounded),
            title: 'Home',
            activeForegroundColor: const Color(0xFFE50914),
            inactiveForegroundColor: Colors.white24,
          ),
        ),
        PersistentTabConfig(
          screen: SearchScreen(),
          item: ItemConfig(
            icon: Icon(Icons.search_rounded),
            title: 'Search',
            activeForegroundColor: const Color(0xFFE50914),
            inactiveForegroundColor: Colors.white24,
          ),
        ),
        PersistentTabConfig(
          screen: SettingScreen(),
          item: ItemConfig(
            icon: Icon(Icons.settings_rounded),
            title: 'Setting',
            activeForegroundColor: const Color(0xFFE50914),
            inactiveForegroundColor: Colors.white24,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: const Color(0xFF0D0D14),
          border: Border(top: BorderSide(color: Colors.white10, width: 0.5)),
        ),
      ),
    );
  }
}
