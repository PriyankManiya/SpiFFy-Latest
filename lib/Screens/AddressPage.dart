import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:geocoder/services/base.dart';
import 'package:location/location.dart';
import '../conStant.dart';
import 'GoogleMapAddScreen.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String dateValue;
  double x = 5;
  String locationString;
  String previosLocalString;
  Geocoding geocoding = Geocoder.local;
  Location location = Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  bool isLocFromMap = false;
  bool isLocFromLocal = false;
  bool isLoading = true;
  List<String> listOfAdd = [];
  List<bool> locTypes = [];

  double sWidth;

  toast({String msg}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Constant.primaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Address'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                FlatButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Select Current Add",
                      style: Constant.Text18_w700_White,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {
                    listOfAdd.add(locationString);
                    setState(() {
                      locTypes.add(false);
                      isLocFromLocal = true;
                      isLocFromMap = false;
                    });
                    // debugPrint("--Current Add--->>>>. ${listOfAdd.length}");
                    Navigator.pop(context);
                    toast(msg: "Added Successfully");
                  },
                  color: Constant.primaryColor,
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Select From Map",
                      style: Constant.Text18_w700_White,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {
                    setState(() {
                      previosLocalString = locationString;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (contex) {
                      return GoogleMapAddScreen(
                        locationString: setNewLocationString,
                      );
                    })).then((value) {
                      Navigator.pop(context);
                    });
                  },
                  color: Constant.primaryColor,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Constant.primaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  setNewLocationString(String newLocation) {
    print("Called");
    setState(() {
      locTypes.add(true);
      isLocFromMap = true;
      isLocFromLocal = false;
      locationString = newLocation;
    });
    if (previosLocalString != newLocation) {
      listOfAdd.add(newLocation);
      print("----->>>>. ${listOfAdd.length}");
    } else {
      print("String is not Changed");
    }
  }

  void getAddressFromLatLong({latitude, longitude}) async {
    List<Address> result = await geocoding
        .findAddressesFromCoordinates(new Coordinates(latitude, longitude));
    print(result.first.addressLine.toString());
    setState(() {
      isLoading = false;
      locationString = result.first.addressLine;
      print(locationString);
    });
  }

  Future<void> _checkService() async {
    final bool serviceEnabledResult = await location.serviceEnabled();
    setState(() {
      _serviceEnabled = serviceEnabledResult;
    });
  }

  Future<void> _requestService() async {
    if (_serviceEnabled == null || !_serviceEnabled) {
      final bool serviceRequestedResult = await location.requestService();
      setState(() {
        _serviceEnabled = serviceRequestedResult;
      });
      if (!serviceRequestedResult) {
        setState(() {
          isLoading = false;
        });
        return;
      }
    }
  }

  Future<void> _checkPermissions() async {
    final PermissionStatus permissionGrantedResult =
        await location.hasPermission();
    setState(() {
      _permissionGranted = permissionGrantedResult;
    });
  }

  Future<void> _requestPermission() async {
    if (_permissionGranted != PermissionStatus.granted) {
      final PermissionStatus permissionRequestedResult =
          await location.requestPermission();
      setState(() {
        _permissionGranted = permissionRequestedResult;
      });
    }
  }

  void callCurrentLocation() {
    _checkService().then((value) => _requestService().then((value) =>
        _checkPermissions()
            .then((value) => _requestPermission().then((value) async {
                  var currentLocation = await location.getLocation();
                  getAddressFromLatLong(
                      longitude: currentLocation.longitude,
                      latitude: currentLocation.latitude);
                }))));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.add_circle), onPressed: () => _showMyDialog()),
        ],
        title: Text(
          "Address",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Saved Address",
                  style: Constant.Text15_w500_White,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.home),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Home",
                                  style: Constant.Text18_w700_White,
                                ),
                                Text(
                                  "Akshya Nagar 1st Block 1st Cross, \nRammurthy nagr, \nBanglore-560016 ",
                                  style: Constant.Text15_w500_White,
                                ),
                              ],
                            ),
                            Icon(
                              Icons.delete,
                              color: Constant.primaryColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.work),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Office",
                                  style: Constant.Text18_w700_White,
                                ),
                                Text(
                                  "Akshya Nagar 1st Block 1st Cross, \nRammurthy nagr, \nBanglore-560016 ",
                                  style: Constant.Text15_w500_White,
                                ),
                              ],
                            ),
                            Icon(
                              Icons.delete,
                              color: Constant.primaryColor,
                            ),
                          ],
                        ),
                        ListView.builder(
                          itemCount: listOfAdd.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    color: Colors.white,
                                    thickness: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                locTypes[index]
                                                    ? Icon(Icons.add_location)
                                                    : Icon(
                                                        Icons.home_work_sharp),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                locTypes[index]
                                                    ? Text(
                                                        "Address",
                                                        style: Constant
                                                            .Text18_w700_White,
                                                        textAlign:
                                                            TextAlign.start,
                                                      )
                                                    : Text(
                                                        "Current Address",
                                                        style: Constant
                                                            .Text18_w700_White,
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                              ],
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  print(index);
                                                  listOfAdd.removeAt(index);
                                                  setState(() {
                                                    listOfAdd;
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Constant.primaryColor,
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 40, right: 10),
                                          child: Text(
                                            listOfAdd[index],
                                            textAlign: TextAlign.start,
                                            style: Constant.Text15_w500_White,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
