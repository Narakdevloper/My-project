import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String label;

  const InfoRow({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label);
  }
}
