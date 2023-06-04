import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderLogin extends StatefulWidget implements PreferredSizeWidget {
  const HeaderLogin({Key? key, required this.title}) : super(key: key);

  final String title;
  final double header_height = 60; // 헤더 높이

  @override
  State<HeaderLogin> createState() => _HeaderLoginState();

  @override
  Size get preferredSize => Size.fromHeight(header_height);
}

class _HeaderLoginState extends State<HeaderLogin> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }
}


