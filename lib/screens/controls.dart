import 'package:home_automation/components/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_automation/components/icon_content.dart';
import 'package:home_automation/components/reuseable_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:home_automation/components/networking.dart';

class Controls extends StatefulWidget {
  static const String id = 'controls';
  @override
  _ControlsState createState() => _ControlsState();
}

class _ControlsState extends State<Controls> {

  bool firstrun;
  String apikey;
  String deviceid;
  fetch() async {
    final SharedPreferences myPrefs = await SharedPreferences.getInstance();
    apikey = myPrefs.getString('apikey');
    deviceid = myPrefs.getString('deviceid');
    firstrun = myPrefs.getBool('firstrun');
    //print(firstrun);
    print(apikey);
    print(deviceid);
  }
  @override
  void initState() {
    super.initState();
    fetch();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(children: <Widget>[
                  Expanded(child: ListTile(
                     leading:
                        Icon(
                          Icons.device_hub,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Devices',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        ),
                    ),
                  )
                ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Row(children: <Widget>[
                  Expanded(
                    child: ReuseableCard(
                    colour: Colors.lightBlue,
                    cardChild: Icon_Data(
                      icon: FontAwesomeIcons.solidLightbulb,
                      text: 'Tubelight',
                    ),
                    onPress: () {
                        
                    },
                  )),
                  Expanded(
                      child: ReuseableCard(
                    colour: Colors.lightBlue,
                    cardChild: Icon_Data(
                      icon: FontAwesomeIcons.lightbulb,
                      text: 'Lamp',
                    ),
                    onPress: () {
                      //card tap action
                    },
                    )
                  ),
                  ]
                ),
              ),
              Expanded(
                flex:5,
                child: Row(children: <Widget>[
                  Expanded(
                    child: ReuseableCard(
                    colour: Colors.blueGrey,
                    cardChild: Icon_Data(
                      icon: FontAwesomeIcons.fan,
                      text: 'Fan - Coffee Table',
                    ),
                    onPress: () {
                      //card tap action
                    },
                  )),
                  Expanded(
                      child: ReuseableCard(
                    colour: Colors.blueGrey,
                    cardChild: Icon_Data(
                      icon: FontAwesomeIcons.fan,
                      text: 'Fan - Dining Table',
                    ),
                    onPress: () {
                      //card tap action
                    },
                    )
                  ),
                  ]
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(children: <Widget>[
                  Expanded(child: ListTile(
                     leading:
                        Icon(
                          Icons.schedule,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Scenes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        ),
                    ),
                  )
                ],
                ),
              ),
              Expanded(
                flex:5,
                child: Row(children: <Widget>[
                  Expanded(
                    child: ReuseableCard(
                    colour: Colors.blueGrey,
                    cardChild: Icon_Data(
                      icon: FontAwesomeIcons.film,
                      text: 'Movie',
                    ),
                    onPress: () {
                      //card tap action
                    },
                  )),
                  Expanded(
                      child: ReuseableCard(
                    colour: Colors.blueGrey,
                    cardChild: Icon_Data(
                      icon: FontAwesomeIcons.moon,
                      text: 'Night Light',
                    ),
                    onPress: () {
                      //card tap action
                    },
                    )
                  ),
                  ]
                ),
              ),
              Expanded(
                flex:2,
                  child: BottomButton(
                  () {
                  // Bottom Button Code
                  },
                 'Turn Off Everything!'),
              )
            ],
          ),
        )
      );
  }
}

