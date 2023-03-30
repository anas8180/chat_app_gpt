import 'package:chat_app_gpt/screens/bottom_nav_screen.dart';
import 'package:chat_app_gpt/screens/chat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

const backgroundColor = Color(0xff343541);
const botBackgroundColor = Color(0xff444654);


