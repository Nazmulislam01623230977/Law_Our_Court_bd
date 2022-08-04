import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/Route/route.dart';
import 'package:ourcourt/Screen/casepremiumreg.dart';
import 'package:ourcourt/Screen/casesearchpage.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:intl/intl.dart';
import 'package:ourcourt/controller/function_con.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Showcasprimammessa extends StatefulWidget {
  Showcasprimammessa({Key? key}) : super(key: key);
  @override
  _ShowcasprimammessaState createState() => _ShowcasprimammessaState();
}

class _ShowcasprimammessaState extends StateMVC<Showcasprimammessa> {
  DateTime _pickupDate = DateTime.now();

  late FunctionController function;
  _ShowcasprimammessaState() : super(FunctionController()) {
    function = controller as FunctionController;
  }
  List listofcasedata = [];
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
        // pickupDate = datetime;

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
            firstDate: DateTime(DateTime.now().year - 5,
                DateTime.now().month - 12, DateTime.now().day - 7),
            lastDate: DateTime(DateTime.now().year + 9,
                DateTime.now().month + 12, DateTime.now().day + 7))
        .then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          sharedPreferences.setString("datetime", '$value');
          pickupDate = value;
          pickupdatevalue = value;
        });

        function.casepremiumlist(pickupdatevalue, context);
      }
    });
  }

  @override
  // @override
  void initState() {
    this.getdate();
    super.initState();
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
          "Case Dairy Premium",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Color(0xffffffff),
          ),
        ),
      ),
      body: Container(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: TextButton(
                    child: Text(
                      DateFormat.yMMMMEEEEd().format(pickupDate),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        pickDate(context);
                        // print(pickDate);
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                // Center(
                //   child: TextButton(
                //     child: Text(DateFormat.d().format(initialDate) +
                //         pickupDate.toString()),
                //     style: TextButton.styleFrom(
                //       primary: Colors.black,
                //     ),
                //     onPressed: () {
                //       setState(() {
                //         pickDate(context);
                //         // print(pickDate);
                //       });
                //     },
                //   ),
                // ),
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Text(
                    'আজ 0 টি মামলা পর্যাবেক্ষন করা হচ্ছে ।',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                                    builder: (context) => CasePremReg(),
                                  ));
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
                                    builder: (context) => CaseSearchPage(),
                                  ));
                            },
                            color: Colors.white,
                            textColor: Colors.black,
                            child: Icon(
                              Icons.search,
                              color: pcolor,
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    'আপনার কেস ডেইরিতে কোন মামলা নেই ।',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    'যে মামলা গুলু পর্যবেক্ষণ করতে চান সে গুলি কেস ডেইরিতে যুক্ত করুন।',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 50),
                //   child: Text(
                //     '',
                //     style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
