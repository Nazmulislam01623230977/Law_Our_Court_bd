import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/Drawer/drawer.dart';
import 'package:ourcourt/Route/route.dart';
import 'package:ourcourt/Screen/listmydiary.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/controller/function_con.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboadPage extends StatefulWidget {
  DashboadPage({Key? key}) : super(key: key);

  @override
  _DashboadPageState createState() => _DashboadPageState();
}

class _DashboadPageState extends StateMVC<DashboadPage> {
  late FunctionController _function;
  _DashboadPageState() : super(FunctionController()) {
    _function = controller as FunctionController;
  }

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
  // var getpicupdate;

  // print(getpicupdate);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: pcolor,
        title: Text(
          'Our Court',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              fontSize: 15),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      backgroundColor: Color(0xFFE0E6E3),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: [
            Card(
              //margin: EdgeInsets.all(4),
              elevation: 5,
              shadowColor: Color(0xFF099C90),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: ()
                    //
                    {
                  _function.casepremiumlist(pickupDate, context);
                  // Navigator.of(context)
                  //     .popAndPushNamed(RouteManeger.casepremium_page);
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                   // mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: new Image.asset(
                          'assets/images/premium.png',
                          // height: 50,
                          // width: 50,
                          fit: BoxFit.cover
                        ),
                      ),
                      //Icon(Icons.dashboard_customize, size: 50.0),
                      SizedBox(
                        height: 3,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            'Case Diary',
                            style: TextStyle(fontSize: 9.5,
                            color: Color(0xFF247AB3),
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                       ) ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(4),
              elevation: 5,
              shadowColor: Color(0xFF099C90),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {
                  // Navigator.of(context)
                  //     .popAndPushNamed(RouteManeger.casefree_page);

                  _function.freecaselist(pickupDate, context);
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                       Center(
                        child: new Image.asset(
                          'assets/images/casediary.png',
                          // height: 50,
                          // width: 50,
                          fit: BoxFit.cover
                        ),
                      ),
                      //Icon(Icons.book, size: 50.0),
                      SizedBox(
                        height: 3,
                      ),
                      Text('Case Diary', style: TextStyle(fontSize: 9.5,
                            color: Color(0xFF247AB3),
                            fontWeight: FontWeight.bold
                          ),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(4),
              elevation: 5,
              shadowColor: Color(0xFF099C90),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .popAndPushNamed(RouteManeger.registrationlawyer_page);
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                   // mainAxisSize: MainAxisSize.min,
                    children: [
                       Center(
                        child: new Image.asset(
                          'assets/images/registerlawyer.png',
                          // height: 50,
                          // width: 50,
                          fit: BoxFit.cover
                        ),
                      ),
                      //Icon(Icons.report_gmailerrorred, size: 50.0),
                      SizedBox(
                        height: 3,
                      ),
                      Text('Registration Lawyer',
                          style: TextStyle(fontSize: 9.5,
                            color: Color(0xFF247AB3),
                            fontWeight: FontWeight.bold
                          ),)
                    ],
                  ),
                ),
              ),
            ),
            // Card(
            //   margin: EdgeInsets.all(4),
            //   elevation: 5,
            //   shadowColor: Color(0xFF099C90),
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8)),
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.of(context)
            //           .popAndPushNamed(RouteManeger.caselist_page);
            //     },
            //     splashColor: Colors.green,
            //     child: Center(
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           Icon(Icons.cases, size: 50.0),
            //           SizedBox(
            //             height: 3,
            //           ),
            //           Text('Case List', style: TextStyle(fontSize: 9.5))
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
           
            Card(
              margin: EdgeInsets.all(4),
              elevation: 5,
              shadowColor: Color(0xFF099C90),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {
                  _function.darftandbooks(context);
                  // Navigator.of(context)
                  //     .popAndPushNamed(RouteManeger.legaldrafting_page);
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                   // mainAxisSize: MainAxisSize.min,
                    children: [
                       Center(
                        child: new Image.asset(
                          'assets/images/legaldraftting.png',
                          // height: 50,
                          // width: 50,
                          fit: BoxFit.cover
                        ),
                      ),
                      //Icon(Icons.drafts, size: 50.0),
                      SizedBox(
                        height: 3,
                      ),
                      Text('Legal Drafting', style: TextStyle(fontSize: 9.5,
                            color: Color(0xFF247AB3),
                            fontWeight: FontWeight.bold
                          ),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(4),
              elevation: 5,
              shadowColor: Color(0xFF099C90),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {
                  _function.mydiarylist(pickupDate, context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ListDiary(context)),
                  // );
                  // Navigator.of(context)
                  //     .popAndPushNamed(RouteManeger.listdiary_page);
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                       Center(
                        child: new Image.asset(
                          'assets/images/mydiary.png',
                          // height: 50,
                          // width: 50,
                          fit: BoxFit.cover
                        ),
                      ),
                      //Icon(Icons.book_online, size: 50.0),
                      SizedBox(
                        height: 3,
                      ),
                      Text('My Diary', style: TextStyle(fontSize: 9.5,
                            color: Color(0xFF247AB3),
                            fontWeight: FontWeight.bold
                          ),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(4),
              elevation: 5,
              shadowColor: Color(0xFF099C90),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {
                  _function.lowdictionaryfunction(context);
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: new Image.asset(
                          'assets/images/lawdictionary.png',
                          // height: 50,
                          // width: 50,
                          fit: BoxFit.cover
                        ),
                      ),
                      //Icon(Icons.low_priority_sharp, size: 50.0),
                      SizedBox(
                        height: 3,
                      ),
                      Text('Law Dictionary',style: TextStyle(fontSize: 9.5,
                            color: Color(0xFF247AB3),
                            fontWeight: FontWeight.bold
                          ),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(4),
              elevation: 5,
              shadowColor: Color(0xFF099C90),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {
                  _function.madicaldictionay(context);
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                        Center(
                        child: new Image.asset(
                          'assets/images/medicale.png',
                          // height: 50,
                          // width: 50,
                          fit: BoxFit.cover
                        ),
                      ),

                      //Icon(Icons.medical_services, size: 50.0),
                      SizedBox(
                        height: 3,
                      ),
                      Text('Medical Dictionary',
                          style: TextStyle(fontSize: 9.5,
                            color: Color(0xFF247AB3),
                            fontWeight: FontWeight.bold
                          ),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(4),
              elevation: 5,
              shadowColor: Color(0xFF099C90),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {
                   Navigator.of(context).popAndPushNamed(RouteManeger.blognews_page);
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                       Center(
                        child: new Image.asset(
                          'assets/images/legalnews.png',
                          // height: 50,
                          // width: 50,
                          fit: BoxFit.cover
                        ),
                      ),
                      //Icon(Icons.open_in_new, size: 50.0),
                      SizedBox(
                        height: 3,
                      ),
                      Text('Legal News/ Blog',style: TextStyle(fontSize: 9.5,
                            color: Color(0xFF247AB3),
                            fontWeight: FontWeight.bold
                          ),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(4),
              elevation: 5,
              shadowColor: Color(0xFF099C90),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {
                  _function.lowbooks(context);
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: new Image.asset(
                          'assets/images/lawbook.png',
                          // height: 50,
                          // width: 50,
                          fit: BoxFit.cover
                        ),
                      ),
                      //Icon(Icons.book_rounded, size: 50.0),
                      SizedBox(
                        height: 3,
                      ),
                      Text('Law Book', style: TextStyle(fontSize: 9.5,
                            color: Color(0xFF247AB3),
                            fontWeight: FontWeight.bold
                          ),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(4),
              elevation: 5,
              shadowColor: Color(0xFF099C90),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {
                  _function.casestudies(context);
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: new Image.asset(
                          'assets/images/study.png',
                          // height: 50,
                          // width: 50,
                          fit: BoxFit.cover
                        ),
                      ),
                      //Icon(Icons.cases_rounded, size: 50.0),
                      SizedBox(
                        height: 3,
                      ),
                      Text('Case Studies', style: TextStyle(fontSize: 9.5,
                            color: Color(0xFF247AB3),
                            fontWeight: FontWeight.bold
                          ),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(4),
              elevation: 5,
              shadowColor: Color(0xFF099C90),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {
                  _function.lowerlist(context);
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                   // mainAxisSize: MainAxisSize.min,
                    children: [
                        Center(
                        child: new Image.asset(
                          'assets/images/lawyer.png',
                          // height: 50,
                          // width: 50,
                          fit: BoxFit.cover
                        ),
                      ),
                      //Icon(Icons.looks_two_sharp, size: 50.0),
                      SizedBox(
                        height: 3,
                      ),
                      Text('Lawyer', style: TextStyle(fontSize: 9.5,
                            color: Color(0xFF247AB3),
                            fontWeight: FontWeight.bold
                          ),)
                    ],
                  ),
                ),
              ),
            ),
            // Card(
            //   margin: EdgeInsets.all(4),
            //   elevation: 5,
            //   shadowColor: Color(0xFF099C90),
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8)),
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.of(context)
            //           .popAndPushNamed(RouteManeger.contact_page);
            //     },
            //     splashColor: Colors.green,
            //     child: Center(
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         //mainAxisSize: MainAxisSize.min,
            //         children: [
            //           Icon(Icons.contact_page_rounded, size: 50.0),
            //           SizedBox(
            //             height: 3,
            //           ),
            //           Text('Contacts', style: TextStyle(fontSize: 9.5))
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            
            Card(
              margin: EdgeInsets.all(4),
              elevation: 5,
              shadowColor: Color(0xFF099C90),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {
                  // Navigator.of(context)
                  //     .popAndPushNamed(RouteManeger.dailrycalender_page);

                  _function.supremcourtcalender(context);
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: new Image.asset(
                          'assets/images/calender.png',
                          // height: 50,
                          // width: 50,
                          fit: BoxFit.cover
                        ),
                      ),
                     // Icon(Icons.calendar_today_rounded, size: 50.0),
                      SizedBox(
                        height: 3,
                      ),
                      Text('Supreme Count Calender',
                          style: TextStyle(fontSize: 9.5,
                            color: Color(0xFF247AB3),
                            fontWeight: FontWeight.bold
                          ),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(4),
              elevation: 5,
              shadowColor: Color(0xFF099C90),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {
                  _function.barassociationnotice(context);
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                   // mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: new Image.asset(
                          'assets/images/bar.png',
                          // height: 50,
                          // width: 50,
                          fit: BoxFit.cover
                        ),
                      ),
                      //Icon(Icons.notification_add, size: 50.0),
                      SizedBox(
                        height: 3,
                      ),
                      Text('Bar Association Notice',
                          style: TextStyle(fontSize: 9.5,
                            color: Color(0xFF247AB3),
                            fontWeight: FontWeight.bold
                          ),)
                    ],
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
