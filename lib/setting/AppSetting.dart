import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSetting extends StatelessWidget {
  const AppSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        "설정 화면",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
