import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 20,),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Write Message......',
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(onPressed: (){},child: Icon(Icons.send,color: Colors.white,size: 18,),backgroundColor: Colors.blue,elevation: 0,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // AppBar Widget
  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
              SizedBox(width: 2,),
              CircleAvatar(
                backgroundImage: NetworkImage('http://xsgames.co/randomusers/assets/avatars/male/1.jpg'),
                maxRadius: 30,
              ),
              SizedBox(width: 12,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Kriss Benwat",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                  SizedBox(height: 6,),
                  Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
