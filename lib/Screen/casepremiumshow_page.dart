import 'package:flutter/material.dart';
import 'package:ourcourt/Route/route.dart';

class CasePremiumShow extends StatefulWidget {
  CasePremiumShow({Key? key}) : super(key: key);

  @override
  _CasePremiumShowState createState() => _CasePremiumShowState();
}

class _CasePremiumShowState extends State<CasePremiumShow> {
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
            Navigator.of(context)
                .popAndPushNamed(RouteManeger.casepremiumreg_page);
          },
        ),
        backgroundColor: Color(0xff44cb7e),
        centerTitle: true,
        title: Text(
          "Case Premium",
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
              Center(
                child: TextButton(
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
              ),
              SizedBox(
                height: 3,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed(RouteManeger.casepremiumreg_page);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white70),
                  ),
                  child: Text(
                    'নতুন মামলা যুক্ত  করুন',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'আমার কাজ লিস্ট',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              diarry(
                  'মোকাম কমিল্লার বিজ্ঞ সিনিয়র জুডিসিয়াল ৩নং আমলী আদালত ',
                  "জি.আর- ১০৬/২০২১ ইং",
                  'রাষ্ট্র বনাম মোঃ মহসিন',
                  'অস্ত্রো আইনের',
                  'প্রতিবেদন',
                  '12-5-21',
                  '15-9-211'),
              diarry(
                  'মোকাম কমিল্লার বিজ্ঞ সিনিয়র জুডিসিয়াল ৩নং আমলী আদালত ',
                  "জি.আর- ১০৬/২০২১ ইং",
                  'রাষ্ট্র বনাম মোঃ মহসিন',
                  'অস্ত্রো আইনের',
                  'প্রতিবেদন',
                  '12-5-21',
                  '15-9-211'),
              diarry(
                  'মোকাম কমিল্লার বিজ্ঞ সিনিয়র জুডিসিয়াল ৩নং আমলী আদালত ',
                  "জি.আর- ১০৬/২০২১ ইং",
                  'রাষ্ট্র বনাম মোঃ মহসিন',
                  'অস্ত্রো আইনের',
                  'প্রতিবেদন',
                  '12-5-21',
                  '15-9-211'),
            ],
          ),
        ),
      ),
    );
  }
}

Widget diarry(
  String text1,
  String text2,
  String text3,
  String text4,
  String text5,
  String text6,
  String text7,
) {
  return GestureDetector(
    child: Card(
      child: Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      padding:
                          const EdgeInsets.only(top: 5, bottom: 2, left: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                child: Text(
                                  text1,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 2, bottom: 2, left: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                child: Text(
                                  text2,
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
                      padding:
                          const EdgeInsets.only(top: 2, bottom: 2, left: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                child: Text(
                                  text3,
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
                      padding:
                          const EdgeInsets.only(top: 2, bottom: 2, left: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'ধারা: ',
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
                                  text4,
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
                      padding:
                          const EdgeInsets.only(top: 2, bottom: 2, left: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Step: ',
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
                                  text5,
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
                      padding:
                          const EdgeInsets.only(top: 2, bottom: 2, left: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'previus Date: ',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                text6,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 150,
                              ),
                              Text(
                                'next date: ',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                text7,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
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
    ),
  );
}
