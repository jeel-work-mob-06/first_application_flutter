import 'dart:async';

import 'package:first_application_flutter/bottomNav.dart';
import 'package:first_application_flutter/custom_list.dart';
import 'package:first_application_flutter/login.dart';
import 'package:first_application_flutter/navigationDemo.dart';
import 'package:first_application_flutter/tabDemo.dart';
import 'package:flutter/material.dart';


class SplashDemo extends StatelessWidget{

    @override
  Widget build(BuildContext context){

    return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: SplashState(),
    );
  }


}

class SplashState extends StatefulWidget{

  @override 
  SplashMain createState() => SplashMain();
}


class SplashMain extends State<SplashState>{

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimerMethod();
  }

  Future<Timer> startTimerMethod() async{

      return new Timer(
        Duration(seconds: 3,),()
        {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> BottomState()),);
        }
      );

  }

    @override
  Widget build(BuildContext context) {
    // TODO: implement build


      return Scaffold(
        body: Center(
          child: Container(
            child: Image.asset("asset/icons/application.png",width: 100.0,height: 100.0,),
          ),
        ),
      );
  }

}