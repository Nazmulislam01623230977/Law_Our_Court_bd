import 'package:flutter/material.dart';
import 'package:ourcourt/Route/route.dart';

import '../colorconstant.dart';


class BolgNewsAdd extends StatefulWidget {
  BolgNewsAdd({Key? key}) : super(key: key);

  @override
  _BolgNewsAddState createState() => _BolgNewsAddState();
}

class _BolgNewsAddState extends State<BolgNewsAdd> {
   var avater;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(RouteManeger.blognews_page);
          },
        ),
        backgroundColor: Color(0xFF247AB3),
        centerTitle: true,
        title: Text(
          "Legal News/ Blog",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Color(0xffffffff),
          ),
        ),
      ),
     
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              buildTitle(),
              SizedBox(height: 3,),
              buildDescription(),
              SizedBox(height: 3,),
              Padding(
                padding: const EdgeInsets.only(top:16,left: 16,right: 16),
                child: Text(
                "Upload Images/File",
                style: TextStyle(
                    color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
            ),
              ),
            SizedBox(
              height: 5,
            ),
              Padding(
               padding: const EdgeInsets.only(left: 16,right: 16),
                child: Container(
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
                                              onPressed: (){},
                                              // onPressed: _profile.getProfileImage,
                                              // onPressed: () => getImage(),
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
                                              onPressed: (){},
                                              // onPressed: () => getImage(),
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
                         
                        ],
                      ),
                    ),
                  ),
              ),
              SizedBox(
              height: 10,
            ),
              Center(child: ElevatedButton(onPressed: (){}, child: Text('Submit'))) 
              
            ],),
          ),
        ),
      ),
    );
  }
}
Widget buildTitle() {
  return Padding(
    padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Title",
          style: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
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
            //controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                // prefixIcon: Icon(
                //   Icons.email,
                //   color: pcolor,
                // ),
                hintText: ' enter your title',
                hintStyle:
                    TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black)),
          ),
        )
      ],
    ),
  );
}

Widget buildDescription() {
  return Padding(
     padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 100.0,
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
            maxLines: 5,
            //controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                // prefixIcon: Icon(
                //   Icons.email,
                //   color: pcolor,
                // ),
                hintText: ' enter your Description',
                hintStyle:
                    TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black)),
          ),
        )
      ],
    ),
  );
}

