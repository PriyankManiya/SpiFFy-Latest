import 'package:flutter/material.dart';

import '../conStant.dart';

// ignore: must_be_immutable
class AddressItem extends StatefulWidget {
  String locType;
  String localAdd;
  IconData iconType;
  
  AddressItem({this.localAdd,this.locType,this.iconType});
  @override
  _AddressItemState createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.white,
          thickness: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(widget.iconType),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.locType,
                  style: Constant.Text18_w700_White,
                ),
                Text(
                  "Akshya Nagar 1st Block 1st Cross, \nRammurthy nagr, \nBanglore-560016 ",
                  style: Constant.Text15_w500_White,
                ),
              ],
            ),
            Icon(Icons.delete),
          ],
        ),

      ],
    );
  }
}
