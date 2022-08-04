import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/Route/route.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/controller/function_con.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class DailyCalender extends StatefulWidget {
  var calender;
  DailyCalender(this.calender);

  @override
  _DailyCalenderState createState() => _DailyCalenderState(this.calender);
}

class _DailyCalenderState extends StateMVC<DailyCalender> {
  List calender;
  late FunctionController function;
  _DailyCalenderState(this.calender) : super(FunctionController()) {
    function = controller as FunctionController;
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
          "Calender",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Color(0xffffffff),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: calender.length > 0
              ? ListView.builder(
                  itemCount: calender.length,
                  itemBuilder: (con, index) {
                    return Card(
                      child: ListTile(
                          //     title: PhotoView(
                          //   imageProvider: NetworkImage(
                          //       "https://ourcourtbd.com/${calender[index].avater}"),
                          // )
                          title: Image.network(
                              "https://ourcourtbd.com/${calender[index].avater}",
                              width: 400,
                              height: 650,
                              fit: BoxFit.fill)),
                    );
                  })
              : Center(child: Text('Data Not found')),
        ),
      ),
    );
  }
}
