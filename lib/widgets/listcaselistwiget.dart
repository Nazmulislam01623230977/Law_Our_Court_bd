import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ourcourt/Screen/admindateupdate.dart';
import 'package:ourcourt/Screen/caseedite/premiumcaseedit.dart';
import 'package:ourcourt/Screen/casesearchpage.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class CaseListWidge extends StatelessWidget {
  var casedata;
  CaseListWidge({required this.casedata});

  caselistdataforself(int caseid, BuildContext context) async {
    print(caseid);
    try {
      var requestrespons = http.MultipartRequest("GET",
          Uri.parse("https://ourcourtbd.com/api/caselistdelete/$caseid"));

      requestrespons.send().then((res) async {
        var massage = await res.stream.bytesToString();
        var responsedata = json.decode(massage);
        print(responsedata);
        if (res.statusCode == 200) {
          var msg = responsedata['msg'];
          if (msg == "success") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CaseSearchPage()),
            );
            internaterror('Delete has been successfully ', context);
          } else if (msg == "error") {
            internaterror('Something went wrong', context);
          }
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
  }

  var initialDate = DateTime.now();

  // var datepic = "${initialDate.day}-${initialDate.month}-${initialDate.year}";

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

  @override
  Widget build(BuildContext context) {
    var admindate = jsonDecode(casedata["admin_date"]);
    return GestureDetector(
      child: Card(
        child: Container(
          margin: EdgeInsets.only(
            top: 10,
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white70.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 5, bottom: 2, left: 8),
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
                        padding:
                            const EdgeInsets.only(top: 2, bottom: 2, left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 0),
                                  child: Text(
                                    casedata["case_type"].toString() +
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
                        padding:
                            const EdgeInsets.only(top: 2, bottom: 2, left: 8),
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
                                        " বনাম " +
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
                        padding:
                            const EdgeInsets.only(top: 2, bottom: 2, left: 8),
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
                        padding:
                            const EdgeInsets.only(top: 2, bottom: 2, left: 8),
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
                        padding:
                            const EdgeInsets.only(top: 2, bottom: 2, left: 8),
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
                                                casedata["notes"].toString(),
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
                      Text(
                        "Register date: " + casedata["reg_date"].toString(),
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 2, bottom: 2, left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left: 0),
                                    child: ButtonTheme(
                                      height: 30.0,
                                      child: RaisedButton(
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(8.0),
                                            side: BorderSide(color: pcolor)),
                                        onPressed: () {},
                                        color: Colors.white,
                                        textColor: Colors.black,
                                        child: Text(
                                          "Previews Date:${admindate.last}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(left: 0),
                                        child: ButtonTheme(
                                          height: 30.0,
                                          child: RaisedButton(
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        8.0),
                                                side:
                                                    BorderSide(color: pcolor)),
                                            onPressed: () {},
                                            color: Colors.white,
                                            textColor: Colors.black,
                                            child: Text(
                                              "next date: " +
                                                  casedata["last_date"]
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 15,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 2, left: 70),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 0),
                            child: ButtonTheme(
                              height: 20.0,
                              minWidth: 10,
                              child: FlatButton(
                                  // shape: new RoundedRectangleBorder(
                                  //     borderRadius:
                                  //         new BorderRadius.circular(8.0),
                                  //     side: BorderSide(color: removebtn)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AdminDateUpdatePage(casedata),
                                        ));

                                    // caselistdataforself(
                                    //     casedata["id"], context);
                                  },
                                  color: Colors.white,
                                  textColor: Colors.black,
                                  child: Row(
                                    children: [
                                      // Icon(
                                      //   Icons.history,
                                      //   size: 16,
                                      // ),
                                      Text(
                                        " Case History",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 0),
                            child: ButtonTheme(
                              height: 20.0,
                              minWidth: 10,
                              child: FlatButton(
                                  // shape: new RoundedRectangleBorder(
                                  //     borderRadius:
                                  //         new BorderRadius.circular(8.0),
                                  //     side: BorderSide(color: removebtn)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PremiumCaseEditPage(casedata),
                                        ));

                                    // caselistdataforself(
                                    //     casedata["id"], context);
                                  },
                                  color: Colors.white,
                                  textColor: Colors.black,
                                  child: Row(
                                    children: [
                                      // Icon(
                                      //   Icons.edit,
                                      //   size: 12,
                                      // ),
                                      Text(
                                        "Edit",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 0),
                            child: ButtonTheme(
                              height: 20.0,
                              minWidth: 10,
                              child: FlatButton(
                                  onPressed: () {
                                    caselistdataforself(
                                        casedata["id"], context);
                                  },
                                  color: Colors.white,
                                  textColor: Colors.black,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Remove",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),

                          Container(
                              child: casedata["phone_no"] != null
                                  ? Row(
                                      children: [
                                        InkWell(
                                          child: Wrap(
                                            spacing: 12,
                                            children: <Widget>[
                                              Icon(
                                                Icons.sms,
                                                color: Colors.orange,
                                              ),
                                            ],
                                          ),
                                          onTap: () => UrlLauncher.launch(
                                              "sms:${casedata["phone_no"].toString()}"),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          child: Wrap(
                                            spacing: 12,
                                            children: <Widget>[
                                              Icon(
                                                Icons.phone_in_talk,
                                                color: Colors.green,
                                              ),
                                            ],
                                          ),
                                          onTap: () => UrlLauncher.launch(
                                              "tel:${casedata["phone_no"].toString()}"),
                                        ),
                                      ],
                                    )
                                  : Center())
                          // SizedBox(
                          //   width: 3,
                          // ),
                          // Container(
                          //   padding: EdgeInsets.only(left: 0),
                          //   child: ButtonTheme(
                          //     height: 20.0,
                          //     minWidth: 10,
                          //     child: FlatButton(
                          //         // shape: new RoundedRectangleBorder(
                          //         //     borderRadius:
                          //         //         new BorderRadius.circular(8.0),
                          //         //     side: BorderSide(color: removebtn)),
                          //         onPressed: () {
                          //           // Navigator.push(
                          //           //     context,
                          //           //     MaterialPageRoute(
                          //           //       builder: (context) => CaseSearchPage(),
                          //           //     ));

                          //           caselistdataforself(
                          //               casedata["id"], context);
                          //         },
                          //         color: Colors.white,
                          //         textColor: Colors.black,
                          //         child: Row(
                          //           children: [
                          //             Icon(
                          //               Icons.edit,
                          //               size: 12,
                          //             ),
                          //             // Text(
                          //             //   "Remove",
                          //             //   style: TextStyle(
                          //             //       fontSize: 12,
                          //             //       fontWeight: FontWeight.bold,
                          //             //       color: Colors.black),
                          //             // )
                          //           ],
                          //         )),
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: 3,
                          // ),
                        ],
                      ),
                    ],
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
