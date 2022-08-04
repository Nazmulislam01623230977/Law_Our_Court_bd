import 'package:flutter/material.dart';
import 'package:ourcourt/model/bloglist.dart';

class BlogNews extends StatelessWidget {
  final BolgList bolgList;
  const BlogNews({Key? key, required this.bolgList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            'assets/images/legalnews.png',
            height: 100,
            width: double.infinity,
          ),
         
          Row(
            children: [
              Container(
                child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("assets/images/profile.png")),
                width: 30,
                height: 10,
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
             
              SizedBox(
                width: 5,
              ),
              Text(bolgList.name),
              SizedBox(
                width: 50,
              ),
              Text(bolgList.date),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(bolgList.title),
          Text(bolgList.image),
          Text(bolgList.image2),
        ],
      ),
    );
  }
}
