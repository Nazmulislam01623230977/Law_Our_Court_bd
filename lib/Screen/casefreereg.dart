import 'package:flutter/material.dart';
import 'package:ourcourt/Route/route.dart';

class CaseFreeReg extends StatefulWidget {
  CaseFreeReg({Key? key}) : super(key: key);

  @override
  _CaseFreeRegState createState() => _CaseFreeRegState();
}

class _CaseFreeRegState extends State<CaseFreeReg> {
  DateTime _pickupDate = DateTime.now();
  DateTime _pickupDate1 = DateTime.now();
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
          _pickupDate1 = value;
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
            Navigator.of(context).popAndPushNamed(RouteManeger.casefree_page);
          },
        ),
        backgroundColor: Color(0xff44cb7e),
        centerTitle: true,
        title: Text(
          "মামলার টাইপ এবং নাম্বার দিন",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Color(0xffffffff),
          ),
        ),
      ),
      
      body: SingleChildScrollView(
        child: Container(
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
                  child: Container(
                    width: double.infinity,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'কোটের নাম ',
                        border: OutlineInputBorder(),
                        labelText: 'কোটের নাম ',
                      ),
                      // maxLines: null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
                  child: Container(
                    width: double.infinity,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'মামলার নাম্বার',
                        border: OutlineInputBorder(),
                        labelText: 'মামলার নাম্বার ',
                      ),
                      // maxLines: null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
                  child: Container(
                    width: double.infinity,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'পক্ষগণের নাম ',
                        border: OutlineInputBorder(),
                        labelText: 'পক্ষগণের নাম  ',
                      ),
                      // maxLines: null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
                  child: Container(
                    width: double.infinity,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'ধারা : ',
                        border: OutlineInputBorder(),
                        labelText: 'ধারা :',
                      ),
                      // maxLines: null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
                  child: Container(
                    width: double.infinity,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Step',
                        border: OutlineInputBorder(),
                        labelText: 'step ',
                      ),
                      // maxLines: null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
                  child: Container(
                    width: double.infinity,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Notes ',
                        border: OutlineInputBorder(),
                        labelText: 'notes ',
                      ),
                      // maxLines: null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 16, right: 16, bottom: 0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 175,
                        child: OutlineButton(
                          child: Text(
                              'Previus Date:  ${_pickupDate.day}-${_pickupDate.month}-${_pickupDate.year}'),
                          // style: TextButton.styleFrom(
                          //   primary: Colors.black,
                          // ),
                          onPressed: () {
                            setState(() {
                              pickDate(context);
                              // print(pickDate);
                            });
                          },
                        ),
                        // maxLines: null,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 175,
                        child: OutlineButton(
                          child: Text(
                              'Preview Date :  ${_pickupDate.day}-${_pickupDate.month}-${_pickupDate.year}'),
                          // style: TextButton.styleFrom(
                          //   primary: Colors.black,
                          // ),
                          onPressed: () {
                            setState(() {
                              pickDate(context);
                              // print(pickDate);
                            });
                          },
                        ),
                        // maxLines: null,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed(RouteManeger.casefreeshow_page);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  child: Text(
                    'যুক্ত করুন',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
