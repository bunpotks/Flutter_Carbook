import 'package:carbook/components/default_button.dart';
import 'package:carbook/screens/details/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as tLocation;
import 'dart:async';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'search_location_model.dart';

class MapSelect extends StatefulWidget {
  const MapSelect({super.key});

  @override
  State<MapSelect> createState() => _MapSelectState();
}

class _MapSelectState extends State<MapSelect> {
  static final LatLng kMapCenter =
      LatLng(13.745906396410398, 100.53983036656396);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MapView(kMapCenter: kMapCenter);
  }
}

class MapView extends StatefulWidget {
  const MapView({Key? key, required this.kMapCenter}) : super(key: key);
  final LatLng kMapCenter;

  @override
  State<MapView> createState() => _MapViewState(kMapCenter);
}

class _MapViewState extends State<MapView> {
  _MapViewState(this.kMapCenter);
  LatLng kMapCenter;
  GoogleMapController? mapController;
  late final LatLng _kMapCenter;
  late final CameraPosition _kInitialPosition;
  tLocation.Location location = new tLocation.Location();

  Results? selectLocation;
  bool? selectedLocation = true;
  bool? _serviceEnabled;
  tLocation.PermissionStatus? _permissionGranted;
  Timer? _timer;

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      mapController = controller;
    });

    if (mapController != null) {
      _getCurrentLocation().then((value) {
        var lat = double.parse(value.latitude.toString());
        var lng = double.parse(value.longitude.toString());

        // mapController!
        //     .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 18));
      });
    }
  }

  Future<List<Results>> fetchAlbum(String lat, String lng) async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=AIzaSyAVlihCJQFirBPEdoU5mV8uxaSAe-qCNyQ&location=${lat},${lng}&rankby=distance'));

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body)['results'] as List;

      List<Results> retultObj =
          res.map((resultJson) => Results.fromJson(resultJson)).toList();

      return retultObj;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  void _onCameraMove(CameraPosition cameraPosition) {
    if (_timer != null) {
      _timer?.cancel();
    }

    if (mounted) {
      setState(() {
        _timer = new Timer(const Duration(milliseconds: 1000), () async {
          String lat = cameraPosition.target.latitude.toStringAsFixed(8);
          String lng = cameraPosition.target.longitude.toStringAsFixed(8);
          List<Results> location = await fetchAlbum(lat, lng);

          var LocSelect = location[0];
          setState(() {
            selectLocation = LocSelect;
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
    _kMapCenter = kMapCenter;
    _kInitialPosition =
        CameraPosition(target: _kMapCenter, zoom: 18.0, tilt: 0, bearing: 0);

    String lat = _kInitialPosition.target.latitude.toStringAsFixed(8);
    String lng = _kInitialPosition.target.longitude.toStringAsFixed(8);

    fetchAlbum(lat, lng).then((value) {
      setState(() {
        selectLocation = value[0];
      });
    });
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
    if (_permissionGranted == tLocation.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != tLocation.PermissionStatus.granted) {
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
            onTap: () => Navigator.pop(context, selectLocation),
            child: Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                width: 250,
                height: 170,
                decoration: (BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.75),
                )),
                child: selectLocation?.name != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('เลือกจุดนี้',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(height: 10),
                          Text("${selectLocation?.name}",
                              maxLines: 1,
                              // "${selectLocation['lat']},${selectLocation['lng']}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              )),
                          Text("${selectLocation?.vicinity}",
                              // "${selectLocation['lat']},${selectLocation['lng']}",
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
