import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PasswordValue.dart';

class PlusCardButton extends StatelessWidget {
  PlusCardButton(BuildContext buildContext);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Align(
        alignment: Alignment.center,
        child : Icon(Icons.add),
      ),
      onPressed: ()=> _onTap(context),
    );
  }
}

void _onTap(BuildContext context) async {
  print("////////////////////////////////////////////////////////////////////////Pressed");
  final result = await showModalBottomSheet<int>(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => SizedBox(
        height: 500,
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250,
              height: 50,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left:30,top:30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black,width: 1.5,)
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "サイト名",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              width: 250,
              height: 50,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left:30,top:20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black,width: 1.5,)
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "メールアドレス",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(

              width: 250,
              height: 50,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left:30,top:20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black,width: 1.5,)
              ),
              child: PasswordValue(),
            ),
            Visibility(
              visible: false,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left:30,right:30,top:5),
                child: Text("※このパスワードは弱すぎるため文字数を増やす、もしくは他の種類の文字を足すなどしてください。",
                    style: TextStyle(color: Color(0xFFB01600),fontSize: 12.5)),
              ),
            )
          ],
        ),
      )
  );
}