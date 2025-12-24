import 'dart:convert';

import 'package:first_application_flutter/JsonSignup.dart';
import 'package:first_application_flutter/jsonProfile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'constantSp.dart';
import 'package:shared_preferences/shared_preferences.dart';


class JsonLoginState extends StatefulWidget{
  const JsonLoginState({super.key});


  @override
  JsonLoginMain createState() => JsonLoginMain();

}

class JsonLoginMain extends State<JsonLoginState>{

  GlobalKey<FormState> formKey = GlobalKey();
  late String sEmail,sPassword;
  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "JsonLogin",
          style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
          ),
        backgroundColor: const Color.fromARGB(255, 76, 175, 163),
      ),
      backgroundColor:const Color.fromARGB(255, 168, 193, 205), 
      body: SingleChildScrollView(
        child: Container(
          //color: const Color.fromARGB(255, 168, 193, 205),
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
                          return "Email Id Required";
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
                           // insertData(sName,sEmail,sContact,sPassword);
                           loginUser(sEmail,sPassword);
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      color: const Color.fromARGB(255, 98, 75, 202),
                      width: 100.0,
                      height: 40.0,
                      child: TextButton(
                        onPressed: (){
                            formKey.currentState!.save();
                           // insertData(sName,sEmail,sContact,sPassword);
                           Navigator.push(context, MaterialPageRoute(builder: (_)=>JsonSignupState()));
                          
                        },
                         child: Text(
                          "Signup",
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
      ),
    );
  }

  loginUser(String email, String password) async {

  var map = {
    "email": email,
    "password": password,
  };

  var response = await http.post(
    Uri.parse(Constantsp.Login_URL),
    body: map,
  );

  print("Status Code: ${response.statusCode}");
  print("Response Body: ${response.body}");

  if (response.statusCode == 200) {
    try {
      var jsonData = jsonDecode(response.body);

      Fluttertoast.showToast(
        msg: jsonData["Message"] ?? jsonData["message"] ?? "Login response",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      // ✅ SUCCESS CHECK (handles Status / status)
      bool isSuccess =
          jsonData["Status"] == true ||
          jsonData["status"] == true ||
          jsonData["Status"] == "true" ||
          jsonData["status"] == "true";

      if (isSuccess) {

        var sp = await SharedPreferences.getInstance();

        // ✅ HANDLE UserData or data
        var userData;
        if (jsonData["UserData"] != null) {
          userData = jsonData["UserData"][0];
        } else if (jsonData["data"] != null) {
          userData = jsonData["data"];
        } else {
          Fluttertoast.showToast(msg: "Invalid user data");
          return;
        }

        // ✅ NULL SAFE VALUES
        String userId    = userData["userid"]?.toString() ?? '';
        String firstName = userData["first_name"]?.toString() ?? '';
        String lastName  = userData["last_name"]?.toString() ?? '';
        String email     = userData["email"]?.toString() ?? '';
        String contact   = userData["contact"]?.toString() ?? '';
        String gender    = userData["gender"]?.toString() ?? '';
        String profile   = userData["profile"]?.toString() ?? '';

        // ✅ SAVE SESSION
        await sp.setString(Constantsp.USER_ID, userId);
        await sp.setString(Constantsp.FIRSTNAME, firstName);
        await sp.setString(Constantsp.LASTNAME, lastName);
        await sp.setString(Constantsp.EMAIL, email);
        await sp.setString(Constantsp.CONTACT, contact);
        await sp.setString(Constantsp.GENDER, gender);
        await sp.setString(Constantsp.PROFILE, profile);

        // ✅ REDIRECT TO PROFILE
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const JsonProfileState()),
        );
      }

    } catch (e) {
      Fluttertoast.showToast(
        msg: "Invalid server response",
        toastLength: Toast.LENGTH_LONG,
      );
      print("JSON ERROR: $e");
    }
  } else {
    Fluttertoast.showToast(
      msg: "Server Error Code : ${response.statusCode}",
      toastLength: Toast.LENGTH_LONG,
    );
  }
}

}