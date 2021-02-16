import 'package:flutter/material.dart';

import '../widget/conStant.dart';

class Food {
  String img;
  String caption;

  Food({this.img, this.caption});
}

class FoodList extends StatelessWidget {
  final foodItems = <Food>[
    Food(img: 'assets/Pasta.png', caption: "Pasta"),
    Food(img: 'assets/Salad.png', caption: "Salad"),
    Food(img: 'assets/Burger.png', caption: "Burger"),
    Food(img: 'assets/SandWich.png', caption: "SandWich"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal,
        children: foodItems.map<Widget>((Food food) {
          return GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 10.0,top: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              food.img,
                              fit: BoxFit.cover,
                              height: 20,
                            )),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            food.caption,
                            style: Constant.Text15_w500_White,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
        }).toList());
  }
}
