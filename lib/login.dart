import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginApp extends StatelessWidget{
  const LoginApp({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginState(),
    );
  }

}

class LoginState extends StatefulWidget{
  const LoginState({super.key});


  @override
  LoginMain createState() => LoginMain();

}

class LoginMain extends State<LoginState>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
          ),
        backgroundColor: const Color.fromARGB(255, 76, 175, 163),
      ),
      body: Container(
        color: const Color.fromARGB(255, 168, 193, 205),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'asset/icons/application.png',
                width: 100.0,
                height: 100.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0,50.0,30.0,0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      hintText: "Enter Email Id:",
                      labelText: "Email Id",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0,20.0,30.0,0),
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      hintText: "Enter Password:",
                      labelText: "Password",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    color: const Color.fromARGB(255, 98, 75, 202),
                    width: 100.0,
                    height: 40.0,
                    child: TextButton(
                      onPressed: (){
                        print("Login Succesfull");
                        Fluttertoast.showToast(
                          msg:"Login Successfull",
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      },
                       child: Text(
                        "Login",
                       style: 
                       TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                        ),
                        ),
                       ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );

  }
}