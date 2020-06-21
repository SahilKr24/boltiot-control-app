import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

bool firstrun;
String server_url;
String server_port;

fetch() async {
  final SharedPreferences myPrefs = await SharedPreferences.getInstance();
  server_url = myPrefs.getString('server_url');
  server_port = myPrefs.getString('server_port');
}

Future getStatus() async {
  http.Response response = await http.get("http://${server_url}:${server_port}/pinStatus");
  return jsonDecode(response.body);
}

Future getData(int pin, String state) async {
  http.Response response = await http.post(
    "http://$server_url:$server_port/setPin",
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
  http.Response response = await http
      .post(
    "http://$server_url:$server_port/setPins",
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
