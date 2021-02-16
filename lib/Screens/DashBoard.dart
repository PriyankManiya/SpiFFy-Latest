import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spiffy/Screens/Search_Screen.dart';
import 'package:spiffy/conStant.dart';
import 'package:spiffy/widget/dashBoardItem.dart';
import 'FoodList.dart';
import 'HomeHeader.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> imgList = [
    'assets/Group 34.png',
    'assets/Group 35.png',
    'assets/Group 36.png'
  ];


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(appBar: PreferredSize(preferredSize: Size.zero,child: AppBar(),),
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.transparent,
                width: width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.gps_fixed,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "New York",
                            style: Constant.Text18_w400_White,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 10.0),
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8.0)),
                              border: Border.all(
                                  width: 2.0, color: Colors.grey[300])),
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ),
                                Flexible(
                                    flex: 4,
                                    child: TextField(
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                          hintText: "Search Restaurants",
                                          hintStyle: Constant.Text18_w600_White,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none),
                                    )),
                                Flexible(
                                  flex: 1,
                                  child: Icon(
                                    Icons.filter_list,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.97,
                  height: MediaQuery.of(context).size.height * 0.17,
                  child: Carousel(
                    images: [
                      AssetImage(
                        "assets/Group 34.png",
                      ),
                      AssetImage('assets/Group 35.png'),
                      AssetImage('assets/Group 36.png'),
                    ],
                    showIndicator: false,
                    dotSize: 4.0,
                    animationCurve: Curves.easeInToLinear,
                    dotSpacing: 15.0,
                    dotColor: Constant.primaryColor,
                    indicatorBgPadding:
                        MediaQuery.of(context).size.height * 0.06,
                    dotBgColor: Colors.transparent,
                    borderRadius: true,
                    overlayShadow: false,
                    autoplay: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  height: 50,
                  child: HomeHeader(),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Top Categories",
                  style: Constant.Text17_w700,
                ),
              ),
              Container(
                height: height * 0.22,
                child: FoodList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Near You",
                      style: Constant.Text17_w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "See All",
                      style: Constant.Text17_w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.018,
              ),
              DashBoardItem(type: "American",itemName: "Cheese Burger",kms: "17",place: "Los Angeles" , ratePerPiece: "10",rating: "4.2",imageName:"burger.jpg" ,),
              SizedBox(
                height: height * 0.018,
              ),
              DashBoardItem(type: "American",itemName: "Healthy Salad",kms: "3.5",place: "New York" , ratePerPiece: "3",rating: "4.6",imageName:"Salad.png" ,),
              SizedBox(
                height: height * 0.018,
              ),
              DashBoardItem(type: "Italian",itemName: "Italian Pasta",kms: "0.7",place: "New York" , ratePerPiece: "10",rating: "4.2",imageName:"Pasta.png" ,),
              SizedBox(
                height: height * 0.018,
              ),
              DashBoardItem(type: "Indian",itemName: "Vegetable Sandwitch",kms: "3.5",place: "Las Vegas" , ratePerPiece: "15",rating: "5.0",imageName:"SandWich.png" ,),
              SizedBox(
                height: height * 0.018,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
