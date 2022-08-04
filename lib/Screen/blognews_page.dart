import 'package:flutter/material.dart';
import 'package:ourcourt/Route/route.dart';
import 'package:ourcourt/model/bloglist.dart';


class BlogNews extends StatefulWidget {
  BlogNews({Key? key}) : super(key: key);

  @override
  _BlogNewsState createState() => _BlogNewsState();
}

class _BlogNewsState extends State<BlogNews> {
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
     
      body:Container(
        child:  Padding(
       padding: const EdgeInsets.all(8.0),
       child: Container(
                  color:Color(0xFFF0E6E6), 
                  width: double.infinity,
                  height: double.infinity,
                 // height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.builder(
                    itemCount: bolgList.length,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var blog = bolgList[index];
                      return BlogNews();
                    },
                  ),
                ),
     ),
    
      ),
     
     
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).popAndPushNamed(RouteManeger.blognewsadd_page); 
        },
        child: Icon(Icons.add, color: Colors.white, size: 29,),
        backgroundColor: Color(0xFF247AB3),
        tooltip: 'Capture Picture',
        elevation: 5,
        splashColor: Colors.grey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
      
    
  }
}
