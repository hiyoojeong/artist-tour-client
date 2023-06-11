import 'package:client/search/Search.dart';
import 'package:client/setting/AppSetting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBar extends StatefulWidget implements PreferredSizeWidget {
  const MainBar({Key? key}) : super(key: key);

  final double header_height = 60; // 헤더 높이

  @override
  State<MainBar> createState() => _MainBarState();

  @override
  Size get preferredSize => Size.fromHeight(header_height);
}

class _MainBarState extends State<MainBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("덕지순례"),
      centerTitle: true,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Search()),
          );
        },
        icon: Icon(Icons.search),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AppSetting()),
            );
          },
          icon: Icon(Icons.settings),
        )
      ],
    );
  }
}
