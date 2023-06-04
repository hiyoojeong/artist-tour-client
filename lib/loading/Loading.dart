import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login/Login.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
          () =>
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListView(
        children: [
          SizedBox(height: 80),
          Image.asset('assets/images/logo_text2.png'),
          SizedBox(height: 20),
          Image.asset('assets/images/logo_phone.png'),
        ],
      ),
    );
  }
}
