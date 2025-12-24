import 'package:first_application_flutter/call.dart';
import 'package:first_application_flutter/chat.dart';
import 'package:first_application_flutter/status.dart';
import 'package:flutter/material.dart';

class TabState extends StatefulWidget{
  const TabState({super.key});


  @override
  TabMain createState() => TabMain();
}

class TabMain extends State<TabState> with SingleTickerProviderStateMixin {

  late TabController tabController;
  var tabArray = [ChatState(),StatusState(),CallState()];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: tabArray.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        title: Text(
          "TabBar",
          style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
          ),
        backgroundColor: const Color.fromARGB(255, 76, 175, 163),
        bottom: getTabView(),
      ),
      body: getTabPage(),
      ),
    );
  }

  TabBar getTabView(){
    return TabBar(tabs:[
      Tab(text: "Chat",),
      Tab(text: "Status",),
      Tab(text: "Call",),
    ],
    controller: tabController,
    );
  }

  TabBarView getTabPage(){
    return TabBarView(
      controller: tabController,
      children: tabArray,
    );
  }
}