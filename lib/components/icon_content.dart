import 'package:flutter/material.dart';
import 'package:home_automation/constants.dart';
class Icon_Data extends StatelessWidget {

  Icon_Data({this.icon, this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget>[
        Icon(icon,size: 80.0,),
        SizedBox(height: 30.0,),
        Text(text,style:labelTextStyle,), 
        ]
      );
  }
}
