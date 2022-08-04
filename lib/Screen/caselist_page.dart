import 'package:flutter/material.dart';
import 'package:ourcourt/Route/route.dart';

class CaseList extends StatefulWidget {
  CaseList({Key? key}) : super(key: key);

  @override
  _CaseListState createState() => _CaseListState();
}

class _CaseListState extends State<CaseList> {
  String _tittleValue = '';
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
        backgroundColor: Color(0xff44cb7e),
        centerTitle: true,
        title: Text(
          "Case List",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Color(0xffffffff),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 50,
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
                    hint: _tittleValue == ''
                        ? Text('Selected District')
                        : Text(
                            _tittleValue,
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
                          _tittleValue = val!;
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.95,
                child: ListView(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Card(
                        margin: EdgeInsets.all(4),
                        elevation: 5,
                        shadowColor: Color(0xFF93CAC6),
                        color: Color(0xFFCAE2E0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .popAndPushNamed(RouteManeger.pdf_page);
                          },
                          splashColor: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //Image.asset('assets/images/diary.png',height: 80,width: 40,),
                              //Icon(Icons.dashboard_customize, size: 50.0),
                              SizedBox(
                                height: 3,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'case no 4',
                                      style: TextStyle(fontSize: 12.5),
                                    ),
                                    Text(
                                      '>',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Card(
                        margin: EdgeInsets.all(4),
                        elevation: 5,
                        shadowColor: Color(0xFF93CAC6),
                        color: Color(0xFFCAE2E0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: InkWell(
                          onTap: () {
                            // Navigator.of(context)
                            //     .popAndPushNamed(RouteManeger.casepremium_page);
                          },
                          splashColor: Colors.green,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //Image.asset('assets/images/diary.png',height: 80,width: 40,),
                                //Icon(Icons.dashboard_customize, size: 50.0),
                                SizedBox(
                                  height: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'case no 3',
                                        style: TextStyle(fontSize: 12.5),
                                      ),
                                      Text(
                                        '>',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Card(
                        margin: EdgeInsets.all(4),
                        elevation: 5,
                        shadowColor: Color(0xFF93CAC6),
                        color: Color(0xFFCAE2E0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .popAndPushNamed(RouteManeger.pdf_page);
                          },
                          splashColor: Colors.green,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //Image.asset('assets/images/diary.png',height: 80,width: 40,),
                                //Icon(Icons.dashboard_customize, size: 50.0),
                                SizedBox(
                                  height: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'case no 42',
                                        style: TextStyle(fontSize: 12.5),
                                      ),
                                      Text(
                                        '>',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Card(
                        margin: EdgeInsets.all(4),
                        elevation: 5,
                        shadowColor: Color(0xFF93CAC6),
                        color: Color(0xFFCAE2E0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .popAndPushNamed(RouteManeger.pdf_page);
                          },
                          splashColor: Colors.green,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //Image.asset('assets/images/diary.png',height: 80,width: 40,),
                                // Icon(Icons.dashboard_customize, size: 50.0),
                                SizedBox(
                                  height: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'case no 2',
                                        style: TextStyle(fontSize: 12.5),
                                      ),
                                      Text(
                                        '>',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
