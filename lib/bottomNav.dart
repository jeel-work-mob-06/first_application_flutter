import 'package:first_application_flutter/call.dart';
import 'package:first_application_flutter/chat.dart';
import 'package:first_application_flutter/status.dart';
import 'package:flutter/material.dart';

class BottomState extends StatefulWidget{

  @override
  BottomMain createState() => BottomMain();

}
 
class BottomMain extends State<BottomState>{

  
  var tabArray = [ChatState(),StatusState(),CallState()];
  var selectedIndex=0;

    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        title: Text(
          "Bottom Navigation",
          style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
          ),
        backgroundColor: const Color.fromARGB(255, 76, 175, 163),
      ),
      body: tabArray[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: "Profile"
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: "Logout"
            ),
        ] ,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        ),
      ), 
    );


  }
}