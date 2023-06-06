import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NaverMap extends StatefulWidget {
  const NaverMap({Key? key}) : super(key: key);

  @override
  State<NaverMap> createState() => _NaverMapState();
}

class _NaverMapState extends State<NaverMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(child: Text("hello"))
        ],
      ),
    );
  }
}
