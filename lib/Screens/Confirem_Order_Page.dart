import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spiffy/conStant.dart';

import 'Order_page.dart';

class ConfirmOrderPage extends StatefulWidget {
  @override
  _ConfirmOrderPageState createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: Container(
              child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Center(child: Lottie.asset("assets/delivery_boy.json")),
            ),
            Text(
              "Order Confirmed !!!",
              style: Constant.Text22_Bold_white,
            ),
            Icon(
              CupertinoIcons.check_mark_circled_solid,
              size: 100,
            ),
            SizedBox(
              height: height * 0.13,
            ),
            Center(
              child: SizedBox(
                height: height * 0.06,
                width: MediaQuery.of(context).size.width * 0.9,
                child: FlatButton(
                  child: Text(
                    "Trace Order",
                    style: Constant.Text22_Bold_white,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OrderPage(),
                    ));
                  },
                  color: Constant.primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            )
          ],
        ),
      ))),
    );
  }
}
