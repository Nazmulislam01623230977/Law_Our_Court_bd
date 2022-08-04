import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/controller/lowerfunctionedit.dart';
import 'package:ourcourt/controller/function_con.dart';

class AdminDateUpdatePage extends StatefulWidget {
  var casedata;

  AdminDateUpdatePage(this.casedata);
  @override
  _AdminDateUpdatePageState createState() =>
      _AdminDateUpdatePageState(this.casedata);
}

class _AdminDateUpdatePageState extends StateMVC<AdminDateUpdatePage> {
  var casedata;
  late FunctionController function;
  _AdminDateUpdatePageState(this.casedata) : super(FunctionController()) {
    function = controller as FunctionController;
  }

  DateTime _pickupDate = DateTime.now();
  DateTime _pickupDate1 = DateTime.now();
  String getpicupdate = "";
  var initialDate = DateTime.now();
  @override
  Future pickDate(BuildContext context) async {
    var newDate = await showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: DateTime(DateTime.now().year - 0,
                DateTime.now().month - 0, DateTime.now().day - 0),
            lastDate: DateTime(DateTime.now().year + 3,
                DateTime.now().month + 3, DateTime.now().day + 8))
        .then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          _pickupDate = value;
          getpicupdate =
              "${_pickupDate.day}-${_pickupDate.month}-${_pickupDate.year}";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var admindate = jsonDecode(casedata["admin_date"]);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            function.casepremiumlist(_pickupDate, context);
          },
        ),
        backgroundColor: pcolor,
        centerTitle: true,
        title: Text(
          "Case Date Add",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Color(0xffffffff),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 2, left: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 0),
                                      child: Text(
                                        casedata["court_name"].toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 2, bottom: 2, left: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 0),
                                      child: Text(
                                        casedata["case_no"].toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 2, bottom: 2, left: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 0),
                                      child: Text(
                                        casedata["case_type"].toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 2, bottom: 2, left: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 0),
                                      child: Text(
                                        casedata["client_name"].toString() +
                                            casedata["bclient_name"].toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 2, bottom: 2, left: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'ধারা: ',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 0),
                                      child: Text(
                                        casedata["dara"].toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 2, bottom: 2, left: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 0),
                                      child: casedata["step"] != null
                                          ? Text(
                                              'Step: ' +
                                                  casedata["step"].toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            )
                                          : Text(''),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 2, bottom: 2, left: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(top: 0),
                                        child: casedata["notes"] != null
                                            ? Text(
                                                "Note: " +
                                                    casedata["notes"]
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              )
                                            : Text('')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 2, bottom: 2, left: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                      children: List.generate(admindate.length,
                                          (index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Previews Date:${admindate[index]}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    );
                                  })),
                                  // Text(
                                  //   "Previews Date:${admindate.last}",
                                  //   style: TextStyle(
                                  //       fontSize: 12,
                                  //       fontWeight: FontWeight.bold,
                                  //       color: Colors.black),
                                  // ),
                                  // SizedBox(
                                  //   width: 2,
                                  // ),
                                  Text(
                                    '|| next date: ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    casedata["last_date"],
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),

                      // Container(
                      //   width: 370,
                      //   child: OutlineButton(
                      //     child: Text(
                      //         'Next Date :  ${_pickupDate.day}-${_pickupDate.month}-${_pickupDate.year}'),
                      //     // style: TextButton.styleFrom(
                      //     //   primary: Colors.black,
                      //     // ),
                      //     onPressed: () {
                      //       setState(() {
                      //         pickDate(context);
                      //         // print(pickDate);
                      //       });
                      //     },
                      //   ),
                      // ),
                      // Container(
                      //     padding: EdgeInsets.only(left: 150),
                      //     child: ButtonTheme(
                      //       height: 20.0,
                      //       minWidth: 10,
                      //       child: RaisedButton(
                      //         onPressed: () {
                      //           if (getpicupdate == "") {
                      //             internaterror(
                      //                 "Date con not be empty !!", context);
                      //           } else {
                      //             function.dateupdatefunction(casedata,
                      //                 getpicupdate, casedata["id"], context);
                      //           }

                      //           // Navigator.of(context)
                      //           //     .popAndPushNamed(RouteManeger.casepremiumshow_page);
                      //         },
                      //         child: Text(
                      //           'যুক্ত করুন',
                      //           style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //       ),
                      //     )
                      //     ),

                      //
                    ]))),
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
