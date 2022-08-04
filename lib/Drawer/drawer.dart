import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/Screen/dashboad.dart';
import 'package:ourcourt/Screen/login_page.dart';
import 'package:ourcourt/colorconstant.dart';
import 'package:ourcourt/controller/profile_con.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/rendering.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends StateMVC<MainDrawer> {
  late ProfileCotroller _profile;
  _MainDrawerState() : super(ProfileCotroller()) {
    _profile = controller as ProfileCotroller;
  }

  @override
  var token;
  var user_id;
  var username;
  var userbar_ass_name;
  var userphone_no;
  var useruser_type;
  var useremail;
  var avater;
  var status;

  _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    user_id = sharedPreferences.getString('user_id');
    username = sharedPreferences.getString('username');
    userbar_ass_name = sharedPreferences.getString('userbar_ass_name');
    userphone_no = sharedPreferences.getString('userphone_no');
    useruser_type = sharedPreferences.getString('useruser_type');
    useremail = sharedPreferences.getString('useremail');
    avater = sharedPreferences.getString('avater');
    status = sharedPreferences.getString('status');
    // print(status);
  }

  Future getData() async {
    await _getToken();
    setState(() {
      avater = avater;
      username = username;
    });
  }

  @override
  void initState() {
    this.getData();
    super.initState();
  }

  Future _logout() async {
    buildShowDialog(context);
    await _getToken();
    if (token != null) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.clear();
      internaterror("Logout successfull", context);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Login_Page()),
          (Route<dynamic> route) => false);
    } else {
      internaterror("Already logout", context);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Login_Page()),
          (Route<dynamic> route) => false);
    }
  }

  bool _isLoading = false;

  late File _claimimage;
  final picker = ImagePicker();
  late String base64Image;
  late Future<File> file;
  late String statuss = '';
  // String get path="";
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _claimimage = File(pickedFile!.path);
    });
    print(_claimimage);
    return _sendReuest(_claimimage);
  }

  _sendReuest(File _claimimage) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userid = sharedPreferences.getString('user_id');
    var postUri = Uri.parse("https://ourcourtbd.com/api/profilephotoupload");
    print(_claimimage.path);
    print(postUri);
    var request = http.MultipartRequest(
      "POST",
      postUri,
    );
    request.fields['id'] = '$userid';
    request.headers['Content-Type'] = "multipart/form-data";
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        _claimimage.path,
      ),
    );
    request.send().then((res) async {
      if (res.statusCode == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.remove('avater');
        var massage = await res.stream.bytesToString();
        var responsedata = json.decode(massage);
        var msg = responsedata['image'];
        if (msg != null) {
          setState(() {
            _isLoading = false;
            sharedPreferences.setString("avater", '$msg');
          });
          await _getToken();
        }
      }
    }).catchError((e) {});
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              //height: 80,
              padding: EdgeInsets.all(20),
              color: pcolor,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: avater == null
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
                                          color: Colors.black.withOpacity(0.1),
                                          offset: Offset(0, 10))
                                    ],
                                  ),
                                ),
                                
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 4,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                        ),
                                        color: pcolor,
                                      ),
                                      child: FlatButton(
                                        // onPressed: _profile.getProfileImage,
                                        onPressed: () => getImage(),
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )),
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
                                            'https://ourcourtbd.com/' + avater,
                                          ))),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 4,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                        ),
                                        color: pcolor,
                                      ),
                                      child: FlatButton(
                                        onPressed: () => getImage(),
                                        // getImage,
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                      //decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      //),
                    ),
                    Text(
                      username.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      useremail.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 12),
                    ),
                    Text(
                      userphone_no.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
           
            ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboadPage()),
                  );
                }),
            ListTile(
                leading: Icon(
                  Icons.person_add_alt_outlined,
                  color: Colors.black,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Wallet_page()));
                }),
            // ListTile(
            //     leading: Icon(
            //       Icons.contact_page,
            //       color: Colors.black,
            //     ),
            //     title: Text(
            //       'Contact',
            //       style: TextStyle(
            //         fontSize: 12,
            //         color: Colors.black,
            //         fontFamily: 'Poppins',
            //       ),
            //     ),
            //     onTap: () {
            //       // Navigator.push(context,
            //       //     MaterialPageRoute(builder: (context) => Wallet_page()));
            //     }),
            ListTile(
                leading: Icon(
                  Icons.backpack,
                  color: Colors.black,
                ),
                title: Text(
                  'Backup and Restore',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Wallet_page()));
                }),
            ListTile(
                leading: Icon(
                  Icons.share,
                  color: Colors.black,
                ),
                title: Text(
                  'Share App',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Wallet_page()));
                }),
            ListTile(
                leading: Icon(
                  Icons.album_outlined,
                  color: Colors.black,
                ),
                title: Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Wallet_page()));
                }),
            ListTile(
              leading: Icon(
                Icons.login,
                color: Colors.black,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
              onTap: _logout,
              // () {
              //   // Navigator.push(context,
              //   //     MaterialPageRoute(builder: (context) => Wallet_page()));
              // }
            ),
          ],
        ),
      ),
    );
  }
}
