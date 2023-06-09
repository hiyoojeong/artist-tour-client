import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginBar extends StatefulWidget implements PreferredSizeWidget {
  const LoginBar({Key? key, required this.title}) : super(key: key);

  final String title;
  final double header_height = 60; // 헤더 높이

  @override
  State<LoginBar> createState() => _LoginBarState();

  @override
  Size get preferredSize => Size.fromHeight(header_height);
}

class _LoginBarState extends State<LoginBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }
}


