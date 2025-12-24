//import 'package:first_application_flutter/home.dart';
import 'package:first_application_flutter/sqliteHelper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SqliteApp extends StatelessWidget{
  const SqliteApp({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SqliteState(),
    );
  }

}

class SqliteState extends StatefulWidget{
  const SqliteState({super.key});


  @override
  SqliteMain createState() => SqliteMain();

}

class SqliteMain extends State<SqliteState>{

  GlobalKey<FormState> formKey = GlobalKey();
  late String sName,sEmail,sContact,sPassword;
  var dbHelper = SqliteDatabaseHelper();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sqlite",
          style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
          ),
        backgroundColor: const Color.fromARGB(255, 76, 175, 163),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        hintText: "Enter Name:",
                        labelText: "Name",
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Name Required";
                        }
                        else{
                          return null;
                        }
                      },
                      onSaved: (value){
                          sName = value!;
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
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      color: const Color.fromARGB(255, 98, 75, 202),
                      width: 100.0,
                      height: 40.0,
                      child: TextButton(
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            insertData(sName,sEmail,sContact,sPassword);
                          }
                        },
                         child: Text(
                          "Insert",
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
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            updateData(sName,sEmail,sContact,sPassword);
                          }
                        },
                         child: Text(
                          "Update",
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
                            deleteData(sContact);
                        },
                         child: Text(
                          "Delete",
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
                            showData();
                        },
                         child: Text(
                          "Show",
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
                            searchData(sContact);
                        },
                         child: Text(
                          "Search",
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

  void insertData(String sName,String sEmail,String sContact,String sPassword) async{
    Map<String,dynamic> rows = {
     SqliteDatabaseHelper.columnName:sName,
     SqliteDatabaseHelper.columnName:sEmail,
     SqliteDatabaseHelper.columnName:sContact,
     SqliteDatabaseHelper.columnName:sPassword 
    };

    final id = await dbHelper.insert(rows);
      Fluttertoast.showToast(
        msg: "Insert Successfully",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 3
        );
        print("Inserted Id : $id",);

  }

  void updateData(String sName,String sEmail,String sContact,String sPassword) async{
    Map<String,dynamic> rows = {
     SqliteDatabaseHelper.columnName:sName,
     SqliteDatabaseHelper.columnName:sEmail,
     SqliteDatabaseHelper.columnName:sPassword
    };

    final id = await dbHelper.update(rows,sContact);
      Fluttertoast.showToast(
        msg: "Update Successfully",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 3
        );
        print("Updated Id : $id",);

  }

  void deleteData(String sContact) async{
    
    final id = await dbHelper.delete(sContact);
      Fluttertoast.showToast(
        msg: "Delete Successfully",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 3
        );
        print("Deleted Id : $id",);

  }

  void showData() async{
    var listData = await dbHelper.getAllData();
    for (var i = 0; i <listData.length; i++) {
      print(listData[i]);
    }
  }
  void searchData(String sContact) async{
    var listData = await dbHelper.getSearchData(sContact);
    for (var i = 0; i <listData.length; i++) {
      print(listData[i]);
    }
  }
}