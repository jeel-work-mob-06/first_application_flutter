import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'constantSp.dart';
class JsonSignupState extends StatefulWidget{
  const JsonSignupState({super.key});


  @override
  JsonSignupMain createState() => JsonSignupMain();

}

class JsonSignupMain extends State<JsonSignupState>{

  GlobalKey<FormState> formKey = GlobalKey();
  late String sFirstName,sLastName,sEmail,sContact,sPassword,sGender;
  int iGroupValue = 4;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "JsonSignup",
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
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        hintText: "Enter FirstName:",
                        labelText: "FirstName",
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "FirstName Required";
                        }
                        else{
                          return null;
                        }
                      },
                      onSaved: (value){
                          sFirstName = value!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0,50.0,30.0,0),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        hintText: "Enter LastName:",
                        labelText: "LastName",
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "LastName Required";
                        }
                        else{
                          return null;
                        }
                      },
                      onSaved: (value){
                          sLastName = value!;
                      },
                    ),
                  ),
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
                    padding: const EdgeInsets.fromLTRB(30.0,50.0,30.0,0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        hintText: "Enter ContactNo.:",
                        labelText: "ContactNo.",
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Contact Required";
                        }
                        else{
                          return null;
                        }
                      },
                      onSaved: (value){
                          sContact = value!;
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
                padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                                   children: [
                    Radio(
                      value: 0,
                      groupValue: iGroupValue,
                      onChanged: (value){
                    
                          setState(() {
                            iGroupValue = 0;
                            setGender(0,"Male");
                          });
                          
                      }
                      ),
                      Text("Male",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                                  ],
                                ),
                  ),
                            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: iGroupValue,
                      onChanged: (value){
                
                          setState(() {
                            iGroupValue = 1;
                            setGender(1,"Female");
                          });
                          
                      }
                      ),
                      Text("Female",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                  ],
                ),
                            ),
                            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: iGroupValue,
                      onChanged: (value){
                
                          setState(() {
                            iGroupValue = 2;
                            setGender(2,"Transgender");
                          });
                          
                      }
                      ),
                      Text("Transgender",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                  ],
                ),
                            ),
                
                            ],
                            ),
              ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      color: const Color.fromARGB(255, 98, 75, 202),
                      width: 100.0,
                      height: 40.0,
                      child: TextButton(
                        onPressed: () async{
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            //var connectivity = await(Connectivity().checkConnectivity());
                            //if(connectivity == ConnectivityResult.wifi || connectivity == ConnectivityResult.mobile){
                              insertData(sFirstName,sLastName,sEmail,sContact,sPassword,sGender);
                            //}
                          }
                        },
                         child: Text(
                          "SignUp",
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

  void setGender(value,message){

    iGroupValue = value;
    sGender = message;
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER
    );

  }
  
  Future<void> insertData(String firstname, String lastname, String email,
    String contact, String password, String gender) async {

  var map = {
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "contact": contact, 
    "password": password,
    "gender": gender,
  };

  var response = await http.post(
    Uri.parse(Constantsp.SIGNUP_URL),
    body: map,
  );

  print("Status Code: ${response.statusCode}");
  print("Response Body: ${response.body}");

  if (response.statusCode == 200) {
    try {
      var jsonData = jsonDecode(response.body);

      Fluttertoast.showToast(
        msg: jsonData["Message"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      if (jsonData["Status"] == true) {
        Navigator.pop(context);
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