import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NavigationState extends StatefulWidget{

  @override
  NavigationMain createState() => NavigationMain();
}

class NavigationMain extends State<NavigationState>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        title: Text(
          "Navigation Drawer",
          style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
          ),
        backgroundColor: const Color.fromARGB(255, 76, 175, 163),
      ),
      drawer: Drawer(
          child: new ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Username"),
                accountEmail: Text("username@gmail.com"),
                currentAccountPicture: Icon(Icons.verified_user),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: (){
                  showMessage("Home");
                },
              ),
              ListTile(
                leading: Icon(Icons.verified_user),
                title: Text("Profile"),
                onTap: (){
                  showMessage("Profile");
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: (){
                  showMessage("Logout");
                },
              ),
            ],
          ),
        ),
      ),
    );

  }
  
  showMessage(message) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM
      );
  }

}