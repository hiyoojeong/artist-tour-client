import 'package:client/bar/MainBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client/constants/Constants.dart';

class FootprintInfo {
  final int footprintId;
  final int userId;
  final String placeName;
  final String nickname;
  final int like;
  final String content;
  final List<String> image;

  FootprintInfo(
      {required this.footprintId,
      required this.userId,
      required this.placeName,
      required this.nickname,
      required this.like,
      required this.content,
      required this.image});

  factory FootprintInfo.fromJson(Map<String, dynamic> footprintInfoMap) {
    return FootprintInfo(
      footprintId: footprintInfoMap['footprintId'],
      userId: footprintInfoMap['userId'],
      placeName: footprintInfoMap['placeName'],
      nickname: footprintInfoMap['nickname'],
      like: footprintInfoMap['like'],
      content: footprintInfoMap['content'],
      image: footprintInfoMap['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'footprintId': footprintId,
        'userId': userId,
        'placeName': placeName,
        'nickname': nickname,
        'like': like,
        'content': content,
        'image': image,
      };
}

class Footprint extends StatefulWidget {
  const Footprint({Key? key, required this.footprintId}) : super(key: key);

  final int footprintId;

  @override
  State<Footprint> createState() => _FootprintState();
}

class _FootprintState extends State<Footprint> {
  FootprintInfo footprintInfo = new FootprintInfo(
      footprintId: 1,
      userId: 1,
      placeName: "광안리 해수욕장",
      nickname: "방타라타라탕탕탕",
      like: 128,
      content:
          "근처에 지민이 추천해준 크로플 맛집있어서 크로플 하나 사들고 드론쇼를 보러갔어요ㅎㅎㅎ 크로플 구매한다고 일찍 움직였더니 일찍 도착해서 명당자리를 차지했어요ㅋㅋ",
      image: ['', '', '']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBar(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                informationWidget(),
                Container(
                  padding:
                      EdgeInsets.only(top: 16, bottom: 16, left: 10, right: 10),
                  child: Text(footprintInfo.content),
                ),
                Container(
                  // 수평적으로 대칭(symmetric)의 마진을 추가 -> 화면 위, 아래에 20픽세의 마진 삽입
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  // 컨테이너의 높이를 200으로 설정
                  height: 200.0,
                  // 리스트뷰 추가
                  child: ListView(
                    // 스크롤 방향 설정. 수평적으로 스크롤되도록 설정
                    scrollDirection: Axis.horizontal,
                    // 컨테이너들을 ListView의 자식들로 추가
                    children: <Widget>[
                      for(int i =0; i<footprintInfo.image.length; i++) ... [
                        Image.asset('assets/images/basic_image.png', width: 200, fit: BoxFit.fill),
                        SizedBox(width: Constants.Interval,)
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget informationWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        color: Color(Constants.LightGray),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(Constants.BoxShadowColorWithOpacity),
            spreadRadius: Constants.BoxShadowSpreadRadius,
            blurRadius: Constants.BoxShadowBlurRadius,
            offset: Offset(Constants.BoxShadowOffset_1,
                Constants.BoxShadowOffset_2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                footprintInfo.placeName,
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
              Text(
                "by " + footprintInfo.nickname,
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.favorite,
                size: Constants.iconSize,
              ),
              Text(footprintInfo.like.toString()),
            ],
          )
        ],
      ),
    );
  }
}
