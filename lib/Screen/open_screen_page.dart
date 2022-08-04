import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:ourcourt/Screen/login_page.dart';
import 'package:ourcourt/colorconstant.dart';

class Splash_page extends StatefulWidget {
  @override
  _Splash_pageeState createState() => _Splash_pageeState();
}

class _Splash_pageeState extends State<Splash_page> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login_Page()),
            ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo.jpeg",
            height: 250,
            width: 400,
          ),
          SizedBox(
            height: 15,
          ),
          SpinKitWave(
            color: pcolor,
          ),
        ],
      ),
    );
  }
}
