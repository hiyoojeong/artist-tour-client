import 'dart:async';

import 'package:client/bar/MainBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class ArtistMap extends StatefulWidget {
  const ArtistMap({Key? key}) : super(key: key);

  @override
  State<ArtistMap> createState() => _ArtistMapState();
}

class _ArtistMapState extends State<ArtistMap> {

  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBar(),
      body: Container(
        child: NaverMap(
          onMapCreated: onMapCreated,
          mapType: _mapType,
        ),
      ),
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}
