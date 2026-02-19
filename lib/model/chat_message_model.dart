enum MessageType { sender, receiver }

class ChatMessage {
  final String text;
  final MessageType type;
  final String? time;

  ChatMessage({required this.text, required this.type, this.time});
}