import 'package:flutter/material.dart';

class StatusState extends StatefulWidget {

  @override
  StatusMain createState() => StatusMain();

}
class StatusMain extends State<StatusState> {

    @override
    Widget build(BuildContext context){
      //TODO: implement build
      return Scaffold(
        body: Container(
          color: Colors.green.shade100,
        ),
      );
    }
}

