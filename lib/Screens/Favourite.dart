import 'package:flutter/material.dart';
import 'package:spiffy/widget/dashBoardItem.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.018,
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
