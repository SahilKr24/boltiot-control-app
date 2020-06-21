import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_automation/components/bottom_button.dart';
import 'package:home_automation/components/icon_content.dart';
import 'package:home_automation/components/networking.dart' as networking;
import 'package:home_automation/components/reuseable_card.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Controls extends StatefulWidget {
  static const String id = 'controls';
  @override
  _ControlsState createState() => _ControlsState();
}

class _ControlsState extends State<Controls> {
  List<bool> active = [false, false, false, false, false, false, false];
  bool showSpinner = false;

  showError(var res) {
    Flushbar(
      blockBackgroundInteraction: true,
      title: "Some Error Occured!",
      message: res['value'] ?? 'API Endpoint failure!',
      icon: Icon(FontAwesomeIcons.exclamationTriangle, color: Colors.red),
      duration: Duration(seconds: 3),
    )..show(context);
  }

  toggleActive(int index) async {
    setState(() {
      showSpinner = true;
    });
    var res = await networking.getData(index, active[index] ? "HIGH" : "LOW");
    if (res['success'] == 1) {
      setState(() {
        active[index] = !active[index];
        active[5] = false;
        active[6] = false;
        showSpinner = false;
      });
    } else {
      setState(() {
        showSpinner = false;
      });
      showError(res);
    }
  }

  toggleScene(int index) async {
    setState(() {
      showSpinner = true;
    });
    if (index == 0) {
      var res = await networking.getMultiData('1,2,3,4', 'HIGH,LOW,HIGH,HIGH');
      if (res['success'] == 1) {
        setState(() {
          active[1] = false;
          active[2] = true;
          active[3] = false;
          active[4] = false;
          active[5] = false;
          active[6] = true;
          showSpinner = false;
        });
      } else {
        setState(() {
          showSpinner = false;
        });
        showError(res);
      }
    }
    if (index == 1) {
      var res = await networking.getMultiData('1,2,3,4', 'HIGH,LOW,LOW,HIGH');
      if (res['success'] == 1) {
        setState(() {
          active[1] = false;
          active[2] = true;
          active[3] = true;
          active[4] = false;
          active[5] = true;
          active[6] = false;
          showSpinner = false;
        });
      } else {
        setState(() {
          showSpinner = false;
        });
        showError(res);
      }
    }
  }

  killAll() async {
    setState(() {
      showSpinner = true;
    });
    var res = await networking.getMultiData('1,2,3,4', 'HIGH,HIGH,HIGH,HIGH');
    if (res['success'] == 1) {
      setState(() {
        active[1] = false;
        active[2] = false;
        active[3] = false;
        active[4] = false;
        active[5] = false;
        active[6] = false;
        showSpinner = false;
      });
    } else {
      setState(() {
        showSpinner = false;
      });
      showError(res);
    }
  }

  getStatus() async {
    setState(() {
      showSpinner = true;
    });
    var response = await networking.getStatus();
    print(response);
    var resActive = response;
    setState(() {
      int i = 0;
      resActive.forEach((element) {
        active[i++] = (element == 'LOW' ? true : false);
      });
      showSpinner = false;
    });
  }

  @override
  void initState() {
    networking.fetch();
    // getStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      leading: Icon(
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
                  colour: active[1] ? Colors.lightBlue : Colors.blueGrey,
                  cardChild: Icon_Data(
                    icon: FontAwesomeIcons.solidLightbulb,
                    text: 'Porch Lights',
                  ),
                  onPress: () {
                    toggleActive(1);
                  },
                )),
                Expanded(
                    child: ReuseableCard(
                  colour: active[2] ? Colors.lightBlue : Colors.blueGrey,
                  cardChild: Icon_Data(
                    icon: FontAwesomeIcons.lightbulb,
                    text: 'LED Light',
                  ),
                  onPress: () {
                    //card tap action
                    toggleActive(2);
                  },
                )),
              ]),
            ),
            Expanded(
              flex: 5,
              child: Row(children: <Widget>[
                Expanded(
                    child: ReuseableCard(
                  colour: active[3] ? Colors.lightBlue : Colors.blueGrey,
                  cardChild: Icon_Data(
                    icon: FontAwesomeIcons.fan,
                    text: 'Fan',
                  ),
                  onPress: () {
                    //card tap action
                    toggleActive(3);
                  },
                )),
                Expanded(
                    child: ReuseableCard(
                  colour: active[4] ? Colors.lightBlue : Colors.blueGrey,
                  cardChild: Icon_Data(
                    icon: FontAwesomeIcons.lightbulb,
                    text: 'Tubelight',
                  ),
                  onPress: () {
                    //card tap action
                    toggleActive(4);
                  },
                )),
              ]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      leading: Icon(
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
              flex: 5,
              child: Row(children: <Widget>[
                Expanded(
                    child: ReuseableCard(
                  colour: active[5] ? Colors.lightBlue : Colors.blueGrey,
                  cardChild: Icon_Data(
                    icon: FontAwesomeIcons.film,
                    text: 'Veranda',
                  ),
                  onPress: () {
                    //card tap action
                    toggleScene(1);
                  },
                )),
                Expanded(
                    child: ReuseableCard(
                  colour: active[6] ? Colors.lightBlue : Colors.blueGrey,
                  cardChild: Icon_Data(
                    icon: FontAwesomeIcons.moon,
                    text: 'Night Light',
                  ),
                  onPress: () {
                    //card tap action
                    toggleScene(0);
                  },
                )),
              ]),
            ),
            Expanded(
              flex: 2,
              child: BottomButton(() {
                killAll();
              }, 'Turn Off Everything!'),
            )
          ],
        ),
      ),
    ));
  }
}
