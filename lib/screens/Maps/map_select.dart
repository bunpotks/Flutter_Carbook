import 'package:carbook/components/default_button.dart';
import 'package:carbook/screens/details/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:async';

import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

// class MapSelect extends StatefulWidget {
//   _MapSelectState createState() => _MapSelectState();
// }

// class _MapSelectState extends State<MapSelect> {
//   late Timer timer;
//   int text = 1;

//   @override
//   void initState() {
//     print('222');

//     timer = new Timer(const Duration(milliseconds: 5000), () {
//       print('111');
//       setState(() {
//         text++;
//       });
//     });

//     super.initState();
//   }

//   @override
//   void dispose() {
//     timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: new Text(text.toString()),
//       ),
//     );
//   }
// }

class MapSelect extends StatefulWidget {
  const MapSelect({Key? key}) : super(key: key);

  @override
  State<MapSelect> createState() => _MapSelectState();
}

class _MapSelectState extends State<MapSelect> {
  GoogleMapController? mapController;
  static final LatLng _kMapCenter =
      LatLng(13.746037870293371, 100.53295921059627);
  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 18.0, tilt: 0, bearing: 0);
  Location location = new Location();

  Map<dynamic, dynamic> selectLocation = {"lat": '', "lng": ''};
  bool? selectedLocation;
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;

  Timer? _timer;

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      mapController = controller;
    });

    if (mapController != null) {
      _getCurrentLocation().then((value) {
        var lat = double.parse(value.latitude.toString());
        var lng = double.parse(value.longitude.toString());

        mapController!
            .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 18));
      });
    }
  }

  void _onCameraMove(CameraPosition cameraPosition) {
    if (_timer != null) {
      _timer?.cancel();
    }

    if (mounted) {
      setState(() {
        _timer = new Timer(const Duration(milliseconds: 1000), () {
          setState(() {
            selectLocation["lat"] =
                cameraPosition.target.latitude.toStringAsFixed(8);
            selectLocation["lng"] =
                cameraPosition.target.longitude.toStringAsFixed(8);
            selectedLocation = true;
          });
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    assetLocation();
  }

  Future assetLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return true;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      } else {
        return true;
      }
    }

    return true;
  }

  Future _getCurrentLocation() async {
    return await location.getLocation();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MapShow(context);
  }

  Widget MapShow(context) {
    return Scaffold(
      body: Stack(
        children: [
          MapRender(),
          CustomAppBar(
            rating: 0,
          ),
          AddressBox(context),
          // AddressBox2(context),
          // ConfirmButton(),
        ],
      ),
    );
  }

  Widget MapRender() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        onMapCreated: _onMapCreated,
        onCameraMove: _onCameraMove,
        initialCameraPosition: _kInitialPosition,
      ),
    );
  }

  Widget ConfirmButton() {
    return Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          // height: 200,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(),
          child: DefaultButton(
            text: 'ยืนยัน',
            press: () async {
              Navigator.pop(context);
            },
          ),
        ));
  }

  Widget AddressBox(context) {
    return Center(
      child: Column(
        children: [
          Spacer(),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
                padding: EdgeInsets.all(10),
                width: 250,
                height: 110,
                decoration: (BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.75),
                )),
                child: selectedLocation == true
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('เลือกจุดนี้',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(height: 10),
                          Text(
                              "${selectLocation['lat']},${selectLocation['lng']}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              )),
                        ],
                      )
                    : Center(child: Text('โปรดรอสักครู่...'))),
          ),
          SizedBox(height: 10),
          Image.asset(
            "assets/images/pin.png",
            width: 40,
            height: 40,
          ),
          SizedBox(height: 160),
          Spacer(),
        ],
      ),
    );
  }
}
