import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/controller/function_con.dart';

class SingleLowerPage extends StatefulWidget {
  var lower;
  SingleLowerPage(this.lower);
  @override
  _SingleLowerPageState createState() => _SingleLowerPageState(this.lower);
}

class _SingleLowerPageState extends StateMVC<SingleLowerPage> {
  var lower;
  late FunctionController function;
  _SingleLowerPageState(this.lower) : super(FunctionController()) {
    function = controller as FunctionController;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: pcolor,
          leading: GestureDetector(
            onTap: () {
              function.lowerlist(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Lower Profile",
            // lower["full_name"].toString(),
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
          ),
          elevation: 0,
          centerTitle: true,
          textTheme: Theme.of(context).textTheme,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: textlabel,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      // Image.asset(
                      //   lower["avater"].toString(),
                      //   height: MediaQuery.of(context).size.height * 0.13,
                      // ),

                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        child: lower["avater"] == null
                            ? Stack(
                                children: [
                                  Container(
                                    child: CircleAvatar(
                                        radius: 80,
                                        backgroundImage: AssetImage(
                                            "assets/images/profile.png")),
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            offset: Offset(0, 10))
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Stack(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 4,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor),
                                        boxShadow: [
                                          BoxShadow(
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              offset: Offset(0, 10))
                                        ],
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://ourcourtbd.com/${lower["avater"].toString()}"))),
                                  ),
                                ],
                              ),
                        //decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        //),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            lower["full_name"].toString(),

                            // doctor.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: btntextcolor,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            lower["specialization"].toString(),
                            // nurse.image,
                            style: TextStyle(
                              fontSize: 10,
                              color: btntextcolor.withOpacity(0.7),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                      Text(
                        'Present working address',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: btntextcolor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      lower["address"].toString(),
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 12,
                        color: btntextcolor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.timer,
                        color: Colors.black,
                        size: 20,
                      ),
                      Text(
                        'Consultant',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: btntextcolor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      lower["dir_call"].toString(),
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 12,
                        color: btntextcolor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      lower["phone_call"].toString(),
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 12,
                        color: btntextcolor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      lower["email_call"].toString(),
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 12,
                        color: btntextcolor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      lower["video_call"].toString(),
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 12,
                        color: btntextcolor.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
