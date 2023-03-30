import 'package:chat_app_gpt/components/chat_conversation_widget.dart';
import 'package:chat_app_gpt/models/chat_user_model.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {

  List<ChatUser> chatUsers = [
    ChatUser(name: "Jane Russel", messageText: "Awesome Setup", imageURL: "http://xsgames.co/randomusers/assets/avatars/male/1.jpg", time: "Now"),
    ChatUser(name: "Glady's Murphy", messageText: "That's Great", imageURL: "http://xsgames.co/randomusers/assets/avatars/male/0.jpg", time: "Yesterday"),
    ChatUser(name: "Jorge Henry", messageText: "Hey where are you?", imageURL: "http://xsgames.co/randomusers/assets/avatars/male/2.jpg", time: "31 Mar"),
    ChatUser(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", imageURL: "http://xsgames.co/randomusers/assets/avatars/male/4.jpg", time: "28 Mar"),
    ChatUser(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", imageURL: "http://xsgames.co/randomusers/assets/avatars/male/5.jpg", time: "23 Mar"),
    ChatUser(name: "Jacob Pena", messageText: "will update you in evening", imageURL: "http://xsgames.co/randomusers/assets/avatars/male/6.jpg", time: "17 Mar"),
    ChatUser(name: "Andrey Jones", messageText: "Can you please share the file?", imageURL: "http://xsgames.co/randomusers/assets/avatars/male/7.jpg", time: "24 Feb"),
    ChatUser(name: "John Wick", messageText: "How are you?", imageURL: "http://xsgames.co/randomusers/assets/avatars/male/8.jpg", time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                         children: [
                           Icon(Icons.add,color: Colors.pink,size: 20,),
                           SizedBox(width: 2,),
                           Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                         ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ChatConversation(
                    name: chatUsers[index].name,
                    messageText: chatUsers[index].messageText,
                    imageURL: chatUsers[index].imageURL,
                    time: chatUsers[index].time,
                    isMessageRead: index > 2 ? true : false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
