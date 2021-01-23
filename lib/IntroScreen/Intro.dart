import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Intro2.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (context) => Intro2(),), (
                  route) => false);

            },
            child: Image.asset(
              "assets/intro1.png",
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
