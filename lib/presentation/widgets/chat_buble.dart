import 'package:flutter/material.dart';

import '../screens/chat_screen/message_model/message.dart';

class CustomChatBubble extends StatelessWidget {
  const CustomChatBubble({Key? key, required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: Colors.deepPurple.withOpacity(0.5),
        ),
        child: Text(
          message.text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class CustomChatBubbleForForDoc extends StatelessWidget {
  const CustomChatBubbleForForDoc({Key? key, required this.message})
      : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Colors.blueGrey.withOpacity(0.5),
        ),
        child: Text(
          message.text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
