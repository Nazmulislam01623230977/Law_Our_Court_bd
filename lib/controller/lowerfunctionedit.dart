import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/apirepositor/apirepositor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LowerFunctionController extends ControllerMVC {
  lowerregistration(
      String fullname,
      bool malevalue,
      bool femalevalue,
      dateofbirtday,
      phoneno,
      email,
      address,
      barrassame,
      education,
      specialization,
      experience,
      licenseno,
      bool dircall,
      bool phonecall,
      bool emailcall,
      bool videocall,
      BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var user_id = sharedPreferences.getString("user_id");
    var gender;
    var directcalll;
    var phonecalll;
    var emailcalll;
    var videocalll;
    // try {
    var requestrespons = http.MultipartRequest(
      "POST",
      ApiRepo.lowerregistration,
    );
    if (malevalue == true) {
      gender = "Male";
    } else if (femalevalue == true) {
      gender = "Female";
    }

    if (dircall == true) {
      directcalll = "Direct Consulting";
    }

    if (phonecall == true) {
      phonecalll = "Phone Consulting";
    }

    if (emailcall == true) {
      emailcalll = "Email cunsulting";
    }

    if (videocall == true) {
      videocalll = "Video Consulting";
    }
    requestrespons.fields['full_name'] = fullname;
    requestrespons.fields['gender'] = "$gender";
    requestrespons.fields['date_of_birth'] = dateofbirtday;
    requestrespons.fields['phone_no'] = phoneno;
    requestrespons.fields['email'] = email;
    requestrespons.fields['address'] = address;
    requestrespons.fields['barr_ass_name'] = barrassame;
    requestrespons.fields['education'] = education;
    requestrespons.fields['specialization'] = specialization;
    requestrespons.fields['experience'] = experience;
    requestrespons.fields['license_no'] = licenseno;
    requestrespons.fields['dir_call'] = "$directcalll";
    requestrespons.fields['phone_call'] = "$phonecalll";
    requestrespons.fields['email_call'] = "$emailcalll";
    requestrespons.fields['video_call'] = "$videocalll";
    requestrespons.fields['user_id'] = "$user_id";
    requestrespons.send().then((res) async {
      if (res.statusCode == 200) {
        var massage = await res.stream.bytesToString();
        var responsedata = json.decode(massage);
        var msg = responsedata["msg"];
        var msgfoundcaselist = responsedata["lowerfound"];

        print(msgfoundcaselist);

        if (msgfoundcaselist != null) {
          if (msgfoundcaselist.length != 0) {
            internaterror('You already registered !!', context);
          }
        }
        if (msg.length != 0) {
          internaterror('Lower registration successfully !!', context);
        }
      }
    });
    // } catch (e) {
    //   internaterror('Verify your internet connection', context);
    // }
  }
}

void internaterror(String massge, BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(massge),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

buildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      });
}

cerculerShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      });
}
