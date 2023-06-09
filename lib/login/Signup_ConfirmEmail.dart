import 'package:client/login/Signup_Nickname.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../bar/LoginBar.dart';

class Signup_ConfirmEmail extends StatefulWidget {
  const Signup_ConfirmEmail({Key? key}) : super(key: key);

  @override
  State<Signup_ConfirmEmail> createState() => _Signup_ConfirmEmailState();
}

class _Signup_ConfirmEmailState extends State<Signup_ConfirmEmail> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: LoginBar(
          title: "SIGN IN",
        ),
        body: ListView (
          padding: EdgeInsets.all(20),
          children: [
            Padding(padding: EdgeInsets.only(top: 100)),
            Text(
              "입력한 이메일로\n인증번호가 발송되었습니다.\n인증번호 확인 후\n아래에 입력해주세요.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                // 텍스트 가운데 정렬
                textAlign: TextAlign.center,
                // 숫자만 입력할 수 있는 키보드로 설정
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
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
            Padding(padding: EdgeInsets.all(20)),
            Container(
              padding: EdgeInsets.only(left: 100, right: 100),
              child: ElevatedButton(
                onPressed: () {
                  // 다음 화면으로 전환
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Signup_Nickname()),
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
