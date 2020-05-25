import 'package:flutter/material.dart';
import 'screens/controls.dart';
import 'screens/credentials.dart';
import 'package:shared_preferences/shared_preferences.dart';



String initRoute;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(await getState());
}

bool firstrun;
Future<Widget> getState() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  firstrun = sharedPrefs.getBool('firstrun') ?? true;
  print("Firstrun?");
  print(firstrun);
  initRoute = firstrun ? Credentials.id : Controls.id;
  return Automation();
}

class Automation extends StatefulWidget {
  @override
  _AutomationState createState() => _AutomationState();
}

class _AutomationState extends State<Automation> {
  @override
  void initState() {
    getState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: initRoute,
      routes: {
        Credentials.id: (context) => Credentials(),
        Controls.id: (context) => Controls(),
      },
    );
  }
}
