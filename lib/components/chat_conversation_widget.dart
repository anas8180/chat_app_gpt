import 'package:flutter/material.dart';

class ChatConversation extends StatefulWidget {
  final String name;
  final String messageText;
  final String imageURL;
  final String time;
  final bool isMessageRead;

  const ChatConversation({Key? key, required this.name, required this.messageText, required this.imageURL, required this.time, required this.isMessageRead}) : super(key: key);

  @override
  State<ChatConversation> createState() => _ChatConversationState();
}

class _ChatConversationState extends State<ChatConversation> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.imageURL),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name, style: TextStyle(fontSize: 16),),
                        SizedBox(height: 16,),
                        Text(widget.messageText, style:TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Text(widget.time,style: TextStyle(fontSize: 12, fontWeight: widget.isMessageRead ? FontWeight.normal : FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
