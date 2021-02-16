import 'package:flutter/material.dart';
import 'package:spiffy/Screens/Search_Item.dart';
import 'package:spiffy/conStant.dart';

// ignore: must_be_immutable
class DashBoardItem extends StatefulWidget {
  String itemName;
  String place;
  String type;
  String kms;
  String rating;
  String imageName;
  String ratePerPiece;

  DashBoardItem(
      {this.itemName,
      this.kms,
      this.place,
      this.rating,
      this.type,
      this.imageName,
      this.ratePerPiece});

  @override
  _DashBoardItemState createState() => _DashBoardItemState();
}

class _DashBoardItemState extends State<DashBoardItem> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SearchItem(imgName: widget.imageName,itemName: widget.itemName,),
          ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.transparent)),
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Hero(
                      tag: widget.imageName,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(

                            topLeft: Radius.circular(18),
                            bottomLeft: Radius.circular(18)

                        ),
                        child: Image.asset(
                          "assets/${widget.imageName}",
                          fit: BoxFit.fitHeight,
                          height: 140,
                        ),
                      )),
                ),
                SizedBox(
                  width: width * 0.06,
                ),
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.itemName,
                        style: Constant.Text17_w700,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        widget.type,
                        style:Constant.Text14_w500,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        "${widget.place}  ,  ${widget.kms} Kms",
                        style: Constant.Text14_w500,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Constant.primaryColor,
                          ),
                          SizedBox(
                            width: height * 0.01,
                          ),
                          Text(
                            widget.rating,
                            style: Constant.Text14_w500_primClr,
                          ),
                          SizedBox(
                            width: height * 0.03,
                          ),
                          Text(
                            "${widget.ratePerPiece}\$ for one",
                            style: Constant.Text14_w500,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
