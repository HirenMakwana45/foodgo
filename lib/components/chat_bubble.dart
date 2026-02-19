import 'package:flutter/material.dart';
import 'package:testapp/utils/app_common.dart';
import 'package:testapp/utils/app_images.dart';

import '../model/chat_message_model.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    bool isSender = message.type == MessageType.sender;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSender) ...[
            const CircleAvatar(
              backgroundColor: Color(0xFF333333),
              child: Icon(Icons.person, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 10),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isSender ? const Color(0xFFF02E3E) : const Color(0xFFF1F1F1),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: Radius.circular(isSender ? 20 : 0),
                  bottomRight: Radius.circular(isSender ? 0 : 20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: isSender ? Colors.white : Colors.black87,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          if (isSender) ...[
            const SizedBox(width: 10),
             CircleAvatar(
              child: cachedImage(icProfile), // Replace with your asset
            ),
          ],
        ],
      ),
    );
  }
}