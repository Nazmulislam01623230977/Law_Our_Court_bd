import 'package:flutter/material.dart';
import 'package:ourcourt/Data/menu_items.dart';
import 'package:ourcourt/Route/route.dart';
import 'package:ourcourt/model/diaryitem.dart';

class MyDiaryList extends StatefulWidget {
  var mydiarylist;
  MyDiaryList(this.mydiarylist);

  @override
  _MyDiaryListState createState() => _MyDiaryListState(this.mydiarylist);
}

class _MyDiaryListState extends State<MyDiaryList> {
  var mydiarylist;
  _MyDiaryListState(this.mydiarylist);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).popAndPushNamed(RouteManeger.mydiary_page);
            },
          ),
          backgroundColor: Color(0xff44cb7e),
          centerTitle: true,
          title: Text(
            "My Diary",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Color(0xffffffff),
            ),
          ),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (item) => onSeclected(context, item),
              itemBuilder: (context) => [
                ...MenuItems.itemfirst.map(
                  (buildItem),
                ),
              ],
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              diarylist(
                  '12-1-2020', '', 'For it was the first day of Rosh Hashanah'),
              diarylist(
                  '12-1-2020', '', 'For it was the first day of Rosh Hashanah,')
            ],
          ),
        ));
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
      value: item,
      child: Row(
        children: [
          Icon(
            item.icon,
            color: Colors.black,
            size: 20,
          ),
          Text(item.name),
        ],
      ));

  onSeclected(BuildContext context, Object? item) {
    switch (item) {
      case MenuItems.itemDelete:
        //Navigator.of(context).popAndPushNamed(RouteManeger.mydiary_page);
        break;
      case MenuItems.itemEdit:
        //Navigator.of(context).popAndPushNamed(RouteManeger.mydiary_page);
        break;
      case MenuItems.itemPdf:
        //Navigator.of(context).popAndPushNamed(RouteManeger.mydiary_page);
        break;
    }
  }
}

Widget diarylist(
  String date,
  String title,
  String text,
) {
  return GestureDetector(
    child: Card(
      child: Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        //height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   margin: EdgeInsets.only(left: 20),
            //   height: 90,
            //   width: 50,
            //   child: Image.asset("assets/images/logo.jpeg"),
            // ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white70.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 2, left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
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
                                date,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            // Container(
                            //   // height: 90,
                            //   // width: 50,
                            //   child: Image.asset(image),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2, bottom: 2, left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'title: ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 0),
                              child: Text(
                                title,
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
                    padding: const EdgeInsets.only(top: 2, bottom: 2, left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 0),
                              child: Text(
                                text,
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
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
