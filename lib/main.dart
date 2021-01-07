import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/screens/more_screen.dart';

import 'package:plant_app/widget/bottom_bar.dart';
import 'package:plant_app/screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'',
      theme:ThemeData(
        brightness: Brightness.dark,
        primaryColor:Colors.black,
        accentColor:Colors.white,
      ),
      home:DefaultTabController(
        length:4,
        child:Scaffold(
          body:TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children:[
              HomeScreen(),
              Container(
                child:Center(
                  child:Text('Search'),
                ),
              ),
              Container(
                child:Center(
                  child:Text('Save'),
                ),
              ),
              MoreScreen(),
            ],
          ),
          bottomNavigationBar:BottomBar(),
        ),
      ),
    );
  }
}
