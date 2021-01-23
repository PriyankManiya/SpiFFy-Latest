import 'package:flutter/material.dart';
import 'package:spiffy/conStant.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  String itemName;
  String rate;
  String imgPath;

  CartItem({this.itemName, this.imgPath, this.rate});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter <= 0) {
    } else {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/${widget.imgPath}",
                    fit: BoxFit.cover,
                    height: 150,
                    width: 200,
                  )),
            ),
          ),
          SizedBox(
            width: width * 0.04,
          ),
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.itemName,
                  style: Constant.Text20_w700,
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity :",
                      style: Constant.Text15_w500,
                    ),
                    Container(
                      height: height * 0.037,
                      width: width * 0.17,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.white)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                              onTap: _decrementCounter,
                              child: Text(
                                "-",
                                style: Constant.Text18_w500,
                              )),
                          Text(
                            "$_counter",
                            style: Constant.Text15_w500,
                          ),
                          GestureDetector(
                              onTap: _incrementCounter,
                              child: Text(
                                "+",
                                style: Constant.Text18_w500,
                              )),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            "${widget.rate} \$",
                            style: Constant.Text15_w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
