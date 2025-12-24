import 'package:flutter/material.dart';

class ListState extends StatefulWidget {
  const ListState({super.key});


  @override
  ListMain createState() => ListMain();


}

class ListMain extends State<ListState>{

  List<String> titleArray = ["Gold","Silver","Bronze"];
  List<String> subTitleArray = ["Gold Description","Silver Decription","Bronze Decription"];
  List<String> imageArray = ["gold.png","silver.png","bronze.png"];
  String imagePath = "asset/icons/";

    @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(
        appBar: AppBar(
            title: Text(
          "List",
          style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
          ),
        backgroundColor: const Color.fromARGB(255, 76, 175, 163),

        ),
        body: 
        ListView.builder(
          itemCount: titleArray.length,
          itemBuilder: (context,position){
              return ListTile(
                title: Text(titleArray[position]),
                subtitle: Text(subTitleArray[position]),
                leading: Image.asset(imagePath+imageArray[position]),
              );
          }
       ),
      );
  }
}