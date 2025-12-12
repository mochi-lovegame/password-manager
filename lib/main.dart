import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(child: ListView(children: createCards(10))),
        ),
      ),
    );
  }
}

List<Widget> createCards(int n) {
  return [
    title(),
    for(int i = 0; i < n; i++) createCard('http://hoge.com', 'hoge@hoge.com')
  ];
}

Widget createCard(String site, String email) {
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

Widget title() {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      "パスワード管理",
      style: TextStyle(fontStyle: FontStyle.italic),
      textAlign: TextAlign.center,
    ),
  );
}
