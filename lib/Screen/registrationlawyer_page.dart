import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/Route/route.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/controller/lowerfunctionedit.dart';

class RegistrationLawyer extends StatefulWidget {
  RegistrationLawyer({Key? key}) : super(key: key);

  @override
  _RegistrationLawyerState createState() => _RegistrationLawyerState();
}

class _RegistrationLawyerState extends StateMVC<RegistrationLawyer> {
  late LowerFunctionController function;
  _RegistrationLawyerState() : super(LowerFunctionController()) {
    function = controller as LowerFunctionController;
  }
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateofbirthController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController barassnameController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController experianceController = TextEditingController();
  TextEditingController licensenoController = TextEditingController();
  bool malevalue = false;
  bool femalevalue = false;
  bool directconsulting = false;
  bool phoneconsulting = false;
  bool emailconsulting = false;
  bool videoconsulting = false;

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(RouteManeger.dashboad_page);
          },
        ),
        backgroundColor: pcolor,
        centerTitle: true,
        title: Text(
          "Registration Lawyer",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: btntextcolor,
            fontSize: 16,
          ),
        ),
      ),
      //backgroundColor: Color(0xFFE0E6E3),
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
                      backgcolor,
                      backgcolor,
                      backgcolor,
                      backgcolor,
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 25,
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildname(fullNameController),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Gender",
                            style: TextStyle(
                                color: btntextcolor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: malevalue,
                            activeColor: pcolor,
                            onChanged: (value) {
                              setState(() {
                                malevalue = value!;
                                femalevalue = false;
                              });
                            },
                          ),
                          Text(
                            'Male',
                            style: TextStyle(
                                color: btntextcolor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          Checkbox(
                            value: femalevalue,
                            activeColor: pcolor,
                            onChanged: (value) {
                              setState(() {
                                femalevalue = value!;
                                malevalue = false;
                              });
                            },
                          ),
                          Text(
                            'Female',
                            style: TextStyle(
                                color: btntextcolor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      buildDate(dateofbirthController),
                      buildphone(phonenoController),
                      buildemail(emailController),
                      buildaddress(addressController),
                      buildbar(barassnameController),
                      buildedu(educationController),
                      buildspe(specializationController),
                      buildexp(experianceController),
                      buildlin(licensenoController),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'I am interested in ',
                            style: TextStyle(
                                color: btntextcolor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: directconsulting,
                            activeColor: pcolor,
                            onChanged: (value) {
                              setState(() {
                                directconsulting = value!;
                              });
                            },
                          ),
                          Text(
                            'Direct Consulting',
                            style: TextStyle(
                                color: btntextcolor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: phoneconsulting,
                            activeColor: pcolor,
                            onChanged: (value) {
                              setState(() {
                                phoneconsulting = value!;
                              });
                            },
                          ),
                          Text(
                            'Phone Consulting',
                            style: TextStyle(
                                color: btntextcolor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: emailconsulting,
                            activeColor: pcolor,
                            onChanged: (value) {
                              setState(() {
                                emailconsulting = value!;
                              });
                            },
                          ),
                          Text(
                            'Email Consulting',
                            style: TextStyle(
                                color: btntextcolor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: videoconsulting,
                            activeColor: pcolor,
                            onChanged: (value) {
                              setState(() {
                                videoconsulting = value!;
                              });
                            },
                          ),
                          Text(
                            'Video Consulting',
                            style: TextStyle(
                                color: btntextcolor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        'I agree the term and conditions.I hereby declare & confirm that all the information given above is true only ',
                        style: TextStyle(
                            color: btntextcolor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(pcolor),
                              ),
                              child: Text('Cancel')),
                          ElevatedButton(
                              onPressed: () {
                                if (fullNameController.text == "") {
                                  internaterror(
                                      "Full Name is required field !!",
                                      context);
                                } else if (femalevalue == false &&
                                    malevalue == false) {
                                  internaterror(
                                      "Gender is required field !!", context);
                                } else if (dateofbirthController.text == "") {
                                  internaterror(
                                      "Date of birth day is required field !!",
                                      context);
                                } else if (phonenoController.text == "") {
                                  internaterror(
                                      "Phone number is required field !!",
                                      context);
                                } else if (emailController.text == "") {
                                  internaterror(
                                      "Email is required field !!", context);
                                } else if (addressController.text == "") {
                                  internaterror(
                                      "Address is required field !!", context);
                                } else if (barassnameController.text == "") {
                                  internaterror(
                                      "Bar association name is required field !!",
                                      context);
                                } else if (specializationController.text ==
                                    "") {
                                  internaterror(
                                      "Specialization is required field !!",
                                      context);
                                } else if (experianceController.text == "") {
                                  internaterror(
                                      "Experience is required field !!",
                                      context);
                                } else if (licensenoController.text == "") {
                                  internaterror(
                                      "License no is required field !!",
                                      context);
                                } else {
                                  function.lowerregistration(
                                      fullNameController.text,
                                      malevalue,
                                      femalevalue,
                                      dateofbirthController.text,
                                      phonenoController.text,
                                      emailController.text,
                                      addressController.text,
                                      barassnameController.text,
                                      educationController.text,
                                      specializationController.text,
                                      experianceController.text,
                                      licensenoController.text,
                                      directconsulting,
                                      phoneconsulting,
                                      emailconsulting,
                                      videoconsulting,
                                      context);
                                }

                                // Navigator.of(context)
                                //     .popAndPushNamed(RouteManeger.casepremiumshow_page);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(pcolor),
                              ),
                              child: Text('Save')),
                        ],
                      )
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

Widget buildname(fullname) {
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
        child: TextField(
          controller: fullname,
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

Widget buildDate(dateofbirth) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Date Of Birthday",
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
        child: TextField(
          controller: dateofbirth,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.card_giftcard,
                color: pcolor,
              ),
              hintText: 'Date Of Birthday',
              hintStyle:
                  TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black)),
        ),
      )
    ],
  );
}

Widget buildphone(phoneno) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Mobile Number",
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
        child: TextField(
          controller: phoneno,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.phone,
                color: pcolor,
              ),
              hintText: 'Mobile Number',
              hintStyle:
                  TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black)),
        ),
      )
    ],
  );
}

