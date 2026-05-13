import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:narak_news/contant/app_theme.dart';
import 'package:narak_news/ui/widgets/section_title.dart';

class AiTab extends StatelessWidget {
  final bool isDark;
  final String aiResponse;
  final bool aiLoading;
  final TextEditingController aiInput;
  final VoidCallback onSend;

  const AiTab({
    super.key,
    required this.isDark,
    required this.aiResponse,
    required this.aiLoading,
    required this.aiInput,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            title: 'AI ASSISTANT',
            isDark: isDark,
          ).animate().fadeIn(delay: 80.ms).slideX(begin: -0.1, end: 0),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.card(isDark),
              borderRadius: BorderRadius.circular(14),
              border: Border(
                left: BorderSide(color: AppTheme.primary, width: 3),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'CINEMAX AI',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                        color: AppTheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                aiLoading
                    ? Row(
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppTheme.primary,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Thinking...',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppTheme.sub(isDark),
                            ),
                          ),
                        ],
                      )
                    : Text(
                        aiResponse,
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.55,
                          color: AppTheme.text(isDark),
                        ),
                      ),
              ],
            ),
          ).animate().fadeIn(delay: 120.ms).slideY(begin: 0.15, end: 0),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: aiInput,
                  style: TextStyle(fontSize: 13, color: AppTheme.text(isDark)),
                  decoration: InputDecoration(
                    hintText: 'Ask about movies or branches...',
                    hintStyle: TextStyle(
                      color: AppTheme.hint(isDark),
                      fontSize: 13,
                    ),
                    filled: true,
                    fillColor: AppTheme.card(isDark),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppTheme.border(isDark)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppTheme.border(isDark)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppTheme.primary),
                    ),
                  ),
                  onSubmitted: (_) => onSend(),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onSend,
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ).animate().fadeIn(delay: 160.ms),
        ],
      ),
    );
  }
}
