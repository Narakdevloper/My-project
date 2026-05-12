import 'package:flutter/material.dart';

class StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color cardColor;
  final Color subColor;

  const StatChip({
    super.key,
    required this.icon,
    required this.label,
    required this.cardColor,
    required this.subColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: subColor, size: 14),
          SizedBox(width: 6),
          Text(label, style: TextStyle(color: subColor, fontSize: 12)),
        ],
      ),
    );
  }
}
