import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ourcourt/Route/route.dart';
import 'package:ourcourt/Screen/lower/singlelower.dart';
import 'package:ourcourt/colorconstant.dart';

class LowerListPage extends StatefulWidget {
  var lowerlist;
  LowerListPage(this.lowerlist);
  @override
  _LowerListPageState createState() => _LowerListPageState(this.lowerlist);
}

class _LowerListPageState extends State<LowerListPage> {
  var lowerList;
  _LowerListPageState(this.lowerList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pcolor,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).popAndPushNamed(RouteManeger.dashboad_page);
          },
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Lower List",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontFamily: 'UbuntuCondensed-Regular',
          ),
        ),
        elevation: 0,
        centerTitle: true,
        textTheme: Theme.of(context).textTheme,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Color(0xCDEDFF),
                  height: 500,
                  width: 350,
                  child: ListView.builder(
                      itemCount: lowerList == null ? 0 : lowerList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(2),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ListTile(
                                      title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: <Widget>[
                                            Text(
                                              "${lowerList[index]["full_name"].toString()}",
                                              // userReviews[index].userName,
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Nikosh'),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),

                                            // Text("Sender Birth day: ${acceptedata[index]['date_of_birth'].toString()}",textDirection: TextDirection.ltr,style: TextStyle(color: Colors.black,fontSize: 12,fontFamily: 'Nikosh'),textAlign: TextAlign.left,),
                                            Text(
                                              "${lowerList[index]["education"].toString()}",
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'Nikosh'),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              "${lowerList[index]["experience"].toString()}",
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'Nikosh'),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              "${lowerList[index]["address"].toString()}",
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'Nikosh'),
                                              textAlign: TextAlign.left,
                                            ),
                                          ]),
                                      leading: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                "https://ourcourtbd.com/${lowerList[index]["avater"].toString()}"),
                                            backgroundColor: pcolor,
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 260),
                                    child: FlatButton(
                                      // shape: new RoundedRectangleBorder(
                                      //     borderRadius:
                                      //         new BorderRadius.circular(12.0),
                                      //     side:
                                      //         BorderSide(color: Colors.black)),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SingleLowerPage(
                                                    lowerList[index]),
                                          ),
                                        );
                                      },
                                      color: Color(0xFFFFFFFF),
                                      child: Container(
                                          child: Column(
                                        children: [
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.teal,
                                          ),
                                          // Text("Doctors",
                                          //     textDirection: TextDirection.ltr,
                                          //     style: TextStyle(
                                          //         fontSize: 14,
                                          //         fontWeight: FontWeight.bold,
                                          //         fontFamily: 'Poppins')),
                                        ],
                                      )),
                                    ),
                                  )
                                ]),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),

      // end
    );
  }
}
