import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spiffy/widget/conStant.dart';
import 'Cart2_Screen.dart';
import 'FoodList.dart';

// ignore: must_be_immutable
class SearchItem extends StatefulWidget {
  String imgName;
  String itemName;
  SearchItem({this.imgName,this.itemName});
  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
         widget.itemName,
          style: Constant.Text20_w700,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                  tag: widget.imgName,
                  child: Image.asset(
                    "assets/${widget.imgName}",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Veg + double-cheese Burger",
                      style: Constant.Text20_w700,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Best Burger in the World",
                          style: Constant.Text17_w500,
                        ),
                        Text(
                          "\$ 4.25",
                          style: Constant.Text23_W700_Pri,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star_border,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                        Text(
                          "(423 Reviews)",
                          style: Constant.Text15_w500,
                        ),
                        SizedBox(
                          width: width * 0.12,
                        ),
                        Text(
                          "View All",
                          style: Constant.Text13_w500,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Divider(
                      color: Colors.grey[500],
                      thickness: 2.0,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      "Description",
                      style: Constant.Text20_w600,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      "Pizza baked in smoke oven at the right temperature for thebest texture. Toping of Californian Tomato, Garlic, Cheese , Paneer, Paprica and Oragano ...  ",
                      style: Constant.Text16_w300,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Divider(
                      color: Colors.grey[500],
                      thickness: 2.0,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      "You may also like ",
                      style:Constant.Text20_w600,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Container(
                  height: height * 0.265,
                  child: FoodList(),
                ),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              Center(
                child: SizedBox(
                  height: height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: FlatButton(
                    child: Text(
                      "Add to Cart",
                      style: Constant.Text22_Bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Cart2Screen(),
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
        ),
      ),
    );
  }
}
