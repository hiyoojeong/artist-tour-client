import 'dart:convert';
import 'package:client/map/ArtistMap.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:client/login/Signup_Info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../url/URL.dart';

class LoginRequest {
  final String username;
  final String password;

  LoginRequest({required this.username, required this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> loginRequestMap) {
    return LoginRequest(
        username: loginRequestMap['username'], password: loginRequestMap['password']);
  }

  Map<String, dynamic> toJson() => {'username': username, 'password': password};
}

// 로그인 화면
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _login(LoginRequest loginRequest) async {
    try {
      // http 요청에 대한 응답
      var response = await http.post(
        Uri.parse(URL().url + '/login'),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(loginRequest),
      );

      if (response.statusCode == 200) {
        // 로그인 성공
        print('로그인 성공');

        // http 요청에 대한 응답 추출
        Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));

        print(json['token']);

        // 토큰 저장
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", json['token']);

        // 화면 전환
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ArtistMap()));
      } else {
        // 로그인 성공
        print('로그인 실패');

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(50),
          children: [
            // 간격
            SizedBox(height: 50),

            // "덕지순례" 로고
            Container(
              padding: EdgeInsets.only(left: 80, right: 80),
              child: Image.asset('assets/images/logo_text1.png'),
            ),

            // 간격
            Padding(padding: EdgeInsets.all(10)),

            // "덕지순례" 아이콘
            Container(
              padding: EdgeInsets.only(left: 100, right: 100),
              child: Image.asset('assets/images/icon_transparent.png'),
            ),

            // 간격
            Padding(padding: EdgeInsets.all(10)),

            // 아이디, 비밀번호를 입력하는 폼
            Column(
              children: [
                // 아이디 텍스트폼필드 추가
                TextFormField(
                  // 컨트롤러 설정
                  controller: _usernameController,
                  // 텍스트폼필드에 값이 없을 경우 메세지
                  validator: (value) {
                    if (value is String) {
                      if (value.isEmpty) {
                        return '아이디를 입력해주세요.';
                      } else {
                        return null;
                      }
                    }
                  },
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

                // 간격
                Padding(padding: EdgeInsets.all(5)),

                // 비밀번호 텍스트폼필드 추가
                TextFormField(
                  // 컨트롤러 설정
                  controller: _passwordController,
                  validator: (value) {
                    if (value is String) {
                      if (value.isEmpty) {
                        return '비밀번호를 입력해주세요.';
                      } else {
                        return null;
                      }
                    }
                  },
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
                    )),
                    // 텍스트폼필드상에 출력되는 텍스트.
                    hintText: 'PASSWORD',
                    // 텍스트폼필드의 상단에 출력되는 레이블 텍스트
                    labelText: "비밀번호를 입력해주세요.",
                    // 텍스트폼필드의 상단에 출렫되는 레이블 텍스트 스타일
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            // 간격
            Padding(padding: EdgeInsets.all(10)),

            // 로그인, 회원가입 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 로그인 버튼
                ElevatedButton(
                  onPressed: () {
                    print("username: " + _usernameController.text);
                    print("passwrod: " + _passwordController.text);
                    _login(new LoginRequest(
                        username: _usernameController.text,
                        password: _passwordController.text));
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                // 회원가입 버튼
                ElevatedButton(
                  onPressed: () {
                    // 다음 화면으로 전환
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Signup_Info()),
                    );
                  },
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),

            // 간격
            Padding(padding: EdgeInsets.all(20)),

            // 아아디찾기, 비밀번호찾기 버튼
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                  ),
                  child: Text('아이디찾기'),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                  ),
                  child: Text('비밀번호찾기'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
