import 'package:flutter/material.dart';

class LoginApp extends StatelessWidget{
  const LoginApp({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
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
        title: Text("Login"),
        backgroundColor: const Color.fromARGB(255, 76, 175, 163),
      ),
      body: Container(),
    );

  }
}