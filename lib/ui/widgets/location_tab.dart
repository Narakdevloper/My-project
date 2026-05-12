import 'package:flutter/material.dart';

class LocationTab extends StatelessWidget {
  final bool isDark;
  const LocationTab({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Location Tab'));
  }
}
