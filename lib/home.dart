import 'package:flutter/material.dart';

class HomeState extends StatefulWidget{ 

  String sEmail,sPassword;
  HomeState(this.sEmail,this.sPassword);

      @override
      HomeMain createState() => HomeMain();
}

class HomeMain extends State<HomeState>{

      @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home", 
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 76, 175, 163),
      ),
      body: Container(
        color: const Color.fromARGB(255, 168, 193, 205),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                flex: 1,
                child: Container(
                color: Colors.blue.shade200,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Email id :",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  ),
                ),
                            ),
              ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.blue.shade300,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(widget.sEmail,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                ),
              ),
            ),

            ],),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                                  color: Colors.blue.shade200,
                                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Password :",
                    style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  ),
               ),
             ),
                  ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue.shade300,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(widget.sPassword,
                      style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  ),
                  ),
                  ),
                ),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}