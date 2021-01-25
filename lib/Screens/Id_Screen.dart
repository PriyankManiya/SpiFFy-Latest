import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spiffy/Screens/AddressPage.dart';
import 'package:spiffy/Screens/Favourite.dart';
import 'package:spiffy/Screens/Order_History.dart';
import 'package:spiffy/Screens/Payment.dart';
import 'package:spiffy/Screens/Settings.dart';

import '../conStant.dart';

class IdScreen extends StatefulWidget {
  @override
  _IdScreenState createState() => _IdScreenState();
}

class _IdScreenState extends State<IdScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.07,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        "assets/images.png",
                      ),
                    ),
                    Text(
                      "Alex Parker",
                      style: Constant.Text22_Bold_white,
                    ),
                    Text(
                      "+1 999 999 9999",
                      style: Constant.Text15_w500_White,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => OrderHistory(),
                            ));
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Icon(Icons.history),
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      "Order History",
                                      style: Constant.Text15_w500_White,
                                    )
                                  ],
                                ),

                                // FlatButton.icon(
                                //     onPressed: () {
                                //
                                //     },
                                //     icon: Icon(Icons.history),
                                //     label: Text(
                                //       "Order History",
                                //       style: Constant.Text15_w500_White,
                                //     )),
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {})
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Payment(),
                            ));
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Icon(Icons.payment),
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      "Payment",
                                      style: Constant.Text15_w500_White,
                                    )
                                  ],
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {})
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddressPage(),
                            ));
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Icon(Icons.add_location),
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      "Address",
                                      style: Constant.Text15_w500_White,
                                    )
                                  ],
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {})
                              ],
                            ),
                          ),
                        ),

                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Favourite(),
                            ));
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Icon(Icons.favorite_border),
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      "Favourite Orders",
                                      style: Constant.Text15_w500_White,
                                    )
                                  ],
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {})
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Settings(),
                            ));
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Icon(Icons.settings),
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      "Settings",
                                      style: Constant.Text15_w500_White,
                                    )
                                  ],
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {})
                              ],
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
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Send Feedback",
                      style: Constant.Text15_w500_White,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      "Help",
                      style: Constant.Text15_w500_White,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      "Log Out",
                      style:Constant.Text15_w500_White,
                    ),
                    SizedBox(
                      height: height * 0.1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
