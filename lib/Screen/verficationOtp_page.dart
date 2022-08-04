import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/controller/loginandregistration_con.dart';

class VerficationOtp extends StatefulWidget {
  var phone;
  VerficationOtp(this.phone);
  @override
  _VerficationOtpState createState() => _VerficationOtpState(this.phone);
}

class _VerficationOtpState extends StateMVC<VerficationOtp> {
  var phone;
  late LoginCotroller _con;
  _VerficationOtpState(this.phone) : super(LoginCotroller()) {
    _con = controller as LoginCotroller;
  }
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      //backgroundImage: AssetImage("assets/images/logo.jpeg"),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              height: MediaQuery.of(context).size.height * .4,
              color: pcolor,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Enter the verification code that has been send to ",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Poppins",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "$phone",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Poppins",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              padding: EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: pcolor, width: 1.1),
                  ),
                  prefixIcon: Icon(
                    Icons.message_outlined,
                    color: pcolor,
                  ),
                  hintText: 'OTP',
                  labelText: 'OTP',
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            // ),
            SizedBox(
              height: 15,
            ),
            FlatButton(
              onPressed: () {
                if (otpController.text.length != 6) {
                  _otpToast("Otp is not valid, Otp will be minimum 6 digit !!",
                      context);
                } else {
                  _con.otpverify(phone, otpController.text, context);
                }
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: pcolor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Verify",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Poppins'),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                child: Text(
                  "Don't receive the code ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontFamily: 'Poppins'),
                ),
              ),
            ),
            Center(
              child: FlatButton(
                onPressed: () {
                  _con.resentotp(phone, context);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Resend",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Poppins'),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _otpToast(String massge, BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(massge),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
