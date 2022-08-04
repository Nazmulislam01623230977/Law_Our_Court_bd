import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/Route/route.dart';
import 'package:ourcourt/Screen/caseedite/freecaseedite.dart';
import 'package:ourcourt/Screen/freecasedateupdate.dart';
import 'package:ourcourt/Screen/freecasereg.dart';
import 'package:ourcourt/Screen/freecasesearchpage.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/controller/function_con.dart';
import 'package:ourcourt/widgets/freecaselistwidget.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class CasefreeShow extends StatefulWidget {
  var casedairydata;
  CasefreeShow(this.casedairydata);

  @override
  _CasefreeShowState createState() => _CasefreeShowState(this.casedairydata);
}

class _CasefreeShowState extends StateMVC<CasefreeShow> {
  List casedairydata;
  late FunctionController function;
  _CasefreeShowState(this.casedairydata) : super(FunctionController()) {
    function = controller as FunctionController;
  }
  List listofcasedata = [];
  var pickupDate;
  var datetime;
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

  String getpicupdate = "";
  @override
  Future pickDate(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var newDate = await showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: DateTime(DateTime.now().year - 12,
                DateTime.now().month - 12, DateTime.now().day - 7),
            lastDate: DateTime(DateTime.now().year + 9,
                DateTime.now().month + 12, DateTime.now().day + 7))
        .then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          pickupDate = value;
          pickupdatevalue = value;
          sharedPreferences.setString("datetime", '$pickupDate');
        });

        function.freecaselist(pickupdatevalue, context);
      }
    });
  }

  var currentdate;

  getcurrentdate() async {
    setState(() {
      currentdate =
          "${initialDate.day}-${initialDate.month}-${initialDate.year}";
    });
    print(currentdate);
  }

  @override
  void initState() {
    this.getdate();
    this.getcurrentdate();
    super.initState();
  }

  caselistdataforself(int caseid, BuildContext context) async {
    print(caseid);
    try {
      var requestrespons = http.MultipartRequest("GET",
          Uri.parse("https://ourcourtbd.com/api/selfcaselistdelete/$caseid"));

      requestrespons.send().then((res) async {
        var massage = await res.stream.bytesToString();
        var responsedata = json.decode(massage);
        print(responsedata);
        if (res.statusCode == 200) {
          var msg = responsedata['msg'];
          if (msg == "success") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FreeCaseSearchPage()),
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
          "Case Free",
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
                Container(
                  padding: EdgeInsets.only(left: 100),
                  child: ButtonTheme(
                    height: 30.0,
                    child: FlatButton(
                        onPressed: () {
                          setState(() {
                            pickDate(context);
                          });
                        },
                        color: Colors.white,
                        textColor: Colors.black,
                        child: Text(
                          DateFormat.yMMMMEEEEd().format(pickupDate),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'UbuntuCondensed-Regular'),
                          textAlign: TextAlign.left,
                        )),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 100),
                      child: ButtonTheme(
                        height: 30.0,
                        child: RaisedButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                                side: BorderSide(color: pcolor)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CafreeReg()),
                              );
                            },
                            color: pcolor,
                            textColor: Colors.black,
                            child: Text(
                              "নতুন  মামলা  যুক্ত  করুন",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'UbuntuCondensed-Regular'),
                              textAlign: TextAlign.left,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(),
                      child: ButtonTheme(
                        height: 30.0,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FreeCaseSearchPage(),
                                  ));
                            },
                            child: Icon(
                              Icons.search,
                              color: pcolor,
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'আমার কজলিস্ট',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                    width: double.infinity,
                    height: 600.0,
                    child: casedairydata.length != 0
                        ? ListView.builder(
                            itemCount: casedairydata.length,
                            scrollDirection: Axis.vertical,
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var casedata = casedairydata[index];
                              var admindate = jsonDecode(casedata["self_date"]);

                              return GestureDetector(
                                child: Card(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: 10,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.white70
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      2), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5,
                                                          bottom: 2,
                                                          left: 8),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 0),
                                                            child: Text(
                                                              casedata[
                                                                      "court_name"]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
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
                                                      const EdgeInsets.only(
                                                          top: 2,
                                                          bottom: 2,
                                                          left: 8),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 0),
                                                            child: Text(
                                                              casedata["case_type"]
                                                                      .toString() +
                                                                  casedata[
                                                                          "case_no"]
                                                                      .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 2,
                                                          bottom: 2,
                                                          left: 8),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 0),
                                                            child: Text(
                                                              casedata["client_name"]
                                                                      .toString() +
                                                                  " বনাম " +
                                                                  casedata[
                                                                          "bclient_name"]
                                                                      .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 2,
                                                          bottom: 2,
                                                          left: 8),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'ধারা: ',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 0),
                                                            child: Text(
                                                              casedata["dara"]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 2,
                                                          bottom: 2,
                                                          left: 8),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 0),
                                                            child: casedata[
                                                                        "step"] !=
                                                                    null
                                                                ? Text(
                                                                    'Step: ' +
                                                                        casedata["step"]
                                                                            .toString(),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .black),
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
                                                      const EdgeInsets.only(
                                                          top: 2,
                                                          bottom: 2,
                                                          left: 8),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .only(top: 0),
                                                              child: casedata[
                                                                          "notes"] !=
                                                                      null
                                                                  ? Text(
                                                                      "Note: " +
                                                                          casedata["notes"]
                                                                              .toString(),
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Colors.black),
                                                                    )
                                                                  : Text('')),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Text(
                                                //   "Register date: " +
                                                //       casedata["reg_date"]
                                                //           .toString(),
                                                //   style: TextStyle(
                                                //       fontSize: 12,
                                                //       fontWeight:
                                                //           FontWeight.bold,
                                                //       color: Colors.black),
                                                // ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 2,
                                                          bottom: 2,
                                                          left: 8),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 0),
                                                              child:
                                                                  ButtonTheme(
                                                                height: 30.0,
                                                                child:
                                                                    RaisedButton(
                                                                  shape: new RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          new BorderRadius.circular(
                                                                              8.0),
                                                                      side: BorderSide(
                                                                          color:
                                                                              pcolor)),
                                                                  onPressed:
                                                                      () {},
                                                                  color: Colors
                                                                      .white,
                                                                  textColor:
                                                                      Colors
                                                                          .black,
                                                                  child: Text(
                                                                    "Previews Date:${admindate.last}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              )),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Column(
                                                            children: [
                                                              Container(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              0),
                                                                  child: casedata["last_date"]
                                                                              .toString() ==
                                                                          currentdate
                                                                              .toString()
                                                                      ? ButtonTheme(
                                                                          height:
                                                                              30.0,
                                                                          child:
                                                                              RaisedButton(
                                                                            shape:
                                                                                new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0), side: BorderSide(color: pcolor)),
                                                                            onPressed:
                                                                                () {},
                                                                            color:
                                                                                Colors.white,
                                                                            textColor:
                                                                                Colors.black,
                                                                            child:
                                                                                Text(
                                                                              "Live: " + casedata["last_date"].toString(),
                                                                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                                                                            ),
                                                                          ))
                                                                      : ButtonTheme(
                                                                          height:
                                                                              30.0,
                                                                          child:
                                                                              RaisedButton(
                                                                            shape:
                                                                                new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0), side: BorderSide(color: pcolor)),
                                                                            onPressed:
                                                                                () {},
                                                                            color:
                                                                                Colors.white,
                                                                            textColor:
                                                                                Colors.black,
                                                                            child:
                                                                                Text(
                                                                              "next date: " + casedata["last_date"].toString(),
                                                                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                                                                            ),
                                                                          ))),
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
                                            padding: const EdgeInsets.only(
                                                top: 2, bottom: 2, left: 80),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 0),
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
                                                                        FreeDateUpdatePage(
                                                                            casedata),
                                                                  ));

                                                              // caselistdataforself(
                                                              //     casedata["id"], context);
                                                            },
                                                            color: Colors.white,
                                                            textColor:
                                                                Colors.black,
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "History",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .black),
                                                                )
                                                              ],
                                                            )),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 0),
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
                                                                        FreeCaseEditPage(
                                                                            casedata),
                                                                  ));

                                                              // caselistdataforself(
                                                              //     casedata["id"], context);
                                                            },
                                                            color: Colors.white,
                                                            textColor:
                                                                Colors.black,
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "Edit",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .black),
                                                                )
                                                              ],
                                                            )),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 0),
                                                      child: ButtonTheme(
                                                        height: 20.0,
                                                        minWidth: 10,
                                                        child: FlatButton(
                                                            onPressed: () {
                                                              caselistdataforself(
                                                                  casedata[
                                                                      "id"],
                                                                  context);
                                                            },
                                                            color: Colors.white,
                                                            textColor:
                                                                Colors.black,
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "Remove",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .black),
                                                                )
                                                              ],
                                                            )),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                        child: casedata[
                                                                    "phone_no"] !=
                                                                null
                                                            ? Row(
                                                                children: [
                                                                  InkWell(
                                                                    child: Wrap(
                                                                      spacing:
                                                                          12,
                                                                      children: <
                                                                          Widget>[
                                                                        Icon(
                                                                          Icons
                                                                              .sms,
                                                                          color:
                                                                              Colors.orange,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    onTap: () =>
                                                                        UrlLauncher.launch(
                                                                            "sms:${casedata["phone_no"].toString()}"),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  InkWell(
                                                                    child: Wrap(
                                                                      spacing:
                                                                          12,
                                                                      children: <
                                                                          Widget>[
                                                                        Icon(
                                                                          Icons
                                                                              .phone_in_talk,
                                                                          color:
                                                                              Colors.green,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    onTap: () =>
                                                                        UrlLauncher.launch(
                                                                            "tel:${casedata["phone_no"].toString()}"),
                                                                  ),
                                                                ],
                                                              )
                                                            : Center())
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

                              // return FreecaselistWidge(casedata: casedata);
                            },
                          )
                        : Center(child: CircularProgressIndicator()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
