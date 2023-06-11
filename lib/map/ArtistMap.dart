import 'package:client/bar/MainBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class ArtistMap extends StatefulWidget {
  const ArtistMap({Key? key, required}) : super(key: key);

  @override
  State<ArtistMap> createState() => _ArtistMapState();
}

class _ArtistMapState extends State<ArtistMap> {
  // 지도를 제어하기 위한 컨트롤러
  late GoogleMapController _controller;

  // 현재 위치 표시 기능을 활성화하는 속성
  bool _myLocationEnabled = false;

  // 마커 커스텀
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  List<Map<String, dynamic>> places = [
    {
      'name': 'Place 1',
      'latitude': 37.532600,
      'longitude': 127.024612,
    },
    {
      'name': 'Place 2',
      'latitude': 37.532700,
      'longitude': 127.024712,
    },
    {
      'name': 'Place 3',
      'latitude': 37.532800,
      'longitude': 127.024812,
    },
    {
      'name': 'Place 4',
      'latitude': 37.532900,
      'longitude': 127.024912,
    },
    {
      'name': 'Place 5',
      'latitude': 37.533000,
      'longitude': 127.025012,
    },
    {
      'name': 'Place 6',
      'latitude': 37.533100,
      'longitude': 127.025112,
    },
  ];

  @override
  void initState() {
    addCustomIcon();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 현재 위치를 가져온다.
  // 에뮬레이터 사용 시 에뮬레이터 설정에서 현재 위치를 설정할 수 있다.
  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    final position = await Geolocator.getCurrentPosition();
    final cameraPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 18,
    );
    _controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    setState(() {
      _myLocationEnabled = true;
    });
  }

  // 마커를 커스텀한다.
  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/images/marker.png")
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBar(),
      body: Stack(
        children: [
          // 구글 지도
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(37.532600, 127.024612), // 서울 시청 위치
              zoom: 18,
            ),
            myLocationEnabled: _myLocationEnabled,
            myLocationButtonEnabled: false,
            markers: Set<Marker>.of(places.map((place) {
              return Marker(
                markerId: MarkerId(place['name']),
                position: LatLng(place['latitude'], place['longitude']),
                infoWindow: InfoWindow(title: place['name']),
                icon: markerIcon,
                onTap: () {
                  //
                },
              );
            })),
            onMapCreated: (controller) => _controller = controller,
          ),

          // 현재위치로 이동하는 버튼
          Positioned(
            top: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: _getCurrentLocation,
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              // 그림자 크기
              elevation: 8,
              child: Icon(Icons.my_location),
              shape: RoundedRectangleBorder(
                // 버튼 모서리 둥글기
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          // 추가하기, 랭킹, 프로필 버튼
          Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    // 첫 번째 버튼 동작
                  },
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  elevation: 8,
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 16),
                FloatingActionButton(
                  onPressed: () {
                    // 두 번째 버튼 동작
                  },
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  elevation: 8,
                  child: Icon(Icons.star),
                ),
                SizedBox(height: 16),
                FloatingActionButton(
                  onPressed: () {
                    // 세 번째 버튼 동작
                  },
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  elevation: 8,
                  child: Icon(Icons.person),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
