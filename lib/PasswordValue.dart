import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "パスワード",
        border: InputBorder.none,
      ),
      onSubmitted:(value){
        print(value);
        var ret = PasswordPower(value);
        print("/////////ret = ${ret} /////////");
      },
    );
  }

  int PasswordPower(String password) {
    int score = 0;

    int length = password.length;

    // 長さ
    if (length >= 16) {
      score += 65;
    }
    else if (length >= 13) {
      score += 55;
    }
    else if (length >= 8) {
      score += 45;
    }
    else if (length >= 5) {
      score += 10;
    }
    else if (length >= 1) {
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

}