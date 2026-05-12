import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int delay;
  final Color cardColor;
  final Color textColor;

  const FeatureItem({
    super.key,
    required this.icon,
    required this.label,
    required this.delay,
    required this.cardColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(bottom: 8),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(icon, color: const Color(0xFFE50914), size: 18),
              SizedBox(width: 12),
              Text(label, style: TextStyle(color: textColor, fontSize: 13)),
              Spacer(),
              Icon(Icons.check_circle, color: Colors.green, size: 16),
            ],
          ),
        )
        .animate()
        .fadeIn(delay: Duration(milliseconds: delay))
        .slideX(begin: 0.1, end: 0);
  }
}
