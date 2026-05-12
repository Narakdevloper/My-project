import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RowItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final int delay;
  final Color cardColor;
  final Color textColor;
  final Color subColor;

  const RowItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.delay,
    required this.cardColor,
    required this.textColor,
    required this.subColor,
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
              Icon(icon, color: Colors.grey, size: 18),
              SizedBox(width: 12),
              Text(label, style: TextStyle(color: subColor, fontSize: 13)),
              Spacer(),
              Text(
                value,
                style: TextStyle(
                  color: textColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(delay: Duration(milliseconds: delay))
        .slideX(begin: 0.1, end: 0);
  }
}
