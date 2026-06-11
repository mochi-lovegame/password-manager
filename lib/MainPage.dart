import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CreateCard.dart';
import 'PlusCardButton.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
          builder: (buildContext) {
            return Scaffold(
                body: SafeArea(
                  child: Center(child: ListView(children: createCards(10))),

                ),
                floatingActionButton: PlusCardButton(buildContext)
            );
          }
      ),
    );
  }

  List<Widget> createCards(int n) {
    return [
      title(),
      for(int i = 0; i < n; i++)
        CreateCard('http://hoge.com', 'hoge@hoge.com')
    ];
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
}
