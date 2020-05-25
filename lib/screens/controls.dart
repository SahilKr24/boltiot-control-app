import 'package:home_automation/components/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_automation/components/icon_content.dart';
import 'package:home_automation/components/reuseable_card.dart';
import 'package:home_automation/components/networking.dart' as networking;
import 'package:flushbar/flushbar.dart';

class Controls extends StatefulWidget {
  static const String id = 'controls';
  @override
  _ControlsState createState() => _ControlsState();
}

class _ControlsState extends State<Controls> {

  List<bool> active = [false,false,false,false,false,false,false];

  showError(var res){
    Flushbar(
      blockBackgroundInteraction: true,
      title:"Some Error Occured!",
      message:res['value'],
        icon: Icon(FontAwesomeIcons.exclamationTriangle, color: Colors.red),
      duration:Duration(seconds: 3),              
    )..show(context);
  }

  toggleActive(int index) async {
    var res = await networking.getData(index, active[index] ? "LOW" : "HIGH");
      if(res['success']==1){
        setState(() {
        active[index] = !active[index];
        active[5]=false;active[6]=false;
      });
    }
    else{
      showError(res);
    }
    
  }
  toggleScene(int index) async {
    if(index == 0){
     var res = await networking.getMultiData('1,2,3,4','LOW,HIGH,LOW,LOW');
     if(res['success']==1){
       setState(() {
        active[1]=false;active[2]=true;active[3]=false;active[4]=false;active[5]=false;active[6]=true;
      });
     }
     else{
      showError(res);
     } 
    }
    if(index == 1){
      var res = await networking.getMultiData('1,2,3,4','HIGH,LOW,HIGH,LOW');
      if(res['success']==1){
      setState(() {
        active[1]=true;active[2]=false;active[3]=true;active[4]=false;active[5]=true;active[6]=false;
      }); 
      }
      else{
      showError(res);
    }
    }
    
  }

  killAll() async {
     var res = await networking.getMultiData('1,2,3,4','LOW,LOW,LOW,LOW');
      if(res ==1){
        setState(() {
        active[1]=false;active[2]=false;active[3]=false;active[4]=false;active[5]=false;active[6]=false;
      }); 
    }
    else{
      showError(res);
    }  
  }

  @override
  void initState() {
    networking.fetch();
    super.initState();
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
                    colour: active[1] ? Colors.lightBlue: Colors.blueGrey,
                    cardChild: Icon_Data(
                      icon: FontAwesomeIcons.solidLightbulb,
                      text: 'Tubelight',
                    ),
                    onPress: () {
                        toggleActive(1);
                    },
                  )),
                  Expanded(
                      child: ReuseableCard(
                    colour: active[2] ? Colors.lightBlue: Colors.blueGrey,
                    cardChild: Icon_Data(
                      icon: FontAwesomeIcons.lightbulb,
                      text: 'Lamp',
                    ),
                    onPress: () {
                      //card tap action
                      toggleActive(2);
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
                    colour: active[3] ? Colors.lightBlue: Colors.blueGrey,
                    cardChild: Icon_Data(
                      icon: FontAwesomeIcons.fan,
                      text: 'Fan - Coffee Table',
                    ),
                    onPress: () {
                      //card tap action
                      toggleActive(3);
                    },
                  )),
                  Expanded(
                      child: ReuseableCard(
                    colour: active[4] ? Colors.lightBlue: Colors.blueGrey,
                    cardChild: Icon_Data(
                      icon: FontAwesomeIcons.fan,
                      text: 'Fan - Dining Table',
                    ),
                    onPress: () {
                      //card tap action
                      toggleActive(4);
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
                    colour: active[5] ? Colors.lightBlue: Colors.blueGrey,
                    cardChild: Icon_Data(
                      icon: FontAwesomeIcons.film,
                      text: 'Movie',
                    ),
                    onPress: () {
                      //card tap action
                      toggleScene(1);
                    },
                  )),
                  Expanded(
                      child: ReuseableCard(
                    colour: active[6] ? Colors.lightBlue: Colors.blueGrey,
                    cardChild: Icon_Data(
                      icon: FontAwesomeIcons.moon,
                      text: 'Night Light',
                    ),
                    onPress: () {
                      //card tap action
                      toggleScene(0);
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
                  killAll();
                  },
                 'Turn Off Everything!'),
              )
            ],
          ),
        )
      );
  }
}

