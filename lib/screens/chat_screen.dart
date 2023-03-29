import 'dart:convert';
import 'package:chat_app_gpt/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../components/chat_message_widget.dart';
import '../main.dart';
import '../models/chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late bool isLoading;
  final TextEditingController _textEditingController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  Future<String> generateResponse(String prompt) async {
    const apiKey = chatGptAPIKey;
    var url = Uri.https('api.openai.com', '/v1/completions');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/Json',
          'Authorization': 'Bearer $apiKey'
        },
        body: jsonEncode({
          "model": "text-davinci-003",
          "prompt": prompt,
          "max_tokens": 2000,
          "temperature": 0,
          "top_p": 1,
          "n": 1,
          "frequency_penalty": 0.0,
          "presence_penalty": 0.0
        }));

    Map<String, dynamic> newResponse = jsonDecode(response.body);
    return newResponse['choices'][0]['text'];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        title: const Text(
          'Chat BOT',
          textAlign: TextAlign.center,
        ),
        backgroundColor: botBackgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: Column(children: [
        Expanded(child: _buildLists()),
        Visibility(
            visible: isLoading,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [_buildInput(), _buildSubmit()],
          ),
        )
      ]),
    ));
  }

  Expanded _buildInput() {
    return Expanded(
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(color: Colors.white),
        controller: _textEditingController,
        decoration: const InputDecoration(
            fillColor: botBackgroundColor,
            filled: true,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none),
      ),
    );
  }

  Widget _buildSubmit() {
    return Visibility(
      visible: !isLoading,
      child: Container(
        color: botBackgroundColor,
        child: IconButton(
          icon: const Icon(
            Icons.send_rounded,
            color: Color.fromRGBO(142, 142, 160, 1),
          ),
          onPressed: () {
            // Dsiplay user input
            setState(() {
              _messages.add(ChatMessage(_textEditingController.text, ChatMessageType.user));
              isLoading = true;
            });
            var input = _textEditingController.text;
            _textEditingController.clear();
            Future.delayed(const Duration(milliseconds: 50)).then((value) => _scrollDown());

            // Call ChatGPT API
            generateResponse(input).then((value) {
              setState(() {
                // Display bot output
                _messages.add(ChatMessage(value, ChatMessageType.bot));
                isLoading = false;
              });
            });
            _textEditingController.clear();
            Future.delayed(const Duration(milliseconds: 50)).then((value) => _scrollDown());
          },
        ),
      ),
    );
  }

  void _scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  ListView _buildLists() {
    return ListView.builder(
        itemCount: _messages.length,
        controller: _scrollController,
        itemBuilder: ((context, index) {
          var message = _messages[index];
          return ChatMessageWidget(
            chatMessageType: message.chatMessageType,
            text: message.text,
          );
        }));
  }
}
