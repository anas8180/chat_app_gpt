import 'package:chat_app_gpt/screens/chat_list_screen.dart';
import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ChatListPage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chats'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.group_work),
              label: 'Channels'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Profile'
          )
        ],
      ),
    );
  }
}
