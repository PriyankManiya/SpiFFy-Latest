import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission/permission.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final CameraPosition _initialCameraposition =
      CameraPosition(target: LatLng(21.231807, 72.866224), zoom: 15);
  GoogleMapController _controller;
  final List<Marker> marker = [];

  addMarker(cordinates) {
    int id = Random().nextInt(100);
    setState(() {
      marker.add(Marker(
          position: cordinates,
          draggable: true,
          markerId: MarkerId(id.toString())));
    });
  }

  final Set<Polyline> polyline = {};

  PolylinePoints polylinePoints = PolylinePoints();

  permissionreq() async {
    var permissions =
        await Permission.getPermissionsStatus([PermissionName.Location]);
    if (permissions[0].permissionStatus == PermissionStatus.notAgain) {
     /* var askpermissions =
          await Permission.requestPermissions([PermissionName.Location]);*/
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    permissionreq();
  }

  List<LatLng> polylineCoordinates = [];

  Map<PolylineId, Polyline> polylines = {};


  /// You can use it in future for get Route
 /* _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.blue,
        points: polylineCoordinates,
        width: 4,
        jointType: JointType.round);
    polylines[id] = polyline;
    setState(() {});
  }*/

  /// Google Map Controller

  // GoogleMapController _mapController;



//You can also get route of hotle by accessing your billing path libarary in google.console.com
 /* _getPolyline() {
    polylinePoints
        .getRouteBetweenCoordinates(
     constant.googleAPiKey,
      PointLatLng(_originLatitude, _originLongitude),
      PointLatLng(_destLatitude, _destLongitude),
      travelMode: TravelMode.driving,
    )
        .then((value) {
      print("=Size of Value===${value.points.length}");
      if (value.points.isNotEmpty) {
        value.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      }
      print("size of PolyCoordinates===${polylineCoordinates.length}");
      if (polylineCoordinates.isNotEmpty) {
        _addPolyLine();
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: height * 0.77,
              width: width,
              //integration of GoogleMap
              child: GoogleMap(
                initialCameraPosition: _initialCameraposition,
                mapType: MapType.normal,
                onMapCreated: (controller) {
                  setState(() {
                    _controller = controller;
                    polyline.add(Polyline(
                        polylineId: PolylineId('poly'),
                        visible: true,
                        points: polylineCoordinates,
                        width: 4,
                        color: Colors.blueAccent,
                        startCap: Cap.roundCap,
                        endCap: Cap.buttCap));
                  });
                },
                polylines: polyline,
                onTap: (cordinates) {
                  _controller.animateCamera(CameraUpdate.newLatLng(cordinates));
                  addMarker(cordinates);
                },
                markers: marker.toSet(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
