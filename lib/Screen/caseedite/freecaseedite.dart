import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/controller/function_con.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FreeCaseEditPage extends StatefulWidget {
  // CaseEditPage({Key? key}) : super(key: key);
  var casedata;
  FreeCaseEditPage(this.casedata);

  @override
  FreeCaseEditPageState createState() => FreeCaseEditPageState(this.casedata);
}

class FreeCaseEditPageState extends StateMVC<FreeCaseEditPage> {
  var casedata;
  late FunctionController function;
  FreeCaseEditPageState(this.casedata) : super(FunctionController()) {
    function = controller as FunctionController;
  }
  TextEditingController casenoController = TextEditingController();
  TextEditingController clientnameController = TextEditingController();
  TextEditingController daraController = TextEditingController();
  TextEditingController stepController = TextEditingController();
  TextEditingController caseTypeController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController bclientnameController = TextEditingController();

  String _disticValue = '';
  String _courtValue = '';
  DateTime _pickupDate = DateTime.now();

  var datetime;
  var pickupDate;
  var pickupdatevalue;
  var initialDate = DateTime.now();

  getdate() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    datetime = sharedPreferences.getString('datetime');
    print(datetime);
    print(datetime);
    if (datetime != null) {
      setState(() {
        pickupDate = DateTime.parse(datetime);
      });
    } else {
      setState(() {
        pickupDate = DateTime.now();
      });
    }
  }

  @override
  void initState() {
    this.getdate();
    super.initState();
  }

  // String getpicupdate = "";
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            function.freecaselist(pickupDate, context);
          },
        ),
        backgroundColor: pcolor,
        centerTitle: true,
        title: Text(
          "মামলার টাইপ এবং নাম্বার দিন ।",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Color(0xffffffff),
          ),
        ),
      ),
      backgroundColor: textlabel,
      body: SingleChildScrollView(
        child: Container(
          child: Card(
            color: textlabel,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide()),
                    ),
                    child: DropdownButton(
                      hint: _disticValue == ""
                          ? Text(
                              casedata['distic_name'].toString(),
                            )
                          : Text(
                              _disticValue,
                              style: TextStyle(color: Colors.black),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        'Cumilla',
                        'Dhaka',
                        'barisal',
                        'Chittagong'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newvalue) {
                        setState(
                          () {
                            _disticValue = newvalue!;
                          },
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide()),
                    ),
                    child: DropdownButton(
                      hint: _courtValue == ""
                          ? Text(
                              casedata['court_name'].toString(),
                            )
                          : Text(
                              _courtValue,
                              style: TextStyle(color: Colors.black),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        'Cumilla',
                        'Dhaka',
                        'barisal',
                        'Chittagong'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newvalue) {
                        setState(
                          () {
                            _courtValue = newvalue!;
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: casenoController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        labelText: 'মামলার নাম্বার/বছর',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: casedata['case_no'].toString(),
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black))),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: caseTypeController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        labelText: 'মামলার টাইপ',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: casedata['case_type'].toString(),
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black))),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: clientnameController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        labelText: 'বাদী',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: casedata['client_name'].toString(),
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black))),
                SizedBox(
                  height: 10,
                ),
                Text("বনাম"),
                TextField(
                    controller: bclientnameController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        labelText: 'বিবাদী',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: casedata['bclient_name'].toString(),
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black))),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: daraController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        labelText: 'ধারা',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: casedata['dara'].toString(),
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black))),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: phonenoController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        labelText: 'Phone no',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: casedata['phone_no'].toString(),
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black))),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: stepController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        labelText: 'Step',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: casedata['step'].toString(),
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black))),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: notesController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        labelText: 'Notes',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: casedata['notes'].toString(),
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black))),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    function.freecaseupdate(
                        _disticValue,
                        _courtValue,
                        casenoController.text,
                        clientnameController.text,
                        daraController.text,
                        stepController.text,
                        notesController.text,
                        phonenoController.text,
                        caseTypeController.text,
                        bclientnameController.text,
                        casedata['id'],
                        context);

                    // Navigator.of(context)
                    //     .popAndPushNamed(RouteManeger.casepremiumshow_page);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(pcolor),
                  ),
                  child: Text(
                    'যুক্ত করুন',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
