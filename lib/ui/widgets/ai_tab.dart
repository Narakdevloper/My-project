import 'package:flutter/material.dart';

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
    return Column(
      children: [
        Text(aiResponse),
        TextField(controller: aiInput),
        ElevatedButton(onPressed: onSend, child: const Text("Send")),
      ],
    );
  }
}
