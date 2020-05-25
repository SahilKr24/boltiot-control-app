import 'package:home_automation/constants.dart';
import 'package:flutter/material.dart';


class BottomButton extends StatelessWidget {
  BottomButton(this.onTap, this.buttonText);
  final Function onTap;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              buttonText,
              style: largeButtonTextStyle,
            ),
          ],
        ),
        color: bottomCardColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}