import 'package:flutter/material.dart';
import 'package:spiffy/Screens/ItemScreen.dart';
import 'package:spiffy/conStant.dart';

// ignore: must_be_immutable
class SearchScreenItem extends StatefulWidget {
  String restName;
  String add;
  String location;
  String kms;
  String imgPath;
  String rating;

  SearchScreenItem(
      {this.rating,
      this.imgPath,
      this.kms,
      this.add,
      this.location,
      this.restName});

  @override
  _SearchScreenItemState createState() => _SearchScreenItemState();
}

class _SearchScreenItemState extends State<SearchScreenItem> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ItemScreen(
            imgPath: widget.imgPath,
            imageName: widget.restName,
          ),
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
                    tag: widget.restName,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          bottomLeft: Radius.circular(18)),
                      child: Image.asset(
                        "assets/${widget.imgPath}",
                        height: 130,
                        fit: BoxFit.fitHeight,
                      ),
                    )),
              ),
              SizedBox(
                width: width * 0.06,
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4, top: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.restName,
                        style: Constant.Text17_w700,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        widget.add,
                        style: Constant.Text14_w500,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        "${widget.location}  ,  1${widget.kms} Kms",
                        style: Constant.Text14_w500,
                      ),

                      /* SizedBox(
                        height: height * 0.02,
                      ),*/
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
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
