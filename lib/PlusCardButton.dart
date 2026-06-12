import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PasswordValue.dart';

class PlusCardButton extends StatefulWidget {
  PlusCardButton(BuildContext buildContext);

  @override
  State<StatefulWidget> createState() {
    return _PlusCardButton();
  }
}

class _PlusCardButton extends State<PlusCardButton> {
  bool _isVisible = false;

  int PasswordPower(String password) {
    int score = 0;

    int length = password.length;

    // 長さ
    if (length >= 16) {
      score += 65;
    } else if (length >= 13) {
      score += 55;
    } else if (length >= 8) {
      score += 45;
    } else if (length >= 5) {
      score += 10;
    } else if (length >= 1) {
      score += 0;
    }

    // 文字種類
    if (RegExp(r'[A-Z]').hasMatch(password)) {
      score += 5;
    }

    if (RegExp(r'[a-z]').hasMatch(password)) {
      score += 5;
    }

    if (RegExp(r'[0-9]').hasMatch(password)) {
      score += 5;
    }

    if (RegExp(r'[!@#$%^&*(),.?":{}|<>_\-+=]').hasMatch(password)) {
      score += 15;
    }

    // 連続文字(1文字目≠2文字目、2文字目≠3文字目....)
    bool repeat = false;

    for (int i = 0; i < password.length - 1; i++) {
      if (password[i] == password[i + 1]) {
        repeat = true;
        break;
      }
    }

    if (repeat) {
      score -= 5;
    } else {
      score += 5;
    }

    return score;
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Align(alignment: Alignment.center, child: Icon(Icons.add)),
      onPressed: () => _onTap(context),
    );
  }

  void _onTap(BuildContext context) async {
    print(
      "////////////////////////////////////////////////////////////////////////Pressed",
    );

    final passwordValue = TextField(
      decoration: InputDecoration(hintText: "パスワード", border: InputBorder.none),
      onSubmitted: (value) {
        print(value);
        int ret = PasswordPower(value);
        print("/////////ret = ${ret} /////////");
        setState(() {
          _isVisible = ret >= 60;
        });
      },
    );

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
              margin: EdgeInsets.only(left: 30, top: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1.5),
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
              margin: EdgeInsets.only(left: 30, top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1.5),
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
              margin: EdgeInsets.only(left: 30, top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1.5),
              ),
              child: passwordValue,
            ),
            Visibility(
              visible: _isVisible,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 30, right: 30, top: 5),
                child: Text(
                  "※このパスワードは弱すぎるため文字数を増やす、もしくは他の種類の文字を足すなどしてください。",
                  style: TextStyle(color: Color(0xFFB01600), fontSize: 12.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
