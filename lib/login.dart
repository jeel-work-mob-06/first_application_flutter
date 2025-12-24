//import 'package:first_application_flutter/home.dart';
import 'package:first_application_flutter/home.dart';
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

  GlobalKey<FormState> formKey = GlobalKey();
  late String sEmail,sPassword;

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
                Form(
                  key: formKey,
                  child: Column(
                  children: [
                    Padding(
                  padding: const EdgeInsets.fromLTRB(30.0,50.0,30.0,0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      hintText: "Enter Email Id:",
                      labelText: "Email Id",
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Email Id required";
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (value){
                        sEmail = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0,20.0,30.0,0),
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      hintText: "Enter Password:",
                      labelText: "Password",
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Password required";
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (value){
                      sPassword = value!;
                    },
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
                        if(formKey.currentState!.validate()){
                          formKey.currentState!.save();
                            print("Login Succesfull .\nEmail : $sEmail, Password: $sPassword");
                            Fluttertoast.showToast(
                            msg:"Login Successfull",
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT
                          );
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (_) => HomeState(sEmail, sPassword)
                            )
                          );
                        
                          // Navigator.push(
                          //   context, MaterialPageRoute(
                          //     builder: (_) => CustomListState()
                          //   )
                          // );
                        }
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
            ],
          ),
        ),
      ),
    );
  }
}