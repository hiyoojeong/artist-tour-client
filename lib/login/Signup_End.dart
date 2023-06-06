import 'package:client/header/Header_Login.dart';
import 'package:client/login/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signup_End extends StatefulWidget {
  const Signup_End({Key? key}) : super(key: key);

  @override
  State<Signup_End> createState() => _Signup_EndState();
}

class _Signup_EndState extends State<Signup_End> {
  @override
  void initState() {
    super.initState();
    // 3초 후에 다음 화면으로 전환
    Future.delayed(Duration(seconds: 3), () {
      // 현재 스택을 모두 제거하고 다음 화면으로 전환
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
            (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderLogin(title: 'SIGN IN'),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Padding(padding: EdgeInsets.only(top: 200)),
          Icon(Icons.waving_hand_rounded),
          Text(
            "가입이 완료되었습니다!\n\n잠시 후\n로그인 화면으로 이동합니다.",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}