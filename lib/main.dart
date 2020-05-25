import 'dart:io';
import 'package:flutter/material.dart';
import 'screens/credentials.dart';
import 'screens/controls.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() => runApp(Automation());

class Automation extends StatefulWidget {
  @override
  _AutomationState createState() => _AutomationState();
}

class _AutomationState extends State<Automation> {

  bool firstrun;
   getState() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    firstrun = sharedPrefs.getBool('firstrun') ?? true ;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute:Controls.id,
      routes: {
        Credentials.id:(context)=> Credentials(),
        Controls.id:(context)=> Controls(),
      },
    );
  }
}


 
