import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

bool firstrun;
String apikey;
String deviceid;

fetch() async {
  final SharedPreferences myPrefs = await SharedPreferences.getInstance();
  apikey = myPrefs.getString('apikey');
  deviceid = myPrefs.getString('deviceid');
  // print(apikey);
  // print(deviceid);
}

Future getStatus() async {
  http.Response response = await http.get("http://52.45.45.130:3008/pinStatus");
  return jsonDecode(response.body);
}

Future getData(int pin, String state) async {
  final String baseUrl =
      "https://cloud.boltiot.com/remote/${apikey}/digitalWrite?pin=${pin}&state=${state}&deviceName=${deviceid}";
  //print(baseUrl);
  http.Response response = await http.post(
    "http://52.45.45.130:3008/setPin",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{"pin": pin, "state": state}),
  );

  if (response.statusCode == 200) {
    String data = response.body;
    var decodedData = jsonDecode(data);
    var res = decodedData;
    return res;
  } else {
    print(response.statusCode);
  }
}

Future getMultiData(String pins, String states) async {
  final String baseUrl =
      "https://cloud.boltiot.com/remote/${apikey}/digitalMultiWrite?pins=${pins}&states=${states}&deviceName=${deviceid}";
  //print(baseUrl);
  http.Response response = await http
      .post(
    "http://52.45.45.130:3008/setPins",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{"pins": pins, "states": states}),
      )
      .timeout(
        Duration(seconds: 30),
      );

  print(response.body);
  if (response.statusCode == 200) {
    String data = response.body;
    var decodedData = jsonDecode(data);
    var res = decodedData;
    return res;
  } else {
    print(response.statusCode);
  }
}
