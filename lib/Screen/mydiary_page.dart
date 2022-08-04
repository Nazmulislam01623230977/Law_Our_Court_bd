import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/Route/route.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/controller/function_con.dart';

class MyDiary extends StatefulWidget {
  MyDiary({Key? key}) : super(key: key);

  @override
  _MyDiaryState createState() => _MyDiaryState();
}

class _MyDiaryState extends StateMVC<MyDiary> {
  late FunctionController function;
  _MyDiaryState() : super(FunctionController()) {
    function = controller as FunctionController;
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DateTime _pickupDate = DateTime.now();
  var initialDate = DateTime.now();
  @override
  Future pickDate(BuildContext context) async {
    var newDate = await showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: DateTime(DateTime.now().year - 0,
                DateTime.now().month - 0, DateTime.now().day - 0),
            lastDate: DateTime(DateTime.now().year + 0,
                DateTime.now().month + 0, DateTime.now().day + 6))
        .then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          _pickupDate = value;
        });
      }
    });
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
          "My Diary",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Color(0xffffffff),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: Text(
                          'Date:  ${_pickupDate.day}-${_pickupDate.month}-${_pickupDate.year}'),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          pickDate(context);
                          // print(pickDate);
                        });
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_pickupDate == "") {
                            internaterror("Date filed is required!!", context);
                          } else if (titleController == "") {
                            internaterror(
                                "Title field is required !!", context);
                          } else if (descriptionController == "") {
                            internaterror(
                                "Description field is required", context);
                          } else {
                            function.mydiaryentry(
                                _pickupDate,
                                titleController.text,
                                descriptionController.text,
                                context);
                          }
                          // Navigator.of(context)
                          //     .popAndPushNamed(RouteManeger.mydiarylist_page);
                        },
                        child: Text('Save')),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Title: ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      child: TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Title",
                          //hintStyle: title,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  _buildTextField(descriptionController),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField(description) {
  final maxLines = 10;

  return Container(
    margin: EdgeInsets.all(12),
    height: maxLines * 24.0,
    child: TextField(
      controller: description,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: "Enter a message",
        fillColor: Colors.white30,
        filled: true,
      ),
    ),
  );
}

void internaterror(String massge, BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(massge),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
