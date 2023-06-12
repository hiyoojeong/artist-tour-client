import 'package:client/constants/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Place_Content extends StatefulWidget {
  const Place_Content(
      {Key? key,
      required this.address,
      required this.date,
      required this.content})
      : super(key: key);

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
                informationWidget("주소", widget.address),
                SizedBox(height: 16),
                informationWidget("날짜", widget.date),
                Container(
                  padding:
                      EdgeInsets.only(top: 16, bottom: 16, left: 10, right: 10),
                  child: Text(widget.content),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget informationWidget(String title, String content) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      decoration: BoxDecoration(
        color: Color(Constants.DeepGray),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey
                .withOpacity(Constants.BoxShadowColorWithOpacity),
            spreadRadius: Constants.BoxShadowSpreadRadius,
            blurRadius: Constants.BoxShadowBlurRadius,
            offset: Offset(
                Constants.BoxShadowOffset_1,
                Constants
                    .BoxShadowOffset_2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${title}  ",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          Text(content),
        ],
      ),
    );
  }
}
