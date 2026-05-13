import 'package:flutter/material.dart';
import 'package:narak_news/contant/app_theme.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;
  final String? subtitle;
  final bool isDark;

  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    this.value,
    this.subtitle,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppTheme.border(isDark))),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: AppTheme.primary.withAlpha(25),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, color: AppTheme.primary, size: 17),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.text(isDark),
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: TextStyle(fontSize: 11, color: AppTheme.sub(isDark)),
                  ),
              ],
            ),
          ),
          if (value != null)
            Text(
              value!,
              style: TextStyle(fontSize: 11, color: AppTheme.sub(isDark)),
            ),
        ],
      ),
    );
  }
}
