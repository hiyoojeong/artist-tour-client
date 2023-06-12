import 'dart:convert';

import 'package:client/bar/MainBar.dart';
import 'package:client/place/Place_Content.dart';
import 'package:client/footprint/Footprint_List.dart';
import 'package:client/constants/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../url/URL.dart';

class PlaceRequest {
  final int placeId;

  PlaceRequest({required this.placeId});

  factory PlaceRequest.fromJson(Map<String, dynamic> placeRequestMap) {
    return PlaceRequest(
        placeId: placeRequestMap['placeId']);
  }

  Map<String, dynamic> toJson() => {'placeId': placeId};
}

class Place extends StatefulWidget {
  const Place({Key? key, required this.placeId}) : super(key: key);

  final int placeId;

  @override
  State<Place> createState() => _PlaceState();
}

class _PlaceState extends State<Place> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  String artistName = "";
  String placeName = "";
  String address = "";
  String date = "";
  String content = "";

  @override
  void initState() {
    super.initState();
    _fetchPlace(new PlaceRequest(placeId: widget.placeId));
    _tabController = new TabController(length: 2, vsync: this);
  }

  _fetchPlace(PlaceRequest placeRequest) async {
    try {
      // http 요청에 대한 응답
      var response = await http.post(
        Uri.parse(URL().url + '/place'),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(placeRequest),
      );

      if (response.statusCode == 200) {
        // 요청 성공
        setState(() {
          // http 요청에 대한 응답 추출
          Map<String, dynamic> json =
              jsonDecode(utf8.decode(response.bodyBytes));
          artistName = json['artistName'];
          placeName = json['placeName'];
          address = json['address'];
          date = json['date'];
          content = json['content'];
        });
      } else {
        // http 요청에 대한 응답 추출
        Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));

        // 에러메세지 출력
        Fluttertoast.showToast(
            msg: json['error_msg'],
            backgroundColor: Colors.white,
            textColor: Colors.black,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      }
    } catch (e) {
      print("Failed to send post data: ${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(40, 20, 20, 40),
            child: Row(
              children: [
                Image.asset('assets/images/basic_image.png'),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                          color: Color(0xff9600DD),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          artistName,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        placeName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            size: Constants.iconSize,
                          ),
                          SizedBox(height: Constants.Interval),
                          Text("108"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.flag,
                            size: Constants.iconSize,
                          ),
                          SizedBox(height: Constants.Interval),
                          Text("37"),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Stack(
              children: [
                TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: "상세정보"),
                    Tab(text: "인증글"),
                  ],
                  indicator: BoxDecoration(
                    color: Color(0xffE0E0E0),
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                ),
                Positioned(
                  top: 48,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 10, // 그림자의 높이
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 8,
                          blurRadius: 5,
                          offset: Offset(0, 3), // 그림자의 위치를 조정
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Place_Content(
                  address: address,
                  date: date,
                  content: content,
                ),
                Footprint_List(placeId: widget.placeId),
              ],
            ),
          )
        ],
      ),
    );
  }
}
