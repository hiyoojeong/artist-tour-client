import 'package:client/constants/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FootprintListRequest {
  final int placeId;

  FootprintListRequest({required this.placeId});

  factory FootprintListRequest.fromJson(Map<String, dynamic> footprintListRequestMap) {
    return FootprintListRequest(placeId: footprintListRequestMap['placeId']);
  }

  Map<String, dynamic> toJson() => {'placeId': placeId};
}

class FootprintListInfo {
  final int footprintId;
  final String nickname;
  final int like;
  final String content;
  final String image;

  FootprintListInfo(
      {required this.footprintId,
      required this.nickname,
      required this.like,
      required this.content,
      required this.image});

  factory FootprintListInfo.fromJson(Map<String, dynamic> footprintInfoMap) {
    return FootprintListInfo(
      footprintId: footprintInfoMap['footprintId'],
      nickname: footprintInfoMap['nickname'],
      like: footprintInfoMap['like'],
      content: footprintInfoMap['content'],
      image: footprintInfoMap['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'footprintId': footprintId,
        'nickname': nickname,
        'like': like,
        'content': content,
        'image': image,
      };
}

class Footprint_List extends StatefulWidget {
  const Footprint_List({Key? key, required this.placeId}) : super(key: key);

  final int placeId;

  @override
  State<Footprint_List> createState() => _Footprint_ListState();
}

class _Footprint_ListState extends State<Footprint_List> {
  List<FootprintListInfo> _footprintList = [
    new FootprintListInfo(
        footprintId: 1,
        nickname: "방타라타라탕탕탕",
        like: 128,
        content:
            "근처에 지민이 추천해준 크로플 맛집있어서 크로플 하나 사들고 드론쇼를 보러갔어요ㅎㅎㅎ 크로플 구매한다고 일찍 움직였더니 일찍 도착했지뭐에요 ㅎㅎㅎ",
        image: "image"),
    new FootprintListInfo(
        footprintId: 2,
        nickname: "진은진라면의진",
        like: 56,
        content:
            "부산사람인지라 부산에 방탄드론쇼가 열린다는 소식에 냅다바로 달려갈 수 있어서 좋았습니다. 서울말고 부산에도 이런거 자주자주해줬으면 좋겠어요 진짜루!",
        image: "image"),
    new FootprintListInfo(
        footprintId: 3,
        nickname: "상여자가부르는상남자",
        like: 18,
        content:
        "저는 이번 드론쇼에서 가장 기억에 남는게 아미들의 시민의식이었어요. 많은 사람들이 모이는 자리였는데도 길거리가 너무 깨끗하더라구요",
        image: "image"),
    new FootprintListInfo(
        footprintId: 4,
        nickname: "뉴진스고이",
        like: 30,
        content:
        "거기서 뭐하는지도 몰랐는데, 집 바로 앞에 잠깐 나갔다가 사람이 모여있는 곳이라 가봤더니 너무 예쁜 드롭쇼를 하고 있더라구요~",
        image: "image"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                Column(
                  children: [
                    for (int i = 0; i < _footprintList.length; i++) ...[
                      footprintWidget(_footprintList[i]),
                      SizedBox(
                        height: Constants.Interval,
                      ),
                    ],
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget footprintWidget(FootprintListInfo footprintListInfo) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          color: Color(Constants.LightGray),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(Constants.BoxShadowColorWithOpacity),
              spreadRadius: Constants.BoxShadowSpreadRadius,
              blurRadius: Constants.BoxShadowBlurRadius,
              offset: Offset(Constants.BoxShadowOffset_1, Constants.BoxShadowOffset_2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(footprintListInfo.nickname),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        size: Constants.iconSize,
                      ),
                      Text(
                        footprintListInfo.like.toString(),
                      ),
                    ],
                  ),
                  Container(
                    width: 200,
                    child: SingleChildScrollView(
                      child: Text(
                        footprintListInfo.content,
                        maxLines: 3, // 모든 줄 표시
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset('assets/images/basic_image.png'),
          ],
        ),
      ),
    );
  }
}
