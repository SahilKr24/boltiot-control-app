import 'package:flutter/material.dart';
import 'package:home_automation/screens/controls.dart';
import 'package:home_automation/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Credentials extends StatefulWidget {
  static const String id = 'credentials';
  @override
  _CredentialsState createState() => _CredentialsState();
}

class _CredentialsState extends State<Credentials> {

  bool showSpinner = false;
  String apikey;
  String deviceid;

  save() async {
     final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
     sharedPrefs.setBool('firstrun', false);
     sharedPrefs.setString('apikey', apikey);
     sharedPrefs.setString('deviceid', deviceid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        apikey = value;
                      },
                      decoration: kInputDecoration.copyWith(
                        hintText:'Enter Your API Key',
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        deviceid = value;
                      },
                      decoration: kInputDecoration.copyWith(
                        hintText:'Enter Your DeviceID',
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Material(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        elevation: 5.0,
                        child: MaterialButton(
                          onPressed: () async {
                          setState(() {
                              showSpinner=true;
                            });
                            try{

                              save();
                              Navigator.pushNamed(context, Controls.id);
                               setState(() {
                                  showSpinner=false;
                                  
                                });
                            }
                            catch(e){
                              print(e);
                            }
                          },
                          minWidth: 200.0,
                          height: 42.0,
                          child: Text(
                            'Proceed',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
