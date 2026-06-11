import 'package:flutter/material.dart';

class CreateCard extends StatelessWidget {
  final String site;
  final String email;

  CreateCard(this.site, this.email);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 1),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(5, 5),
            blurRadius: 1.0,
            spreadRadius: 1.0,
          ),
        ],
      ),

      height: 60,
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Image.asset("assets/images/Lesson.jpg"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(site, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(email, style: TextStyle(fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }

}





