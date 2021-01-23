import 'package:flutter/material.dart';
import 'package:spiffy/conStant.dart';

// ignore: must_be_immutable
class OrderHistoryItem extends StatefulWidget {
  String resName;
  String bucks;
  String status;
  String itemName1;
  String item1Count;
  String itemName2;
  String item2Count;
  String itemName3;
  String item3Count;

  OrderHistoryItem(
      {this.bucks,
      this.item1Count,
      this.item2Count,
      this.item3Count,
      this.itemName1,
      this.itemName2,
      this.itemName3,
      this.resName,
      this.status});

  @override
  _OrderHistoryItemState createState() => _OrderHistoryItemState();
}

class _OrderHistoryItemState extends State<OrderHistoryItem> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.resName,
                    style: Constant.Text18_w700_White,
                  ),
                  Text(
                    widget.status,
                    style: Constant.Text13_w500White,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                "${widget.bucks}.00\$",
                style: Constant.Text13_w500White,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Divider(
                thickness: 1,
                color: Colors.white70,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                "${widget.itemName1} x ${widget.item1Count} "
                    "\n${widget.itemName2} x ${widget.item2Count} "
                    " \n${widget.itemName3} x ${widget.item3Count} ",
                style:Constant.Text14_w500,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Constant.primaryColor, width: 1.5)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                  child: Text(
                    "REORDER",
                    style: Constant.Text14_w700_primClr,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
