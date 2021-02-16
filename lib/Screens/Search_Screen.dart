import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spiffy/widget/conStant.dart';
import 'package:spiffy/widget/searchScreenItem.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // height: MediaQuery.of(context).size.height*0.13,
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
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("Restauranta Near You",
                    style: Constant.Text18_w600_White),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              SearchScreenItem(imgPath: "continental.png",rating: "4.2",kms: "17",add: "32 B, Royal Square",location: "Los Angeles",restName: "Restaurant",),
              SizedBox(
                height: height * 0.018,
              ),
              SearchScreenItem(imgPath: "Dominoes.png",rating: "4.6",kms: "17",add: "A-21 , Antelina",location: "New York",restName: "Dominoes",),
              SizedBox(
                height: height * 0.018,
              ),
              SearchScreenItem(imgPath: "MacD.png",rating: "4.2",kms: "0.7",add: "322-W , Angel Mall",location: "New York",restName: "McDonalds",),
              SizedBox(
                height: height * 0.018,
              ),
              SearchScreenItem(imgPath: "BaskinRobin.png",rating: "5.0",kms: "3.5",add: "12-C , VR Mall",location: "Nevada",restName: "Baskin Robbins",),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