Widget buildemail(email) {
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
        child: TextField(
          controller: email,
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

Widget buildaddress(address) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Address",
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
        child: TextField(
          controller: address,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.add_location,
                color: pcolor,
              ),
              hintText: 'Address',
              hintStyle:
                  TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black)),
        ),
      )
    ],
  );
}

Widget buildbar(barrassname) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Bar Association Name ",
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
        child: TextField(
          controller: barrassname,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.branding_watermark,
                color: pcolor,
              ),
              hintText: 'Bar Association Name ',
              hintStyle:
                  TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black)),
        ),
      )
    ],
  );
}

Widget buildedu(education) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Education details ",
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
        child: TextField(
          controller: education,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.book_rounded,
                color: pcolor,
              ),
              hintText: 'Education ',
              hintStyle:
                  TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black)),
        ),
      )
    ],
  );
}

Widget buildspe(specialization) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "specialization",
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
        child: TextField(
          controller: specialization,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.splitscreen,
                color: pcolor,
              ),
              hintText: 'specialization',
              hintStyle:
                  TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black)),
        ),
      )
    ],
  );
}

Widget buildexp(experience) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "experience in year",
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
        child: TextField(
          controller: experience,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.explore,
                color: pcolor,
              ),
              hintText: 'experience in year',
              hintStyle:
                  TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black)),
        ),
      )
    ],
  );
}

Widget buildlin(licenseno) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "License No",
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
        child: TextField(
          controller: licenseno,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.library_add_check,
                color: pcolor,
              ),
              hintText: 'License No',
              hintStyle:
                  TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black)),
        ),
      )
    ],
  );
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
