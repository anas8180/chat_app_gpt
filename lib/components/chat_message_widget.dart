import 'package:chat_app_gpt/main.dart';
import 'package:chat_app_gpt/models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  final String text;
  final ChatMessageType chatMessageType;

  const ChatMessageWidget(
      {super.key, required this.text, required this.chatMessageType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      color: chatMessageType == ChatMessageType.bot
          ? botBackgroundColor
          : backgroundColor,
      child: Row(children: [
        chatMessageType == ChatMessageType.bot
            ? Container(
                margin: const EdgeInsets.only(right: 16),
                child: CircleAvatar(
                  backgroundColor: const Color.fromRGBO(16, 163, 127, 1),
                  child: Image.asset(
                    'assets/images/chatgpt_logo.png',
                    color: Colors.white,
                    scale: 1.5,
                  ),
                ),
              )
            : Container(
                margin: const EdgeInsets.only(right: 16),
                child: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
        Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white),
            )
          ],
        ))
      ]),
    );
  }
}
