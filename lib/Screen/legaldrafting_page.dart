import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:ourcourt/Route/route.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/widgets/pdf1.dart';

class LegalDraftinf extends StatefulWidget {
  var darftandbooks;
  LegalDraftinf(this.darftandbooks);

  @override
  _LegalDraftinfState createState() => _LegalDraftinfState(this.darftandbooks);
}

class _LegalDraftinfState extends State<LegalDraftinf> {
  var darftandbooks;
  _LegalDraftinfState(this.darftandbooks);
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
          "Legal Drafting ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Color(0xffffffff),
          ),
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Container(
      //     child: darftandbooks.length > 0
      //         ? ListView.builder(
      //             itemCount: darftandbooks.length,
      //             itemBuilder: (con, index) {
      //               return Column(
      //                 children: [
      //                   InkWell(
      //                     onTap: () {
      //                       // Navigator.of(context)
      //                       //     .popAndPushNamed(RouteManeger.pdf1_page);

      //                       Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                             builder: (context) =>
      //                                 PDF1(darftandbooks[index])),
      //                       );
      //                     },
      //                     // child: Padding(
      //                     //   padding: const EdgeInsets.only(
      //                     //       top: 8, left: 8, right: 8, bottom: 0),
      //                     //   child: Container(
      //                     //     height: MediaQuery.of(context).size.height * 0.1,
      //                     //     width: double.infinity,
      //                     //     color: Color(0xffffffff),
      //                     //     //decoration: BoxShadow(),
      //                     //     child: Card(
      //                     //       color: Color(0xE7E5E1F3),
      //                     //       shadowColor: Colors.white10,
      //                     //       elevation: 5,
      //                     //       shape: RoundedRectangleBorder(
      //                     //         borderRadius: BorderRadius.circular(5.0),
      //                     //       ),
      //                     //       child: Padding(
      //                     //         padding: const EdgeInsets.all(8.0),
      //                     //         child: Column(
      //                     //           mainAxisAlignment: MainAxisAlignment.center,
      //                     //           crossAxisAlignment:
      //                     //               CrossAxisAlignment.center,
      //                     //           children: [
      //                     //             // Text('Title: The law book'),
      //                     //             // SizedBox(
      //                     //             //   height: 5,
      //                     //             // ),
      //                     //             Row(
      //                     //               mainAxisAlignment:
      //                     //                   MainAxisAlignment.spaceBetween,
      //                     //               children: [
      //                     //                 Center(
      //                     //                     child: Text(
      //                     //                   'Title: The law book',
      //                     //                   style: TextStyle(
      //                     //                       fontSize: 14,
      //                     //                       fontWeight: FontWeight.bold,
      //                     //                       color: Colors.black54),
      //                     //                 )),
      //                     //                 Center(
      //                     //                     child: Text(
      //                     //                   ' Veiw ',
      //                     //                   style: TextStyle(
      //                     //                       fontSize: 14,
      //                     //                       fontWeight: FontWeight.bold,
      //                     //                       color: Colors.black54),
      //                     //                 ))
      //                     //               ],
      //                     //             )
      //                     //           ],
      //                     //         ),
      //                     //       ),
      //                     //     ),
      //                     //   ),
      //                     // ),
      //                   ),
      //                 ],
      //               );
      //             })
      //         : Center(child: Text('Data Not found')),
      //   ),
      // ),

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
                      child: darftandbooks.length > 0
                          ? ListView.builder(
                              itemCount: darftandbooks.length,
                              itemBuilder: (con, index) {
                                return Card(
                                  child: ListTile(
                                    subtitle: FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PDF1(darftandbooks[index])),
                                        );
                                      },
                                      color: Color(0xFFFFFFFF),
                                      child: Container(
                                          child: Row(
                                        children: [
                                          Text(darftandbooks[index].title),
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
