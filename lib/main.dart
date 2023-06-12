import 'package:client/loading/Loading.dart';
import 'package:client/place/Place.dart';
import 'package:client/footprint/Footprint_List.dart';
import 'package:flutter/material.dart';

import 'footprint/Footprint.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '덕지순례',
      home: Loading(),
    );
  }
}
