import 'package:flutter/material.dart';

class CustomListState extends StatefulWidget {

  @override
  CustomListMain createState() => CustomListMain();

}
class CustomListMain extends State<CustomListState> {

    @override
    Widget build(BuildContext context){
      //TODO: implement build
      return Scaffold(
        appBar: AppBar(

           title: Text(
          "CustomList",
          style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
          ),
        backgroundColor: const Color.fromARGB(255, 76, 175, 163),        
        ),
        body: CustomListDesign(),
      );
    }
}

class CustomListDesign extends StatelessWidget{

   List<String> titleArray = ["Gold","Silver","Bronze"];
  List<String> imageArray = ["gold.png","silver.png","bronze.png"];
  String imagePath = "asset/icons/";


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

      return ListView.builder(
        itemCount: titleArray.length,
        itemBuilder: (context, position) {
          return Padding(
            padding: EdgeInsets.all(10.0),
            child: Card(
              elevation: 3.0,
              child: Padding(
                padding: EdgeInsets.all(3.0),
                child: Row(children: [
                  Image.asset(imagePath+imageArray[position],width: 100.0,height: 100.0,),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(titleArray[position]),
                  ),
                ],),
              ),
            ),
            
            );

        },
      );
  }
}