import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/Route/route.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/controller/dictionary_con.dart';
import 'package:ourcourt/controller/function_con.dart';

class LawDictionary extends StatefulWidget {
  List lowdictionarylist;
  LawDictionary(this.lowdictionarylist);

  @override
  _LawDictionaryState createState() =>
      _LawDictionaryState(this.lowdictionarylist);
}

class _LawDictionaryState extends StateMVC<LawDictionary> {
  var lowdictionarylist;
  late FunctionController function;
  _LawDictionaryState(this.lowdictionarylist) : super(FunctionController()) {
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
          "Law Dictionary ",
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
                      child: lowdictionarylist.length > 0
                          ? ListView.builder(
                              itemCount: lowdictionarylist.length,
                              itemBuilder: (con, index) {
                                return Card(
                                  child: ListTile(
                                    // title: Image.network(
                                    //     function.lowdictionarylist[index].word),
                                    subtitle: Text(
                                        "${lowdictionarylist[index].word}" +
                                            " = ${lowdictionarylist[index].answer}"),
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
