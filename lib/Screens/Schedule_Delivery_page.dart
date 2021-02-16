import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spiffy/Screens/Confirem_Order_Page.dart';
import 'package:spiffy/widget/conStant.dart';

class ScheduleDeliveryPage extends StatefulWidget {
  @override
  _ScheduleDeliveryPageState createState() => _ScheduleDeliveryPageState();
}

class _ScheduleDeliveryPageState extends State<ScheduleDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Schedule Delivery",
          style: Constant.Text20_Bold_White,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Total:",
                        style: Constant.Text20_Bold_White,
                      ),
                      Text(
                        " \$ 10.95",
                        style: Constant.Text20_Bold_White,
                      ),
                    ],
                  ),
                ),
                color: Colors.black,
                height: height * 0.07,
                width: width,
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black)),
                  height: height * 0.34,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Shipping Information",
                                    style: Constant.Text18_Bold_White,
                                  ),
                                  Container(
                                    height: height * 0.04,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Colors.white, width: 2)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: Text(
                                          "Change",
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.gps_fixed),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Text(
                                    "William Jhons \n B-201 Baker's Street, \n +1 999 999 9999",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey[500],
                          thickness: 2,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Billing Information",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    height: height * 0.04,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Colors.white, width: 2)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: Center(
                                        child: Text(
                                          "Change",
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    backgroundImage:
                                        AssetImage("assets/visa_symbol.png"),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Text(
                                    "William Jhons \n **** ***353",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.25,
              ),
              Center(
                child: SizedBox(
                  height: height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: FlatButton(
                    child: Text(
                      "Deliver Order",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmOrderPage(),
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
