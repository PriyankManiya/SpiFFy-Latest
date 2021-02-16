import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:spiffy/conStant.dart';
import 'Screens/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SplashPages(),
    );
  }
}

final List<String> imgList = [
  'assets/intro1.png',
  'assets/intro2.png',
  'assets/intro3.png'
];

class SplashPages extends StatefulWidget {
  @override
  _SplashPagesState createState() => _SplashPagesState();
}

class _SplashPagesState extends State<SplashPages> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: BottomAppBar(
          color: Colors.transparent,
          child: SizedBox(
            height: height * 0.07,
            width: MediaQuery.of(context).size.width * 0.9,
            child: FlatButton(
              child: Text(
                "Place Order",
                style: Constant.Text22_Bold_white,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Login(),
                ));
              },
              color: Constant.primaryColor,
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xff232323),
      // appBar: AppBar(title: Text('Image slider demo')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              child: Carousel(
                images: [
                  AssetImage('assets/intro1.png'),
                  AssetImage('assets/intro2.png'),
                  AssetImage('assets/intro3.png'),
                ],
                showIndicator: true,
                dotSize: 4.0,
                animationCurve: Curves.easeInToLinear,
                dotSpacing: 15.0,
                dotColor: Constant.primaryColor,
                indicatorBgPadding: MediaQuery.of(context).size.height * 0.05,
                dotBgColor: Colors.transparent,
                borderRadius: true,
                overlayShadow: false,
                autoplay: true,
                boxFit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
