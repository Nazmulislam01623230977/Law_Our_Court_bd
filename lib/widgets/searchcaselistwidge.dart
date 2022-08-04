import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ourcourt/Screen/casesearchpage.dart';
import 'package:ourcourt/apirepositor/apirepositor.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/model/casedairysearchmodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchCaseWidge extends StatelessWidget {
  var casedata;
  SearchCaseWidge({required this.casedata});
  // DoctorCard(this._name, this._description, this._imageUrl, this._bgColor);

  caselistdataforself(int caseid, BuildContext context) async {
    // cerculerShowDialog(context);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var user_id = sharedPreferences.getString("user_id");
    print(user_id);
    try {
      var requestrespons = http.MultipartRequest(
        "POST",
        ApiRepo.aftersearchaddcaselist,
      );
      requestrespons.fields['user_id'] = "$user_id";
      requestrespons.fields['case_id'] = "$caseid";

      requestrespons.send().then((res) async {
        var massage = await res.stream.bytesToString();
        var responsedata = json.decode(massage);
        print(responsedata);
        if (res.statusCode == 200) {
          var msg = responsedata['msg'];
          if (msg == "success") {
            internaterror('Added successfully ', context);
          } else if (msg == "error") {
            internaterror('Something went wrong', context);
          } else if (msg == "exist") {
            internaterror('This case already added in your list', context);
          }
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
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

  @override
  //   return InkWell(
  //       onTap: () {
  //         // Navigator.push(
  //         //   context,
  //         //   MaterialPageRoute(
  //         //     builder: (context) => SingleDoctorPage(doctor),
  //         //   ),
  //         // );
  //         // print(doctor.name);
  //         // Navigator.of(context).popAndPushNamed(RouteManager.home_page doctor)=>(doctor);
  //       },
  //       child: Column(
  //         children: [
  //           Card(
  //             margin: EdgeInsets.only(left: 0.0, bottom: 9.0),
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(5.0),
  //             ),
  //             child: Padding(
  //                 padding: EdgeInsets.only(left: 0),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     Text("Court  Name: " + casedata.courtName),
  //                     Text("Case Name  : " + casedata.caseNo),
  //                     Text("Client Name: " + casedata.clientName),
  //                     Text("Dara  : " + casedata.dara),
  //                     Text("Step: " + casedata.step),
  //                     Text("Notes: " + casedata.notes),
  //                     SizedBox(
  //                       height: 20,
  //                     ),
  //                     Padding(
  //                         padding: const EdgeInsets.symmetric(horizontal: 18.0),
  //                         child: Text(
  //                           "Date",
  //                           textDirection: TextDirection.ltr,
  //                           style: TextStyle(
  //                             fontSize: 18,
  //                             color: pcolor,
  //                             fontFamily: 'Poppins',
  //                           ),
  //                         )),
  //                     Text(
  //                       "Next Date:" + casedata.lastDate,
  //                       textDirection: TextDirection.ltr,
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         color: labelhighligt,
  //                         fontFamily: 'Poppins',
  //                       ),
  //                     ),
  //                     Container(
  //                         height: 160.0,
  //                         width: 500.0,
  //                         child: admindate.length == 1
  //                             ? Column(
  //                                 mainAxisAlignment: MainAxisAlignment.start,
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children:
  //                                     List.generate(admindate.length, (index) {
  //                                   return Column(
  //                                     crossAxisAlignment:
  //                                         CrossAxisAlignment.start,
  //                                     children: <Widget>[
  //                                       // Text(
  //                                       //   "Next Date:${admindate[index].toString()}",
  //                                       // ),
  //                                     ],
  //                                   );
  //                                 }))
  //                             : Column(
  //                                 mainAxisAlignment: MainAxisAlignment.center,
  //                                 children:
  //                                     List.generate(admindate.length, (index) {
  //                                   return Column(
  //                                     children: <Widget>[
  //                                       Text(
  //                                         "Previews Date:${admindate[index].toString()}",
  //                                       ),
  //                                     ],
  //                                   );
  //                                 }))),
  //                     Container(
  //                       padding: EdgeInsets.only(left: 230),
  //                       child: ButtonTheme(
  //                         height: 30.0,
  //                         child: FlatButton(
  //                             shape: new RoundedRectangleBorder(
  //                                 borderRadius: new BorderRadius.circular(8.0),
  //                                 side: BorderSide(color: pcolor)),
  //                             onPressed: () {
  //                               caselistdataforself(casedata.id, context);
  //                             },
  //                             color: Colors.white,
  //                             textColor: Colors.black,
  //                             child: Row(
  //                               children: [
  //                                 Icon(
  //                                   Icons.add,
  //                                   color: pcolor,
  //                                 ),
  //                                 Text("Add to my list")
  //                               ],
  //                             )),
  //                       ),
  //                     ),
  //                   ],
  //                 )),
  //           ),
  //         ],
  //       ));
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
                                    "কোটের নাম: " +
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
                                    "মামলার নাম্বার: " +
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
                                    "পক্ষগনের নামঃ " +
                                        casedata["client_name"].toString(),
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
                                Text(
                                  'Step: ',
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
                                    casedata["step"].toString(),
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
                                  'Note: ',
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
                                    casedata["notes"].toString(),
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
                                // Column(
                                //     children: List.generate(admindate.length,
                                //         (index) {
                                //   return Column(
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.start,
                                //     children: <Widget>[
                                //       Text(
                                //         "Previews Date:${admindate[index].toString()}",
                                //         style: TextStyle(
                                //             fontSize: 10,
                                //             fontWeight: FontWeight.bold,
                                //             color: Colors.black),
                                //       ),
                                //     ],
                                //   );
                                // })),
                                // SizedBox(
                                //   width: 2,
                                // ),
                                Text(
                                  "Previews Date:${admindate.last}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                  '|| next date: ',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                  casedata["last_date"].toString(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 0),
                                  child: ButtonTheme(
                                    height: 20.0,
                                    minWidth: 15,
                                    child: FlatButton(
                                        // shape: new RoundedRectangleBorder(
                                        //     borderRadius:
                                        //         new BorderRadius.circular(8.0),
                                        //     side: BorderSide(color: pcolor)),
                                        onPressed: () {
                                          caselistdataforself(
                                              casedata["id"], context);
                                        },
                                        color: Colors.white,
                                        textColor: Colors.black,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: pcolor,
                                              size: 12,
                                            ),
                                            Text(
                                              "add to list",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
