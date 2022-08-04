import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/Route/route.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/controller/loginandregistration_con.dart';

class VerficationPhone_page extends StatefulWidget {
  VerficationPhone_page({Key? key}) : super(key: key);

  @override
  VerficationPhone_pageState createState() => VerficationPhone_pageState();
}

class VerficationPhone_pageState extends StateMVC<VerficationPhone_page> {
  late LoginCotroller _con;
  VerficationPhone_pageState() : super(LoginCotroller()) {
    _con = controller as LoginCotroller;
  }

  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .6,
                color: textlabel,
                child: Image.asset(
                  "assets/images/logo.jpeg",
                  height: 260,
                  width: 400,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, top: 12),
                child: Text(
                  "Welcome To our Court",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 15,
                ),
                child: Text(
                  "Enter your 11 digit's Phone Number",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 40,
                padding: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ]),
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: pcolor, width: 1.1),
                      ),
                      hintStyle: TextStyle(color: Colors.green),
                      errorStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.phone),
                      labelText: 'Phone no',
                      filled: true),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              FlatButton(
                onPressed: () {
                  if (phoneController.text.length != 11) {
                    _phonenumberToast("Phone number will be 11 digit", context);
                  } else {
                    _con.phonesentotp(phoneController.text, context);
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
                      "Continue",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Poppins'),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(left: 15, top: 12),
                  child: Text(
                    "After Click on contiune you will be process on verify",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .popAndPushNamed(RouteManeger.login_page);
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have a Account?  ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                fontSize: 15),
                          ),
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: pcolor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _phonenumberToast(String massge, BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(massge),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
