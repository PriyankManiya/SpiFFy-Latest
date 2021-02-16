import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission/permission.dart';
import 'package:spiffy/widget/conStant.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
      /*var askpermissions =
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

  /// You can Integrate Route If you want By using Below Code with Google map

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

  /*GoogleMapController _mapController;*/

  /*_getPolyline() {
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
      appBar: AppBar(
        title: Text(
          "Order #2538",
          style: Constant.Text20_Bold_White,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: height * 0.4,
                width: width,
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
                    _controller
                        .animateCamera(CameraUpdate.newLatLng(cordinates));
                    addMarker(cordinates);
                  },
                  markers: marker.toSet(),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                  child: Container(
                    child: Column(
                      children: [
                        TimelineTile(
                          indicatorStyle: IndicatorStyle(
                            width: 20,
                            height: 20,
                            indicator: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Constant.primaryColor,
                                    border: Border.all(
                                        width: 3, color: Colors.grey[850])),
                              ),
                            ),
                            drawGap: true,
                          ),
                          hasIndicator: true,
                          alignment: TimelineAlign.left,
                          lineX: 0.1,
                          rightChild: Container(
                            child: Center(
                              child: ListTile(
                                title: Text("Order Placed"),
                                subtitle: Text("We have received your order"),
                              ),
                            ),
                            constraints: const BoxConstraints(
                              minHeight: 50,
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                        TimelineTile(
                          indicatorStyle: IndicatorStyle(
                            width: 20,
                            height: 20,
                            indicator: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Constant.primaryColor,
                                    border: Border.all(
                                        width: 3, color: Colors.grey[850])),
                              ),
                            ),
                            drawGap: true,
                          ),
                          hasIndicator: true,
                          alignment: TimelineAlign.left,
                          lineX: 0.1,
                          rightChild: Container(
                            child: Center(
                              child: ListTile(
                                title: Text("Order Confirmed"),
                                subtitle: Text("Your order has been confirmed"),
                              ),
                            ),
                            constraints: const BoxConstraints(
                              minHeight: 50,
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                        TimelineTile(
                          indicatorStyle: IndicatorStyle(
                            width: 20,
                            height: 20,
                            indicator: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Constant.primaryColor,
                                    border: Border.all(
                                        width: 3, color: Colors.grey[850])),
                              ),
                            ),
                            drawGap: true,
                          ),
                          hasIndicator: true,
                          alignment: TimelineAlign.left,
                          lineX: 0.1,
                          rightChild: Container(
                            child: Center(
                              child: ListTile(
                                title: Text("Order Proceed"),
                                subtitle: Text("Your food is getting cooked"),
                              ),
                            ),
                            constraints: const BoxConstraints(
                              minHeight: 50,
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                        TimelineTile(
                          indicatorStyle: IndicatorStyle(
                            width: 20,
                            height: 20,
                            indicator: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Constant.primaryColor,
                                    border: Border.all(
                                        width: 3, color: Colors.grey[850])),
                              ),
                            ),
                            drawGap: true,
                          ),
                          hasIndicator: true,
                          alignment: TimelineAlign.left,
                          lineX: 0.5,
                          rightChild: Container(
                            child: Center(
                              child: ListTile(
                                title: Text("Order Pickedup"),
                                subtitle: Text("Your food is on it's way"),
                              ),
                            ),
                            constraints: const BoxConstraints(
                              minHeight: 50,
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                        TimelineTile(
                          indicatorStyle: IndicatorStyle(
                            width: 20,
                            height: 20,
                            indicator: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white60,
                                    border: Border.all(
                                        width: 3, color: Colors.grey[900])),
                              ),
                            ),
                            drawGap: true,
                          ),
                          hasIndicator: true,
                          alignment: TimelineAlign.left,
                          lineX: 0.1,
                          rightChild: Container(
                            child: Center(
                              child: ListTile(
                                title: Text(
                                  "Order Deliverd",
                                  style: TextStyle(color: Colors.white70),
                                ),
                                subtitle: Text("Your food is delivered",
                                    style: TextStyle(color: Colors.white38)),
                              ),
                            ),
                            constraints: const BoxConstraints(
                              minHeight: 50,
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
