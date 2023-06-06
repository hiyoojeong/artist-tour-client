import 'package:client/header/Header_Login.dart';
import 'package:client/login/Signup_End.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signup_Subscribe extends StatefulWidget {
  const Signup_Subscribe({Key? key}) : super(key: key);

  @override
  State<Signup_Subscribe> createState() => _Signup_SubscribeState();
}

class _Signup_SubscribeState extends State<Signup_Subscribe> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: HeaderLogin(
          title: 'Sign In',
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Padding(padding: EdgeInsets.only(top: 100)),
            Text(
              "아티스트를 구독해주세요!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Icon(Icons.search, size: 30,),
                  Flexible(
                    child: TextFormField(
                      // 텍스트 가운데 정렬
                      textAlign: TextAlign.center,
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(20)),
            Container(
              padding: EdgeInsets.only(left: 100, right: 100),
              child: ElevatedButton(
                onPressed: () {
                  // 다음 화면으로 전환
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Signup_End()),
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
