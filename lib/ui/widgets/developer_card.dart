import 'package:flutter/material.dart';

class DeveloperCard extends StatelessWidget {
  final Color cardColor;
  final Color textColor;
  final Color subColor;

  const DeveloperCard({
    super.key,
    required this.cardColor,
    required this.textColor,
    required this.subColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE50914).withAlpha(77)),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE50914).withAlpha(51),
              border: Border.all(color: const Color(0xFFE50914), width: 1.5),
            ),
            child: Icon(Icons.person, color: const Color(0xFFE50914), size: 26),
          ),
          SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phannarak',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(color: subColor, fontSize: 12),
              ),
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFE50914).withAlpha(38),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE50914).withAlpha(102)),
            ),
            child: Text(
              'Developer',
              style: TextStyle(
                color: const Color(0xFFE50914),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
