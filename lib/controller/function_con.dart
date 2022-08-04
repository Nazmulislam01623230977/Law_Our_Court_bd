import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/Screen/barnotice.dart';
import 'package:ourcourt/Screen/casefree_page.dart';
import 'package:ourcourt/Screen/casefreeshow.dart';
import 'package:ourcourt/Screen/casepremiumadd.dart';
import 'package:ourcourt/Screen/casestudies_page.dart';
import 'package:ourcourt/Screen/diarycalender_page.dart';
import 'package:ourcourt/Screen/lawbooklist.dart';
import 'package:ourcourt/Screen/lawdictionary.dart';
import 'package:ourcourt/Screen/legaldrafting_page.dart';
import 'package:ourcourt/Screen/listmydiary.dart';
import 'package:ourcourt/Screen/lower/lowerlist.dart';
import 'package:ourcourt/Screen/medicaldictionary.dart';
import 'package:ourcourt/Screen/mydiary_page.dart';
import 'package:ourcourt/Screen/showsearchmessage.dart';
import 'package:ourcourt/apirepositor/apirepositor.dart';
import 'package:ourcourt/model/books.dart';
import 'package:ourcourt/model/calenderPhoto.dart';
import 'package:ourcourt/model/casedairysearchmodel.dart';
import 'package:ourcourt/model/lowdictionsty.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FunctionController extends ControllerMVC {
  casepremiumlist(var _pickupDate, BuildContext context) async {
    cerculerShowDialog(context);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var status = sharedPreferences.getString("status");
    var user_id = sharedPreferences.getString("user_id");
    var getpicupdate;

    setState(() {
      getpicupdate =
          "${_pickupDate.day}-${_pickupDate.month}-${_pickupDate.year}";
    });
    // print(getpicupdate);

    if (status == "Inactive") {
      internaterror(
          "You are not premium member please subcription here", context);
    } else {
      try {
        var requestrespons = http.MultipartRequest(
            "GET",
            Uri.parse(
                "https://ourcourtbd.com/api/casedairylist/${user_id}/${getpicupdate}"));
        requestrespons.send().then((res) async {
          if (res.statusCode == 200) {
            var massage = await res.stream.bytesToString();
            var responsedata = json.decode(massage);
            var caisedata = responsedata['casedairylist'];
            // if()
            // print(caisedata.length);
            // print(caisedata);
            if (caisedata.length != 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CasePremiumAdd(caisedata)),
              );
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Showcasprimammessa()));
            }
          }
        });
      } catch (e) {
        internaterror('Verify your internet connection', context);
      }
      // }

    }
  }

  caselistdataforself(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var user_id = sharedPreferences.getString('user_id');

    try {
      var requestrespons = http.MultipartRequest("GET",
          Uri.parse("https://ourcourtbd.com/api/casedairylist/${user_id}"));
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          List casedairydata = (responsedata['casedairylist'] as List)
              .map((e) => Casedairylist.fromJSON(e))
              .toList();
          print(casedairydata);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => CasePremiumAdd(casedairydata)),
          // );
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
  }

  casepremiumadd(String disticName, courtName, caseno, clientName, dara, step,
      notes, date, phone, casetype, bclientname, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var datetime;
    var pickupDatee;
    var getpicupdate;
    datetime = sharedPreferences.getString('datetime');
    print(datetime);
    print(datetime);
    if (datetime != null) {
      setState(() {
        pickupDatee = DateTime.parse(datetime);
        getpicupdate =
            "${pickupDatee.day}-${pickupDatee.month}-${pickupDatee.year}";
      });
    } else {
      setState(() {
        pickupDatee = DateTime.now();
        getpicupdate =
            "${pickupDatee.day}-${pickupDatee.month}-${pickupDatee.year}";
      });
    }

    var user_id = sharedPreferences.getString("user_id");
    DateTime pickupDate = DateTime.now();

    print(getpicupdate);
    try {
      var requestrespons = http.MultipartRequest(
        "POST",
        ApiRepo.casedairyadd,
      );
      requestrespons.fields['distic_name'] = disticName;
      requestrespons.fields['court_name'] = courtName;
      requestrespons.fields['case_no'] = caseno;
      requestrespons.fields['client_name'] = clientName;
      requestrespons.fields['dara'] = dara;
      requestrespons.fields['step'] = step;
      requestrespons.fields['notes'] = notes;
      requestrespons.fields['self_date'] = date;
      requestrespons.fields['admin_date'] = date;
      requestrespons.fields['last_date'] = date;
      requestrespons.fields['reg_date'] = "$getpicupdate";
      requestrespons.fields['phone_no'] = phone;
      requestrespons.fields['user_id'] = "$user_id";
      requestrespons.fields['case_type'] = casetype;
      requestrespons.fields['bclient_name'] = bclientname;
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          var msg = responsedata["casedairy"];
          var msgfoundcaselist = responsedata["case"];

          print(msgfoundcaselist);

          if (msgfoundcaselist != null) {
            if (msgfoundcaselist.length != 0) {
              internaterror('This case no already exists !!', context);
            }
          }
          if (msg.length != 0) {
            internaterror('Case save successfully !!', context);

            casepremiumlist(pickupDatee, context);
          }
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
  }

  premiumcaseupdate(
      String disticName,
      courtName,
      caseno,
      clientName,
      dara,
      step,
      notes,
      phone,
      casetype,
      bclientname,
      int id,
      BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var datetime;
    var pickupDatee;

    datetime = sharedPreferences.getString('datetime');
    print(datetime);
    print(datetime);
    if (datetime != null) {
      setState(() {
        pickupDatee = DateTime.parse(datetime);
      });
    } else {
      setState(() {
        pickupDatee = DateTime.now();
      });
    }

    var user_id = sharedPreferences.getString("user_id");
    DateTime pickupDate = DateTime.now();
    var getpicupdate;

    // setState(() {
    //   getpicupdate =
    //       "${_pickupDate.day}-${_pickupDate.month}-${_pickupDate.year}";
    // });
    print(getpicupdate);
    try {
      var requestrespons = http.MultipartRequest(
        "POST",
        ApiRepo.casedairyupdate,
      );
      // print(value);
      // cerculerShowDialog(context);
      requestrespons.fields['distic_name'] = disticName;
      requestrespons.fields['court_name'] = courtName;
      requestrespons.fields['case_no'] = caseno;
      requestrespons.fields['client_name'] = clientName;
      requestrespons.fields['dara'] = dara;
      requestrespons.fields['step'] = step;
      requestrespons.fields['notes'] = notes;
      requestrespons.fields['phone_no'] = phone;
      requestrespons.fields['id'] = "$id";
      requestrespons.fields['case_type'] = casetype;
      requestrespons.fields['bclient_name'] = bclientname;
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          var msg = responsedata["casedairy"];
          var msgfoundcaselist = responsedata["case"];

          print(msgfoundcaselist);

          if (msgfoundcaselist != null) {
            if (msgfoundcaselist.length != 0) {
              internaterror('This case no already exists !!', context);
            }
          }
          if (msg.length != 0) {
            internaterror('Case save successfully !!', context);

            casepremiumlist(pickupDatee, context);
          }
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
  }

  dateupdatefunction(
      var data, String date, int id, BuildContext context) async {
    // print(date);

    DateTime pickupDate = DateTime.now();
    // var getpicupdate;

    // setState(() {
    //   getpicupdate =
    //       "${_pickupDate.day}-${_pickupDate.month}-${_pickupDate.year}";
    // });
    try {
      var requestrespons = http.MultipartRequest(
        "POST",
        ApiRepo.admindateupdate,
      );
      requestrespons.fields['admin_date'] = date;
      requestrespons.fields['last_date'] = date;
      requestrespons.fields['id'] = "$id";
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          var msgfoundcaselist = responsedata["case"];

          //       print(msgfoundcaselist);

          if (msgfoundcaselist != null) {
            if (msgfoundcaselist.length != 0) {
              internaterror('Next date added successfully !!', context);
              casepremiumlist(pickupDate, context);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => AdminDateUpdatePage(data),
              //     ));
            } else {
              internaterror('Something went wrong !!', context);
            }
          }
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
  }

//case primium end
//case free start
  freecaselist(var _pickupDate, BuildContext context) async {
    cerculerShowDialog(context);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var status = sharedPreferences.getString("status");
    var user_id = sharedPreferences.getString("user_id");
    // DateTime _pickupDate = DateTime.now();
    var getpicupdate;

    setState(() {
      getpicupdate =
          "${_pickupDate.day}-${_pickupDate.month}-${_pickupDate.year}";
    });
    // print(getpicupdate);
    if (status == "Inactive") {
      internaterror(
          "You are not premium member please subcription here", context);
    } else {
      try {
        var requestrespons = http.MultipartRequest(
            "GET",
            Uri.parse(
                "https://ourcourtbd.com/api/selfcasedairylist/${user_id}/${getpicupdate}"));

        requestrespons.send().then((res) async {
          if (res.statusCode == 200) {
            var massage = await res.stream.bytesToString();
            var responsedata = json.decode(massage);
            var caisedata = responsedata['casedairylist'];
            print(caisedata);
            if (caisedata.length != 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CasefreeShow(caisedata)),
              );
            } else {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CaseFree()));
            }
          }
        });
      } catch (e) {
        internaterror('Verify your internet connection', context);
      }
      // }

    }
  }

  casefreemadd(String disticName, courtName, caseno, clientName, dara, step,
      notes, date, phone, casetype, bclientname, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var datetime;
    var pickupDate;
    var getpicupdate;

    datetime = sharedPreferences.getString('datetime');
    print(datetime);
    print(datetime);
    if (datetime != null) {
      setState(() {
        pickupDate = DateTime.parse(datetime);
        getpicupdate =
            "${pickupDate.day}-${pickupDate.month}-${pickupDate.year}";
      });
    } else {
      setState(() {
        pickupDate = DateTime.now();
        getpicupdate =
            "${pickupDate.day}-${pickupDate.month}-${pickupDate.year}";
      });
    }

    var user_id = sharedPreferences.getString("user_id");

    try {
      var requestrespons = http.MultipartRequest(
        "POST",
        ApiRepo.selfcasedairyadd,
      );
      // print(value);
      // cerculerShowDialog(context);
      requestrespons.fields['distic_name'] = disticName;
      requestrespons.fields['court_name'] = courtName;
      requestrespons.fields['case_no'] = caseno;
      requestrespons.fields['client_name'] = clientName;
      requestrespons.fields['dara'] = dara;
      requestrespons.fields['step'] = step;
      requestrespons.fields['reg_date'] = "$getpicupdate";
      requestrespons.fields['notes'] = notes;
      requestrespons.fields['self_date'] = date;
      requestrespons.fields['last_date'] = date;
      requestrespons.fields['phone_no'] = phone;
      requestrespons.fields['user_id'] = "$user_id";
      requestrespons.fields['case_type'] = casetype;
      requestrespons.fields['bclient_name'] = bclientname;
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          var msg = responsedata["casedairy"];
          var msgfoundcaselist = responsedata["case"];

          print(msgfoundcaselist);

          if (msgfoundcaselist != null) {
            if (msgfoundcaselist.length != 0) {
              internaterror('This case no already exists !!', context);
            }
          }
          if (msg.length != 0) {
            internaterror('Case save successfully !!', context);
            freecaselist(pickupDate, context);
          }
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
  }

  freecaseupdate(String disticName, courtName, caseno, clientName, dara, step,
      notes, phone, casetype, bclientname, int id, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var datetime;
    var pickupDatee;

    datetime = sharedPreferences.getString('datetime');
    print(datetime);
    print(datetime);
    if (datetime != null) {
      setState(() {
        pickupDatee = DateTime.parse(datetime);
      });
    } else {
      setState(() {
        pickupDatee = DateTime.now();
      });
    }

    var user_id = sharedPreferences.getString("user_id");
    DateTime pickupDate = DateTime.now();
    var getpicupdate;

    // setState(() {
    //   getpicupdate =
    //       "${_pickupDate.day}-${_pickupDate.month}-${_pickupDate.year}";
    // });
    print(getpicupdate);
    try {
      var requestrespons = http.MultipartRequest(
        "POST",
        ApiRepo.casedairyupdate,
      );
      // print(value);
      // cerculerShowDialog(context);
      requestrespons.fields['distic_name'] = disticName;
      requestrespons.fields['court_name'] = courtName;
      requestrespons.fields['case_no'] = caseno;
      requestrespons.fields['client_name'] = clientName;
      requestrespons.fields['dara'] = dara;
      requestrespons.fields['step'] = step;
      requestrespons.fields['notes'] = notes;
      requestrespons.fields['phone_no'] = phone;
      requestrespons.fields['id'] = "$id";
      requestrespons.fields['case_type'] = casetype;
      requestrespons.fields['bclient_name'] = bclientname;
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          var msg = responsedata["casedairy"];
          var msgfoundcaselist = responsedata["case"];

          print(msgfoundcaselist);

          if (msgfoundcaselist != null) {
            if (msgfoundcaselist.length != 0) {
              internaterror('This case no already exists !!', context);
            }
          }
          if (msg.length != 0) {
            internaterror('Case save successfully !!', context);
            freecaselist(pickupDatee, context);
          }
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
  }

  freedatefunction(var data, String date, int id, BuildContext context) async {
    // print(date);
    var datetime;
    var pickupDatee;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    datetime = sharedPreferences.getString('datetime');
    print(datetime);
    print(datetime);
    if (datetime != null) {
      setState(() {
        pickupDatee = DateTime.parse(datetime);
      });
    } else {
      setState(() {
        pickupDatee = DateTime.now();
      });
    }
    try {
      var requestrespons = http.MultipartRequest(
        "POST",
        ApiRepo.selfdatereantry,
      );
      requestrespons.fields['self_date'] = date;
      // requestrespons.fields['admin_date'] = date;
      requestrespons.fields['last_date'] = date;
      requestrespons.fields['id'] = "$id";
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          var msgfoundcaselist = responsedata["case"];

          if (msgfoundcaselist != null) {
            if (msgfoundcaselist.length != 0) {
              internaterror('Next date added successfully !!', context);
              freecaselist(pickupDatee, context);
            } else {
              internaterror('Something went wrong !!', context);
            }
          }
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
  }
//end case diary function

  lowerlist(BuildContext context) {
    cerculerShowDialog(context);
    try {
      var requestrespons = http.MultipartRequest(
        "GET",
        ApiRepo.lowerlist,
      );
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          List lowerlist = responsedata["lowerlist"];
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LowerListPage(lowerlist)),
          );
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
  }

  mydiarylist(var title, BuildContext context) async {
    List mydairylist = [];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var user_id = sharedPreferences.getString("user_id");
    cerculerShowDialog(context);
    print(title);
    try {
      var requestrespons = http.MultipartRequest(
        "POST",
        ApiRepo.mydiarylist,
      );
      requestrespons.fields['title'] = "$title";
      requestrespons.fields['user_id'] = "$user_id";
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          mydairylist = responsedata["mydairylist"];
          // print(mydairylist);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListDiary(mydairylist)),
          );
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
  }

  mydiaryentry(var date, title, description, BuildContext context) async {
    List mydairylist = [];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var user_id = sharedPreferences.getString("user_id");
    // cerculerShowDialog(context);
    var getpicupdate;

    setState(() {
      getpicupdate = "${date.day}-${date.month}-${date.year}";
    });
    print(title);
    print(description);
    print(getpicupdate);
    try {
      var requestrespons = http.MultipartRequest(
        "POST",
        ApiRepo.mydiaryentry,
      );
      requestrespons.fields['title'] = title;
      requestrespons.fields['date'] = getpicupdate;
      requestrespons.fields['description'] = description;
      requestrespons.fields['user_id'] = "$user_id";
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          mydairylist = responsedata["mydiary"];
          // print(mydairylist);
          if (mydairylist.length != 0) {
            internaterror('New note save successfully', context);
            mydiarylist(date, context);
          } else {
            internaterror('Some went wrong', context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyDiary()),
            );
          }
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
  }

  lowdictionaryfunction(BuildContext context) async {
    cerculerShowDialog(context);

    try {
      var requestrespons = http.MultipartRequest("GET", ApiRepo.lowdictionary);
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          // lowdictionarylist = responsedata['lowdictionary'];
          List<LowDictionary> lowdictionarylist =
              (responsedata['lowdictionary'] as List)
                  .map((e) => LowDictionary.fromJSON(e))
                  .toList();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LawDictionary(lowdictionarylist)),
          );
          // print(lowdictionarylist);
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
    // }
  }

  madicaldictionay(BuildContext context) async {
    cerculerShowDialog(context);

    try {
      var requestrespons =
          http.MultipartRequest("GET", ApiRepo.madicaldictionay);
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          // lowdictionarylist = responsedata['lowdictionary'];
          List<LowDictionary> madicaldictionay =
              (responsedata['madicaldictionay'] as List)
                  .map((e) => LowDictionary.fromJSON(e))
                  .toList();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MedicaldDictionary(madicaldictionay)),
          );
          // print(lowdictionarylist);
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
    // }
  }

  darftandbooks(BuildContext context) async {
    cerculerShowDialog(context);

    try {
      var requestrespons = http.MultipartRequest("GET", ApiRepo.darftandbooks);
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          // lowdictionarylist = responsedata['lowdictionary'];
          List<BooksModel> darftandbooks = (responsedata['legaldarf'] as List)
              .map((e) => BooksModel.fromJSON(e))
              .toList();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LegalDraftinf(darftandbooks)),
          );
          // print(lowdictionarylist);
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
    // }
  }

  lowbooks(BuildContext context) async {
    cerculerShowDialog(context);

    try {
      var requestrespons = http.MultipartRequest("GET", ApiRepo.lowbooks);
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          // lowdictionarylist = responsedata['lowdictionary'];
          List<BooksModel> lowbooks = (responsedata['lowbooks'] as List)
              .map((e) => BooksModel.fromJSON(e))
              .toList();

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LawBook(lowbooks)),
          );
          // print(lowdictionarylist);
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
    // }
  }

  casestudies(BuildContext context) async {
    cerculerShowDialog(context);

    try {
      var requestrespons = http.MultipartRequest("GET", ApiRepo.casestudiess);
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          // lowdictionarylist = responsedata['lowdictionary'];
          List<BooksModel> casestudies = (responsedata['casestudies'] as List)
              .map((e) => BooksModel.fromJSON(e))
              .toList();

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CaseStudies(casestudies)),
          );
          // print(lowdictionarylist);
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
    // }
  }

  barassociationnotice(BuildContext context) async {
    cerculerShowDialog(context);

    try {
      var requestrespons =
          http.MultipartRequest("GET", ApiRepo.barassociationnotice);
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          // lowdictionarylist = responsedata['lowdictionary'];
          List<BooksModel> barassociationnotice =
              (responsedata['barassociationnotice'] as List)
                  .map((e) => BooksModel.fromJSON(e))
                  .toList();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BarNotice(barassociationnotice)),
          );
          // print(lowdictionarylist);
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
    // }
  }

  supremcourtcalender(BuildContext context) async {
    cerculerShowDialog(context);

    try {
      var requestrespons =
          http.MultipartRequest("GET", ApiRepo.supremcourtcalender);
      requestrespons.send().then((res) async {
        if (res.statusCode == 200) {
          var massage = await res.stream.bytesToString();
          var responsedata = json.decode(massage);
          // lowdictionarylist = responsedata['lowdictionary'];
          List<CalendPhoto> calender = (responsedata['calender'] as List)
              .map((e) => CalendPhoto.fromJSON(e))
              .toList();

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DailyCalender(calender)),
          );
          // print(lowdictionarylist);
        }
      });
    } catch (e) {
      internaterror('Verify your internet connection', context);
    }
    // }
  }
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

buildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      });
}

cerculerShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      });
}
