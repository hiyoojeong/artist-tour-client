import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Place_Content extends StatefulWidget {
  const Place_Content({Key? key, required this.address, required this.date, required this.content}) : super(key: key);

  final String address;
  final String date;
  final String content;
  @override
  State<Place_Content> createState() => _Place_ContentState();
}

class _Place_ContentState extends State<Place_Content> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [

                Container(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  decoration: BoxDecoration(
                    color: Color(0xffE0E0E0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "주소  ",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Text(widget.address),
                    ],
                  ),
                ),

                SizedBox(height: 16),

                Container(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  decoration: BoxDecoration(
                    color: Color(0xffE0E0E0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "날짜  ",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Text(widget.date),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 16, bottom: 16, left: 10, right: 10),
                  child: Text(widget.content),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
