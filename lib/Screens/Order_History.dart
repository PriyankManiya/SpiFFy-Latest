import 'package:flutter/material.dart';
import 'package:spiffy/widget/orderHistoryItem.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Order History"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                OrderHistoryItem(
                  bucks: "10",
                  itemName1: "Cheese Loaded",
                  itemName2: "Burger",
                  itemName3: "Crispy Pizza",
                  item1Count: "3",
                  item2Count: "2",
                  item3Count: "3",
                  resName: "Dominoes Pizza",
                  status: "Delivered",
                ),

                SizedBox(
                  height: height * 0.01,
                ),
                OrderHistoryItem(
                  bucks: "30",
                  itemName1: "Maharaja",
                  itemName2: "Veg. Burger",
                  itemName3: "Aloo Ticky",
                  item1Count: "3",
                  item2Count: "2",
                  item3Count: "3",
                  resName: "Mc Donalds",
                  status: "Pending",
                ),

                SizedBox(
                  height: height * 0.01,
                ),
                OrderHistoryItem(
                  bucks: "25",
                  itemName1: "Veg Crispy",
                  itemName2: "Indian Plate",
                  itemName3: "Fulcha",
                  item1Count: "3",
                  item2Count: "2",
                  item3Count: "3",
                  resName: "Continental",
                  status: "Cooking",
                ),

                SizedBox(
                  height: height * 0.01,
                ),
                OrderHistoryItem(
                  bucks: "10",
                  itemName1: "Cheese Loaded",
                  itemName2: "Burger",
                  itemName3: "Crispy Pizza",
                  item1Count: "3",
                  item2Count: "2",
                  item3Count: "3",
                  resName: "Dominoes Pizza",
                  status: "Delivered",
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
