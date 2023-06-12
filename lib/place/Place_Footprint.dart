import 'package:client/constants/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FootprintRequest {
  final int placeId;

  FootprintRequest({required this.placeId});

  factory FootprintRequest.fromJson(Map<String, dynamic> footprintRequestMap) {
    return FootprintRequest(placeId: footprintRequestMap['placeId']);
  }

  Map<String, dynamic> toJson() => {'placeId': placeId};
}

class FootprintInfo {
  final int footprintId;
  final String nickname;
  final int like;
  final String content;
  final String image;

  FootprintInfo(
      {required this.footprintId,
      required this.nickname,
      required this.like,
      required this.content,
      required this.image});

  factory FootprintInfo.fromJson(Map<String, dynamic> footprintInfoMap) {
    return FootprintInfo(
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

class Place_Footprint extends StatefulWidget {
  const Place_Footprint({Key? key, required this.placeId}) : super(key: key);

  final int placeId;

  @override
  State<Place_Footprint> createState() => _Place_FootprintState();
}

class _Place_FootprintState extends State<Place_Footprint> {
  List<FootprintInfo> _footprintList = [
    new FootprintInfo(
        footprintId: 1,
        nickname: "방타라타라탕탕탕",
        like: 128,
        content:
            "근처에 지민이 추천해준 크로플 맛집있어서 크로플 하나 사들고 드론쇼를 보러갔어요ㅎㅎㅎ 크로플 구매한다고 일찍 움직였더니 일찍 도착했지뭐에요 ㅎㅎㅎ",
        image: "image"),
    new FootprintInfo(
        footprintId: 2,
        nickname: "진은진라면의진",
        like: 56,
        content:
            "부산사람인지라 부산에 방탄드론쇼가 열린다는 소식에 냅다바로 달려갈 수 있어서 좋았습니다. 서울말고 부산에도 이런거 자주자주해줬으면 좋겠어요 진짜루!",
        image: "image"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Column(
              children: [
                for (int i = 0; i < _footprintList.length; i++) ...[
                  footprint(_footprintList[i]),
                  SizedBox(
                    height: Constants.IntervalHeight,
                  ),
                ],
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget footprint(FootprintInfo footprintInfo) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          color: Color(0xffF1F1F1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(footprintInfo.nickname),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        size: Constants.iconSize,
                      ),
                      Text(
                        footprintInfo.like.toString(),
                      ),
                    ],
                  ),
                  Container(
                    width: 200,
                    child: SingleChildScrollView(
                      child: Text(
                        footprintInfo.content,
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
