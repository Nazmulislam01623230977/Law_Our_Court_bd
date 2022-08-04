import 'package:flutter/material.dart';
import 'package:ourcourt/Route/route.dart';

class ContactPage extends StatefulWidget {
  ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
        backgroundColor: Color(0xff44cb7e),
        centerTitle: true,
        title: Text(
          "Contacts",
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
                padding: const EdgeInsets.only(
                    top: 16, left: 8, right: 8, bottom: 0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 190,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                        // maxLines: null,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 190,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            hintText: 'Client name',
                            border: OutlineInputBorder(),
                            labelText: 'Client Name'),
                        // maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 8, right: 8, bottom: 0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 190,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: 'Mobile Num',
                          border: OutlineInputBorder(),
                          labelText: 'Mobile Num',
                        ),
                        // maxLines: null,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 190,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            hintText: 'Case no',
                            border: OutlineInputBorder(),
                            labelText: 'Case no'),
                        // maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 8, right: 8, bottom: 0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 190,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: 'Mobile Num',
                          border: OutlineInputBorder(),
                          labelText: 'Mobile Num',
                        ),
                        // maxLines: null,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 190,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: 'Mobile Num',
                          border: OutlineInputBorder(),
                          labelText: 'Mobile Num',
                        ),
                        // maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 8, right: 8, bottom: 0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 190,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        // maxLines: null,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 190,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: 'Mobile Num',
                          border: OutlineInputBorder(),
                          labelText: 'Mobile Num',
                        ),
                        // maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('Save')),
                    ElevatedButton(onPressed: () {}, child: Text('Cancel')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
