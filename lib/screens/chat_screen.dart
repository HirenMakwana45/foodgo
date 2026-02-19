import 'package:flutter/material.dart';

import '../components/chat_bubble.dart';
import '../model/chat_message_model.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), // Outer dark background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Customer support', style: TextStyle(color: Colors.grey)),
        leading: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, right: 30, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back, color: Colors.black),
                  Icon(Icons.menu, color: Colors.black),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ChatBubble(message: ChatMessage(text: "Hi, how can I help you?", type: MessageType.receiver)),
                  ChatBubble(message: ChatMessage(text: "Hello, I ordered two fried chicken burgers. can I know how much time it will get to arrive?", type: MessageType.sender)),
                  ChatBubble(message: ChatMessage(text: "Ok, please let me check!", type: MessageType.receiver)),
                  ChatBubble(message: ChatMessage(text: "Sure...", type: MessageType.sender)),
                ],
              ),
            ),
            // Input Area
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F8F8),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Type here...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF02E3E),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}