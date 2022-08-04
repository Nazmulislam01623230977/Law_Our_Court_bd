import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/controller/function_con.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CasePremReg extends StatefulWidget {
  CasePremReg({Key? key}) : super(key: key);

  @override
  _CasepremiumRegState createState() => _CasepremiumRegState();
}

class _CasepremiumRegState extends StateMVC<CasePremReg> {
  late FunctionController function;
  _CasepremiumRegState() : super(FunctionController()) {
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
  var datetime;
  var pickupDate;
  var pickupdatevalue;

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

  DateTime _pickupDate1 = DateTime.now();
  DateTime _pickupDate = DateTime.now();
  String getpicupdate = "";
  var initialDate = DateTime.now();
  @override
  Future pickDate(BuildContext context) async {
    var newDate = await showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: DateTime(DateTime.now().year - 4,
                DateTime.now().month - 12, DateTime.now().day - 7),
            lastDate: DateTime(DateTime.now().year + 0,
                DateTime.now().month + 0, DateTime.now().day + 6))
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            function.casepremiumlist(pickupDate, context);
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
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(),
                          top: BorderSide(),
                          left: BorderSide(),
                          right: BorderSide()),
                      // borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton(
                      hint: _disticValue == ''
                          ? Text('জেলা নির্বাচন করুন')
                          : Text(
                              _disticValue,
                              style: TextStyle(color: Colors.black),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.black),
                      items: ['Cumilla', 'Dhaka', 'barisal', 'Chittagong'].map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (String? val) {
                        setState(
                          () {
                            _disticValue = val!;
                          },
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(),
                          top: BorderSide(),
                          left: BorderSide(),
                          right: BorderSide()),
                      // borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton(
                      hint: _courtValue == ''
                          ? Text('আদালত নির্বাচন করুন')
                          : Text(
                              _courtValue,
                              style: TextStyle(color: Colors.black),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.black),
                      items: ['Cumilla', 'Dhaka', 'Barisal', 'Chittagong'].map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (String? val) {
                        setState(
                          () {
                            _courtValue = val!;
                          },
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: TextField(
                      controller: caseTypeController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'মামলার টাইপ',
                        border: OutlineInputBorder(),
                        labelText: 'মামলার টাইপ',
                      ),
                      // maxLines: null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: TextField(
                      controller: casenoController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'মামলার নাম্বার/বছর',
                        border: OutlineInputBorder(),
                        labelText: 'মামলার নাম্বার/বছর',
                      ),
                      // maxLines: null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: TextField(
                      controller: clientnameController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'বাদী ',
                        border: OutlineInputBorder(),
                        labelText: 'বাদী   ',
                      ),
                      // maxLines: null,
                    ),
                  ),
                ),
                Text("বনাম"),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: TextField(
                      controller: bclientnameController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'বিবাদী',
                        border: OutlineInputBorder(),
                        labelText: 'বিবাদী',
                      ),
                      // maxLines: null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: TextField(
                      controller: daraController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'ধারা : ',
                        border: OutlineInputBorder(),
                        labelText: 'ধারা :',
                      ),
                      // maxLines: null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: TextField(
                      controller: phonenoController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Phone no',
                        border: OutlineInputBorder(),
                        labelText: 'Phone',
                      ),
                      // maxLines: null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: TextField(
                      controller: stepController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Step',
                        border: OutlineInputBorder(),
                        labelText: 'Step ',
                      ),
                      // maxLines: null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: TextField(
                      controller: notesController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Notes',
                        border: OutlineInputBorder(),
                        labelText: 'Notes ',
                      ),
                      // maxLines: null,
                    ),
                  ),
                ),
                Container(
                  width: 370,
                  child: OutlineButton(
                    child: Text(
                        'Previes Date :  ${_pickupDate.day}-${_pickupDate.month}-${_pickupDate.year}'),
                    // style: TextButton.styleFrom(
                    //   primary: Colors.black,
                    // ),
                    onPressed: () {
                      setState(() {
                        pickDate(context);
                        // print(pickDate);
                      });
                    },
                  ),
                  // maxLines: null,
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_disticValue == "") {
                      internaterror("District con not be empty !!", context);
                    } else if (_courtValue == "") {
                      internaterror("Court con not be empty !!", context);
                    } else if (casenoController.text == "") {
                      internaterror("Case no con not be empty !!", context);
                    } else if (caseTypeController.text == "") {
                      internaterror("Case Type  con not be empty !!", context);
                    } else if (getpicupdate == "") {
                      internaterror("Date con not be empty !!", context);
                    } else {
                      function.casepremiumadd(
                          _disticValue,
                          _courtValue,
                          casenoController.text,
                          clientnameController.text,
                          daraController.text,
                          stepController.text,
                          notesController.text,
                          getpicupdate,
                          phonenoController.text,
                          caseTypeController.text,
                          bclientnameController.text,
                          context);
                    }

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
