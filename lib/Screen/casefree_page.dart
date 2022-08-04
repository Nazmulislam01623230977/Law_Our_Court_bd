import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/Route/route.dart';
import 'package:ourcourt/Screen/freecasereg.dart';
import 'package:ourcourt/Screen/freecasesearchpage.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:intl/intl.dart';
import 'package:ourcourt/controller/function_con.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CaseFree extends StatefulWidget {
  CaseFree({Key? key}) : super(key: key);

  @override
  _CaseFreeState createState() => _CaseFreeState();
}

class _CaseFreeState extends StateMVC<CaseFree> {
  DateTime _pickupDate = DateTime.now();

  late FunctionController function;
  _CaseFreeState() : super(FunctionController()) {
    function = controller as FunctionController;
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
            firstDate: DateTime(DateTime.now().year - 12,
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

        function.freecaselist(pickupdatevalue, context);
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
          "Case Free",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
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
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Center(
                      child: Text(
                    'আপনার কেস ডেইরিতে কোন মামলা নেই ।',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
