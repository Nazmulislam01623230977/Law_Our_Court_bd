import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/Screen/dashboad.dart';
import 'package:ourcourt/Screen/login_page.dart';
import 'package:ourcourt/Screen/registration_page.dart';
import 'package:ourcourt/Screen/verficationOtp_page.dart';
import 'package:ourcourt/apirepositor/apirepositor.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCotroller extends ControllerMVC {
  //login function
  login(email, pass, BuildContext context) async {
    bool _isLoading = true;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      var requestrespons = http.MultipartRequest(
        "POST",
        ApiRepo.userlogin,
      );
      buildShowDialog(context);
      requestrespons.fields['phone_no'] = email;
      requestrespons.fields['password'] = pass;
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          var userdata = responsedata['user'];
          var userid = userdata['id'];
          var username = userdata['full_name'];
          var userbar_ass_name = userdata['bar_ass_name'];
          var userphone_no = userdata['phone_no'];
          var useruser_type = userdata['user_type'];
          var useremail = userdata['email'];
          var usertoken = responsedata['token'];
          var avater = userdata['avater'];
          var status = userdata['status'];
          if (usertoken != null) {
            setState(() {
              _isLoading = false;
              sharedPreferences.setString("token", '${usertoken}');
            });
            if (userid != null) {
              setState(() {
                _isLoading = false;
                sharedPreferences.setString("user_id", '$userid');
              });
            }
            if (username != null) {
              setState(() {
                _isLoading = false;
                sharedPreferences.setString("username", '$username');
              });
            }
            if (userbar_ass_name != null) {
              setState(() {
                _isLoading = false;
                sharedPreferences.setString(
                    "userbar_ass_name", '$userbar_ass_name');
              });
            }
            if (userphone_no != null) {
              setState(() {
                _isLoading = false;
                sharedPreferences.setString("userphone_no", '$userphone_no');
              });
            }
            if (useruser_type != null) {
              setState(() {
                _isLoading = false;
                sharedPreferences.setString("useruser_type", '$useruser_type');
              });
            }
            if (useremail != null) {
              setState(() {
                _isLoading = false;
                sharedPreferences.setString("useremail", '$useremail');
              });
            }
            if (avater != null) {
              setState(() {
                _isLoading = false;
                sharedPreferences.setString("avater", '$avater');
              });
            }
            if (status != null) {
              setState(() {
                _isLoading = false;
                sharedPreferences.setString("status", '$status');
              });
            }
            internaterror('Successfull login', context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboadPage()),
            );
          }

          print(responsedata);
        } else {
          internaterror('Invalid username and password', context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login_Page()),
          );
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
  }
//end login function

//send otp
  phonesentotp(String phone, BuildContext context) async {
    var requestrespons = http.MultipartRequest(
      "POST",
      ApiRepo.phonesentotp,
    );
    buildShowDialog(context);
    requestrespons.fields['phone_no'] = phone;
    requestrespons.send().then((res) async {
      if (res.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VerficationOtp(phone)),
        );
      } else {
        internaterror("Something went wrong !!", context);
      }
    });
  }

//endresend otp
  otpverify(phone, otp, BuildContext context) async {
    var requestrespons = http.MultipartRequest(
      "POST",
      ApiRepo.verfyotp,
    );
    buildShowDialog(context);
    requestrespons.fields['phone_no'] = '$phone';
    requestrespons.fields['otp'] = otp;
    requestrespons.send().then((res) async {
      if (res.statusCode == 200) {
        var massage = await res.stream.bytesToString();
        var responsedata = json.decode(massage);
        var msg = responsedata['otp'];
        if (msg == "error") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => VerficationOtp(phone)));
          internaterror("Invalid Otp,Please check your otp", context);
        }
        if (msg == "success") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegistrationPage(phone)));
        }
      } else {
        internaterror("Please check your internat connection", context);
      }
    });
  }

  //resend otp
  resentotp(String phone, BuildContext context) async {
    var requestrespons = http.MultipartRequest(
      "POST",
      ApiRepo.resendotp,
    );
    buildShowDialog(context);
    requestrespons.fields['phone_no'] = '$phone';
    requestrespons.send().then((res) async {
      if (res.statusCode == 200) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => VerficationOtp(phone)));
        internaterror("Otp has been resend successfully", context);
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => VerficationOtp(phone)));
        internaterror("Something went wrong !!", context);
      }
    });
  }

  userregistration(String fullname, barassName, email, password, phone,
      BuildContext context) async {
    var requestrespons = http.MultipartRequest(
      "POST",
      ApiRepo.userregstration,
    );
    buildShowDialog(context);
    requestrespons.fields['phone_no'] = '$phone';
    requestrespons.fields['full_name'] = fullname;
    requestrespons.fields['email'] = email;
    requestrespons.fields['bar_ass_name'] = barassName;
    requestrespons.fields['password'] = password;
    requestrespons.send().then((res) async {
      if (res.statusCode == 200) {
        print(res.statusCode);
        internaterror("Registration successfull,Please login here", context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login_Page()));
      } else {
        print(res.statusCode);
        internaterror(
            "This number and email address already exist !!", context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RegistrationPage(phone)));
      }
    });
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
