import 'package:client/header/Header_Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Signup_ConfirmEmail.dart';

class Signup_Info extends StatefulWidget {
  const Signup_Info({Key? key}) : super(key: key);

  @override
  State<Signup_Info> createState() => _Signup_InfoState();
}

class _Signup_InfoState extends State<Signup_Info> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: HeaderLogin(
          title: "SIGN IN",
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 이름
                Text(
                  "이름",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                ),
                Container(
                  child: TextFormField(
                    // 텍스트폼필드에 스타일 적용
                    decoration: InputDecoration(
                      // 텍스트폼필드의 외각선
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      // 텍스트폼필드의 포커스 외각선
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.5,
                        ),
                      ),
                      // 텍스트폼필드상에 출력되는 텍스트.
                      hintText: 'NAME',
                      // 텍스트폼필드의 상단에 출력되는 레이블 텍스트
                      labelText: "이름을 입력해주세요.",
                      // 텍스트폼필드의 상단에 출렫되는 레이블 텍스트 스타일
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // 간격
            Padding(padding: EdgeInsets.all(5)),

            // 이메일
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "이메일",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                ),
                Container(
                  child: TextFormField(
                    // 텍스트폼필드에 스타일 적용
                    decoration: InputDecoration(
                      // 텍스트폼필드의 외각선
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      // 텍스트폼필드의 포커스 외각선
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.5,
                        ),
                      ),
                      // 텍스트폼필드상에 출력되는 텍스트.
                      hintText: 'EMAIL',
                      // 텍스트폼필드의 상단에 출력되는 레이블 텍스트
                      labelText: "이메일을 입력해주세요.",
                      // 텍스트폼필드의 상단에 출렫되는 레이블 텍스트 스타일
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // 간격
            Padding(padding: EdgeInsets.all(5)),

            // 아이디
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "아이디",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                ),
                Container(
                  child: TextFormField(
                    // 텍스트폼필드에 스타일 적용
                    decoration: InputDecoration(
                      // 텍스트폼필드의 외각선
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      // 텍스트폼필드의 포커스 외각선
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.5,
                        ),
                      ),
                      // 텍스트폼필드상에 출력되는 텍스트.
                      hintText: 'ID',
                      // 텍스트폼필드의 상단에 출력되는 레이블 텍스트
                      labelText: "아이디를 입력해주세요.",
                      // 텍스트폼필드의 상단에 출렫되는 레이블 텍스트 스타일
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // 간격
            Padding(padding: EdgeInsets.all(5)),

            // 비밀번호
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "비밀번호",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                ),
                Container(
                  child: TextFormField(
                    // 텍스트폼필드에 스타일 적용
                    decoration: InputDecoration(
                      // 텍스트폼필드의 외각선
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      // 텍스트폼필드의 포커스 외각선
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.5,
                        ),
                      ),
                      // 텍스트폼필드상에 출력되는 텍스트.
                      hintText: 'PASSWORD',
                      // 텍스트폼필드의 상단에 출력되는 레이블 텍스트
                      labelText: "비밀번호흫 입력해주세요.",
                      // 텍스트폼필드의 상단에 출렫되는 레이블 텍스트 스타일
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // 간격
            Padding(padding: EdgeInsets.all(5)),

            // 비밀번호 재입력
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "비밀번호 재입력",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                ),
                Container(
                  child: TextFormField(
                    // 텍스트폼필드에 스타일 적용
                    decoration: InputDecoration(
                      // 텍스트폼필드의 외각선
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      // 텍스트폼필드의 포커스 외각선
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.5,
                        ),
                      ),
                      // 텍스트폼필드상에 출력되는 텍스트.
                      hintText: 'PASSWORD AGAIN',
                      // 텍스트폼필드의 상단에 출력되는 레이블 텍스트
                      labelText: "비밀번호를 다시 입력해주세요.",
                      // 텍스트폼필드의 상단에 출렫되는 레이블 텍스트 스타일
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // 간격
            Padding(padding: EdgeInsets.all(20)),

            // NEXT 버튼
            Container(
              padding: EdgeInsets.only(left: 100, right: 100),
              child: ElevatedButton(
                onPressed: () {
                  // 다음 화면으로 전환
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Signup_ConfirmEmail()),
                  );
                },
                child: Text(
                  'NEXT',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
