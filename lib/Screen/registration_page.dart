import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/controller/loginandregistration_con.dart';

class RegistrationPage extends StatefulWidget {
  var phone;
  RegistrationPage(this.phone);
  // RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState(this.phone);
}

class _RegistrationPageState extends StateMVC<RegistrationPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController barAssNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  var phone;
  late LoginCotroller _con;
  _RegistrationPageState(this.phone) : super(LoginCotroller()) {
    _con = controller as LoginCotroller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFFFFFFF),
                      Color(0xFFFFFFFF),
                      Color(0xFFFFFFFF),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    vertical: 120,
                    horizontal: 25,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ' Registration ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildname(fullNameController),
                      SizedBox(
                        height: 5,
                      ),
                      buildEmail(emailController),
                      SizedBox(
                        height: 5,
                      ),
                      buildBar(barAssNameController),
                      SizedBox(
                        height: 5,
                      ),
                      buildPassword(passwordController),
                      SizedBox(
                        height: 5,
                      ),
                      buildConfirmPassword(confirmpasswordController),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 5,
                          onPressed: () {
                            if (fullNameController.text == "") {
                              _loginToast(
                                  "Full name will not be empty", context);
                            } else if (!emailController.text.contains('@')) {
                              _loginToast("Email is not valid", context);
                            } else if (passwordController.text == "") {
                              _loginToast("Password con not be empty", context);
                            } else if (confirmpasswordController.text == "") {
                              _loginToast(
                                  "Confirm password con not be empty", context);
                            } else if (passwordController.text.length < 8) {
                              _loginToast(
                                  "Password will minmum 8 charecter", context);
                            } else if (passwordController.text !=
                                confirmpasswordController.text) {
                              _loginToast(
                                  "Password and  Confirm password doesn\'t match",
                                  context);
                            } else {
                              _con.userregistration(
                                  fullNameController.text,
                                  barAssNameController.text,
                                  emailController.text,
                                  passwordController.text,
                                  phone,
                                  context);
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: pcolor,
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildname(fullNameController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Full name",
        style: TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        height: 40.0,
        alignment: Alignment.centerLeft,
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
          controller: fullNameController,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.person,
                color: pcolor,
              ),
              hintText: 'Full name',
              hintStyle:
                  TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black)),
        ),
      )
    ],
  );
}

Widget buildEmail(emailController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Email",
        style: TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        height: 40.0,
        alignment: Alignment.centerLeft,
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
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.email,
                color: pcolor,
              ),
              hintText: 'Email',
              hintStyle:
                  TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black)),
        ),
      )
    ],
  );
}

Widget buildBar(barAssNameController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Bar Association Name",
        style: TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        height: 40.0,
        alignment: Alignment.centerLeft,
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
          controller: barAssNameController,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.commute,
                color: pcolor,
              ),
              hintText: 'Bar Association Name',
              hintStyle:
                  TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black)),
        ),
      )
    ],
  );
}

Widget buildPassword(passwordController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Password",
        style: TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        height: 40.0,
        alignment: Alignment.centerLeft,
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
          controller: passwordController,
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.lock,
                color: pcolor,
              ),
              hintText: 'Password',
              hintStyle:
                  TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black)),
        ),
      )
    ],
  );
}

Widget buildConfirmPassword(confirmpasswordController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Confirm password",
        style: TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        height: 40.0,
        alignment: Alignment.centerLeft,
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
          controller: confirmpasswordController,
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.lock,
                color: pcolor,
              ),
              hintText: 'Confirm password',
              hintStyle:
                  TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black)),
        ),
      )
    ],
  );
}

void _loginToast(String massge, BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(massge),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
