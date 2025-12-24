import 'package:flutter/material.dart';

class ChatState extends StatefulWidget {
  const ChatState({super.key});


  @override
  ChatMain createState() => ChatMain();

}
class ChatMain extends State<ChatState> {

    @override
    Widget build(BuildContext context){
      //TODO: implement build
      return Scaffold(
        body: Container(
          color: Colors.blue.shade100,
        ),
      );
    }
}

