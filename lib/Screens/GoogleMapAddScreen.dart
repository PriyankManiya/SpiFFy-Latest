import 'dart:async';
import 'package:geocoder/geocoder.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/services/base.dart';
import 'package:spiffy/widget/conStant.dart';

class GoogleMapAddScreen extends StatefulWidget {
  @override
  _GoogleMapAddScreenState createState() => _GoogleMapAddScreenState();
  final ValueChanged<String> locationString;

  GoogleMapAddScreen({this.locationString});
}

class _GoogleMapAddScreenState extends State<GoogleMapAddScreen> {
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId selectedMarker;
  Geocoding geocoding = Geocoder.local;
  String addressLine;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Pick Address"),
        actions: [
          IconButton(
              icon: Icon(Icons.done),
              onPressed: () {
                print(addressLine);
                if (addressLine != null) {
                  widget.locationString(addressLine);
                  Navigator.pop(context);
                } else {
                  scaffoldKey.currentState.showSnackBar(SnackBar(backgroundColor: Constant.primaryColor,
                      content: Text("Please select location from map",style: Constant.Text18_w700_White,)));
                }
              })
        ],
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(markers.values),
        onTap: (argument) {
          add(lat: argument.latitude, long: argument.longitude);
        },
      ),
    );
  }

  void getAddressFromLatLong({latitude, longitude}) async {
    List<Address> results = await geocoding
        .findAddressesFromCoordinates(new Coordinates(latitude, longitude));
    //print(results.first.addressLine);
    addressLine = results.first.addressLine;
  }

  void add({lat, long}) {
    getAddressFromLatLong(latitude: lat, longitude: long);
    final MarkerId markerId = MarkerId("address");

    final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(
          lat,
          long,
        ),
        onDragEnd: (LatLng position) {
          _onMarkerDragEnd(markerId, position);
        },
        draggable: true);

    setState(() {
      markers[markerId] = marker;
    });
  }

  void _onMarkerDragEnd(MarkerId markerId, LatLng newPosition) async {
    getAddressFromLatLong(
        latitude: newPosition.latitude, longitude: newPosition.longitude);
  }
}
