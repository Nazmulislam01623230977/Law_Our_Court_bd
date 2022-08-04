import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/apirepositor/apirepositor.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/controller/function_con.dart';
import 'package:http/http.dart' as http;
import 'package:ourcourt/widgets/freesearchcaselistwidge.dart';
import 'dart:convert';
import 'package:ourcourt/widgets/searchcaselistwidge.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FreeCaseSearchPage extends StatefulWidget {
  @override
  _FreeCaseSearchPageState createState() => _FreeCaseSearchPageState();
}

class _FreeCaseSearchPageState extends StateMVC<FreeCaseSearchPage> {
  late FunctionController function;
  _FreeCaseSearchPageState() : super(FunctionController()) {
    function = controller as FunctionController;
  }
  List listofcasedata = [];
  TextEditingController? _searchEditingController = TextEditingController();

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

  searchdata(String value, BuildContext context) async {
    print(value);
    try {
      var requestrespons = http.MultipartRequest(
        "POST",
        ApiRepo.casedairysearch,
      );
      requestrespons.fields['case_no'] = value;
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          setState(() {
            listofcasedata = responsedata['case'];
          });
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
            function.freecaselist(pickupDate, context);
          },
        ),
        backgroundColor: pcolor,
        centerTitle: true,
        title: Text(
          "Case Search",
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
                    child: TextFormField(
                      controller: _searchEditingController,
                      onChanged: (value) {
                        searchdata(value, context);
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black87),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.search,
                          ),
                          // suffixIcon: IconButton(icon: Icon(Icons.search),),
                          // ),
                          hintText: 'Case No/Date',
                          hintStyle: TextStyle(
                              fontSize: 12.0,
                              height: 2.0,
                              color: Colors.black)),
                    )),
                SizedBox(
                  height: 25,
                ),
                Container(
                    width: double.infinity,
                    height: 570.0,
                    child: listofcasedata.length != 0
                        ? ListView.builder(
                            itemCount: listofcasedata.length,
                            scrollDirection: Axis.vertical,
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var casedata = listofcasedata[index];
                              return FreeSearchCaseWidge(casedata: casedata);
                            },
                          )
                        : Center(child: Text('No Data Found')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
