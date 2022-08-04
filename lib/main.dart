import 'package:flutter/material.dart';
import 'package:ourcourt/Screen/dashboad.dart';
import 'package:ourcourt/Screen/login_page.dart';
import 'package:ourcourt/Screen/open_screen_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Route/route.dart';
//import 'Screen/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteManeger.loginfunction,
      onGenerateRoute: RouteManeger.generateroute,
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginFunction extends StatefulWidget {
  @override
  _LoginFunctionState createState() => _LoginFunctionState();
}

class _LoginFunctionState extends State<LoginFunction> {
  var token;
  _askquetionforpage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    print('$token');

    if (token != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboadPage()),
      );
      print('$token');
    }

    if (token == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Splash_page()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    this._askquetionforpage();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
