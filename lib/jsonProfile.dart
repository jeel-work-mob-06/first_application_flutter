import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:first_application_flutter/constantSp.dart';
import 'package:first_application_flutter/jsonLogin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class JsonProfileState extends StatefulWidget{
  const JsonProfileState({super.key});

  @override
  JsonProfileMain createState() => JsonProfileMain();

}

class JsonProfileMain extends State<JsonProfileState>{

  GlobalKey<FormState> formKey = GlobalKey();
  late String sId,sFirstName,sLastName,sEmail,sContact, sPassword, sGender,sProfile;
  int iGroupValue = 4;
  var firstNameController,lastNameController,emailController,contactController;
  File? imageFile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  setData() async{
    var sp = await SharedPreferences.getInstance();
    setState(() {
      sId = sp.getString(Constantsp.USER_ID) ?? "";
      sFirstName = sp.getString(Constantsp.FIRSTNAME) ?? "";
      sLastName = sp.getString(Constantsp.LASTNAME) ?? "";
      sEmail = sp.getString(Constantsp.EMAIL) ?? "";
      sContact = sp.getString(Constantsp.CONTACT) ?? "";
      sGender = sp.getString(Constantsp.GENDER) ?? "";
      sProfile = sp.getString(Constantsp.PROFILE) ?? "";

      if(sGender == "Male"){
        iGroupValue = 0;
      } 
      else if(sGender == "Female"){
        iGroupValue = 1;
      }
      else if(sGender == "Trangender"){
        iGroupValue = 2;
      }
      else{
        iGroupValue = 0;
      }

      firstNameController = TextEditingController(text: sFirstName);
      lastNameController = TextEditingController(text: sLastName);
      emailController = TextEditingController(text: sEmail);
      contactController = TextEditingController(text: sContact);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Json Profile",
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey.shade200,
      ),
      backgroundColor: Colors.brown.shade100,
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    showAlertDialog(context);
                  },
                  child: imageFile == null ?
                    Image.asset(
                      'asset/icons/application.png',
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ):
                    Image.file(
                      imageFile!,
                      width: 100.0,
                      height: 100.0,
                    )
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                        child: TextFormField(
                          controller: firstNameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: "Enter First Name",
                            labelText: "First Name"
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "First Name Required";
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
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                        child: TextFormField(
                          controller: lastNameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: "Enter Last Name",
                            labelText: "Last Name"
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Last Name Required";
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
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: "Enter Email Id",
                            labelText: "Email Id"
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
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                        child: TextFormField(
                          controller: contactController,
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: "Enter Contact No.",
                            labelText: "Contact No."
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Contact No. Required";
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
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                        child: TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: "Enter Password",
                            labelText: "Password"
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Password Required";
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
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
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
                                        setGender(0,"Male");
                                      });
                                    }
                                  ),
                                  const Text(
                                    "Male",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
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
                                        setGender(1,"Female");
                                      });
                                    }
                                  ),
                                  const Text(
                                    "Female",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
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
                                        setGender(2,"Transgender");
                                      });
                                    }
                                  ),
                                  const Text(
                                    "Transgender",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          width: 150.0,
                          height: 40.0,
                          color: Colors.brown.shade400,
                          child: TextButton(
                            onPressed: () async {
                              if(formKey.currentState!.validate()){
                                formKey.currentState!.save();
                                var connectivity = await(Connectivity().checkConnectivity());
                                if(connectivity == ConnectivityResult.wifi || connectivity == ConnectivityResult.mobile){
                                  updateData(imageFile,sId,sFirstName,sLastName,sEmail,sContact,sPassword,sGender);
                                }
                              }
                            }, 
                            child: const Text(
                              "Update",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20.0),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          width: 150.0,
                          height: 40.0,
                          color: Colors.brown.shade400,
                          child: TextButton(
                            onPressed: () async {
                              var sp = await SharedPreferences.getInstance();
                              sp.clear();
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>JsonLoginState()));
                            }, 
                            child: const Text(
                              "Logout",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20.0),),
                          ),
                        ),
                      ),
                    ],
                  )
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context){

    Widget cancelButton = TextButton(
      onPressed: (){
        openCamera();
      }, 
      child: Text("Camera")
    );

    Widget continueButton = TextButton(
      onPressed: (){
        openGallery();
      }, 
      child: Text("Gallery")
    );

    AlertDialog alert = AlertDialog(
      title: Text("Select Application"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context){
        return alert;
      }
    );

  }

  openGallery() async{
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  openCamera() async{
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if(pickedFile != null){
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  void setGender(value,message){
    iGroupValue = value;
    sGender = message;
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM  
    );
  }

  updateData(File? imageFile, String id,String firstName,String lastName, String email, String contact, String password, String gender) async {
    var sp = await SharedPreferences.getInstance();
    var map = {
      "firstname" : firstName,
      "lastname" : lastName,
      "email" : email,
      "contact" : contact,
      "password" : password,
      "gender" : gender,
      "userid" : id
    };

    if(imageFile != null ){
      var length = await imageFile.length();
      Map<String,String> headerData = {"Accept":"application/json"};
      http.MultipartRequest request = http.MultipartRequest("POST",Uri.parse(Constantsp.UPDATE_IMAGE_URL))
      ..headers.addAll(headerData)
      ..fields.addAll(map)
      ..files.add(http.MultipartFile('file', imageFile.openRead(), length, filename: '$firstName.jpg'));

      var data = await http.Response.fromStream(await request.send());
      if(data.statusCode == 200){
          var jsonData = jsonDecode(data.body);
          if(jsonData["status"] == true){
            Fluttertoast.showToast(
              msg: jsonData["message"],
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM
            );
            
            sp.setString(Constantsp.FIRSTNAME,firstName);
            sp.setString(Constantsp.LASTNAME,lastName);
            sp.setString(Constantsp.EMAIL,email);
            sp.setString(Constantsp.CONTACT,contact);
            sp.setString(Constantsp.GENDER,gender);
            sp.setString(Constantsp.PROFILE,jsonData["Profile"]);

          }
          else{
            Fluttertoast.showToast(
              msg: jsonData["message"],
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM
            );
          }
      }
      else{
        Fluttertoast.showToast(
          msg: "Server Error Code : ${data.statusCode}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM
        );
      }
    }
    else{
      var data = await http.post(Uri.parse(Constantsp.UPDATE_URL),body: map);
      if(data.statusCode == 200){
          var jsonData = jsonDecode(data.body);
          if(jsonData["status"] == true){
            Fluttertoast.showToast(
              msg: jsonData["message"],
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM
            );
            
            sp.setString(Constantsp.FIRSTNAME,firstName);
            sp.setString(Constantsp.LASTNAME,lastName);
            sp.setString(Constantsp.EMAIL,email);
            sp.setString(Constantsp.CONTACT,contact);
            sp.setString(Constantsp.GENDER,gender);

          }
          else{
            Fluttertoast.showToast(
              msg: jsonData["message"],
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM
            );
          }
      }
      else{
        Fluttertoast.showToast(
          msg: "Server Error Code : ${data.statusCode}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM
        );
      }
    }

  }

}