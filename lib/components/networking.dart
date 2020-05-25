import 'package:http/http.dart' as http;
import 'dart:convert';

  Future getData(int pin,String state) async{
    final String baseUrl = "https://cloud.boltiot.com/remote/3feb0265-a209-4dce-b12d-60057b3881e6/digitalWrite?pin=${pin}&state=${state}&deviceName=BOLT1116905";;
    http.Response response = await http.get(baseUrl);
    if(response.statusCode==200){
      String data = response.body;
      var decodedData = jsonDecode(data);
      print(response.toString());
      return decodedData;
    }
    else{
      print(response.statusCode);
    } 
  }