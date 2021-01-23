import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spiffy/Screens/Schedule_Delivery_page.dart';
import 'package:spiffy/conStant.dart';
import 'package:spiffy/widget/cartItem.dart';

class Cart2Screen extends StatefulWidget {
  @override
  _Cart2ScreenState createState() => _Cart2ScreenState();
}

class _Cart2ScreenState extends State<Cart2Screen> {


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: Constant.Text20_w700,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.018,
                ),
                CartItem(imgPath: "Salad.png",itemName: "Healthy Salad", rate: "4.25",),
                SizedBox(
                  height: height * 0.018,
                ),
                CartItem(imgPath: "Burger.png",itemName: "Chicken Burger", rate: "2.45",),
                SizedBox(
                  height: height * 0.018,
                ),
                CartItem(imgPath: "Pasta.png",itemName: "Pasta", rate: "5.00",),
                SizedBox(
                  height: height * 0.018,
                ),
                CartItem(imgPath: "SandWich.png",itemName: "Vegetable Sandwitch", rate: "3.00",),
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  color: Colors.black,
                  height: height * 0.08,
                  width: width,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Image.asset(
                          "assets/coupon.png",
                        ),
                      ),
                      Text("APPLY COUPON",
                          style: Constant.Text18_Bold_White),
                      SizedBox(
                        width: width * 0.1,
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 50,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Bill Details",
                          style:Constant.Text17_w600_White),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Item Total",
                          style: Constant.Text17_w600_White),
                      Text("\$ 9.95",
                          style: Constant.Text17_w600_White),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Charge",
                          style: Constant.Text17_w600_White),
                      Text("\$ 1.00",
                          style: Constant.Text17_w600_White),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Divider(
                    color: Colors.grey[500],
                    thickness: 2,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("To Pay",
                          style: Constant.Text17_w600_White),
                      Text("\$ 10.95",
                          style:Constant.Text17_w600_White),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                SizedBox(
                  height: height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: FlatButton(
                    child: Text(
                      "Place Order",
                      style: Constant.Text22_Bold_white,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ScheduleDeliveryPage(),
                      ));
                    },
                    color: Constant.primaryColor,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
