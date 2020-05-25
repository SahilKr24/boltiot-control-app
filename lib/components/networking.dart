import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

  bool firstrun;
  String apikey;
  String deviceid;
  fetch() async {
    final SharedPreferences myPrefs = await SharedPreferences.getInstance();
    apikey = myPrefs.getString('apikey');
    deviceid = myPrefs.getString('deviceid');
    print(apikey);
    print(deviceid);
  }

  Future getData(int pin,String state) async{
    final String baseUrl = "https://cloud.boltiot.com/remote/${apikey}/digitalWrite?pin=${pin}&state=${state}&deviceName=${deviceid}";
    print(baseUrl);
    http.Response response = await http.get(baseUrl);
    if(response.statusCode==200){
      String data = response.body;
      var decodedData = jsonDecode(data);
      var res = decodedData;
      return res;
    }
    else{
      print(response.statusCode);
    } 
  }

  Future getMultiData(String pins,String states) async{
    final String baseUrl = "https://cloud.boltiot.com/remote/${apikey}/digitalMultiWrite?pins=${pins}&states=${states}&deviceName=${deviceid}";
    print(baseUrl);
    http.Response response = await http.get(baseUrl);
    if(response.statusCode==200){
      String data = response.body;
      var decodedData = jsonDecode(data);
     var res = decodedData;
      return res;
    }
    else{
      print(response.statusCode);
    } 
  }