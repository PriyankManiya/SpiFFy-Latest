import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Intro3.dart';

class Intro2 extends StatefulWidget {
  @override
  _Intro2State createState() => _Intro2State();
}

class _Intro2State extends State<Intro2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GestureDetector(
            onTap:(){
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Intro3(),
                  ),
                      (route) => false);
            } ,
            child: Image.asset(
              "assets/intro2.png",
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
