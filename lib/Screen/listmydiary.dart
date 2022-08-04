import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/Route/route.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/controller/function_con.dart';

class ListDiary extends StatefulWidget {
  var mydiarylist;
  ListDiary(this.mydiarylist);

  @override
  _ListDiaryState createState() => _ListDiaryState(this.mydiarylist);
}

class _ListDiaryState extends StateMVC<ListDiary> {
  var mydiarylist;
  late FunctionController function;
  _ListDiaryState(this.mydiarylist) : super(FunctionController()) {
    function = controller as FunctionController;
  }
  DateTime pickupDate = DateTime.now();
  TextEditingController _searchEditingController = TextEditingController();
  @override
  // void initState() {
  //   this.function.mydiarylist(pickupDate, context);
  //   super.initState();
  // }

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
          "My diary",
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
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //color: Color(0xFF109643),
                  height: 40,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'List Of Diary',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .popAndPushNamed(RouteManeger.mydiary_page);
                          },
                          child: Text('+Add'))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Container(
                padding: EdgeInsets.only(left: 40, right: 40),
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
                  // onChanged: (value) {
                  //   function.mydiarylist(value, context);
                  // },
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        color: Color.fromRGBO(93, 25, 72, 1),
                        onPressed: () {
                          function.mydiarylist(
                              _searchEditingController.text, context);
                        },
                      ),
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                          fontSize: 12.0, height: 2.0, color: Colors.black)),
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 600.0,
                  child: mydiarylist.length != 0
                      ? ListView.builder(
                          itemCount: mydiarylist.length,
                          scrollDirection: Axis.vertical,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var casedata = mydiarylist[index];
                            return adddiary(casedata);
                          },
                        )
                      : Center(child: Text("Data not found")))
            ],
          ),
        ),
      ),
    );
  }
}

Widget adddiary(var casedata) {
  return GestureDetector(
    child: SingleChildScrollView(
      child: Card(
        color: Color(0xFFFDF5E6),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Title: ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        child: Text(
                          casedata['title'].toString(),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8),
              child: Row(
                children: [
                  Text(
                    'Note : ',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    casedata['description'].toString(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Text(
                    'Date: ',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Text(
                      casedata['date'].toString(),
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
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
