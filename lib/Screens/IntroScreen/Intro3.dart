import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Intro3 extends StatefulWidget {
  @override
  _Intro3State createState() => _Intro3State();
}

class _Intro3State extends State<Intro3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GestureDetector(
            child: Image.asset(
              "assets/intro3.png",
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
