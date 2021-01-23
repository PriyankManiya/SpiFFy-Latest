import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spiffy/conStant.dart';
import 'Map_Page.dart';

// ignore: must_be_immutable
class ItemScreen extends StatefulWidget {
  String imageName;
  String imgPath;
  ItemScreen({this.imageName,this.imgPath});
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.imageName,
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
                tag: widget.imageName,
                child: Image.asset(
                  "assets/${widget.imgPath}",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
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
                      widget.imageName,
                      style: Constant.Text20_w700,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      "Enjoy Luxury Food",
                      style: Constant.Text16_w500,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et",
                      style:Constant.Text16_w300,
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
                      "Gallery",
                      style: Constant.Text20_w600,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      height: height * 0.25,
                      width: width,
                      child: GridView(
                        children: [
                          Image.asset("assets/Gallery-1.png"),
                          Image.asset("assets/Gallery-2.png"),
                        ],
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                child: SizedBox(
                  height: height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: FlatButton(
                    child: Text(
                      "Locate",
                      style: Constant.Text22_Bold_white,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MapPage(),
                      ));
                    },
                    color: Constant.primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
