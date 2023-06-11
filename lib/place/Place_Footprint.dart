import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Place_Footprint extends StatefulWidget {
  const Place_Footprint({Key? key, required this.placeId}) : super(key: key);

  final int placeId;

  @override
  State<Place_Footprint> createState() => _Place_FootprintState();
}

class _Place_FootprintState extends State<Place_Footprint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("인증글"),
    );
  }
}
