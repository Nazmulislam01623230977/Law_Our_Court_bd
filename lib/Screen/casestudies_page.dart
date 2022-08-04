import 'package:flutter/material.dart';
import 'package:ourcourt/Route/route.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/widgets/pdf3.dart';

class CaseStudies extends StatefulWidget {
  var casestudies;
  CaseStudies(this.casestudies);
  @override
  _CaseStudiesState createState() => _CaseStudiesState(this.casestudies);
}

class _CaseStudiesState extends State<CaseStudies> {
  var casestudies;
  _CaseStudiesState(this.casestudies);
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
          "Case Studies ",
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
                                                  PDF3(casestudies[index])),
                                        );
                                      },
                                      color: Color(0xFFFFFFFF),
                                      child: Container(
                                          child: Row(
                                        children: [
                                          Text(casestudies[index].title),
                                          // Icon(
                                          //   Icons.arrow_forward,
                                          //   color: Colors.teal,
                                          // ),
                                          // Text("Doctors",
                                          //     textDirection: TextDirection.ltr,
                                          //     style: TextStyle(
                                          //         fontSize: 14,
                                          //         fontWeight: FontWeight.bold,
                                          //         fontFamily: 'Poppins')),
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
