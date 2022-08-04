import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:ourcourt/Route/route.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/widgets/pdf4.dart';

class BarNotice extends StatefulWidget {
  var casestudies;
  BarNotice(this.casestudies);
  @override
  _BarNoticeState createState() => _BarNoticeState(this.casestudies);
}

class _BarNoticeState extends State<BarNotice> {
  var casestudies;
  _BarNoticeState(this.casestudies);

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
          "Bar Association Notice ",
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
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: double.infinity,
                    color: Color(0xffffffff),
                    //decoration: BoxShadow(),
                    child: Card(
                      color: Color(0xffffffff),
                      shadowColor: Colors.white10,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: casestudies.length > 0
                          ? ListView.builder(
                              itemCount: casestudies.length,
                              itemBuilder: (con, index) {
                                return Card(
                                  child: ListTile(
                                    subtitle: FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PDF4(casestudies[index])),
                                        );
                                      },
                                      color: Color(0xFFFFFFFF),
                                      child: Container(
                                          child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(casestudies[index].title),
                                          // Icon(
                                          //   Icons.arrow_forward,
                                          //   color: Colors.teal,
                                          // ),
                                          SizedBox(
                                            width: 60,
                                          ),
                                          Text("View",
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Poppins')),
                                        ],
                                      )),
                                    ),
                                    // Text("${darftandbooks[index].title}"),
                                  ),
                                );
                              })
                          : Center(child: Text('Data Not found')),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
