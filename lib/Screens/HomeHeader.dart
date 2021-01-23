import 'package:flutter/material.dart';

import '../conStant.dart';

class Menu {
  String title;

  Menu({
    this.title,
  });
}

class HomeHeader extends StatefulWidget {
  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final menuItems = <Menu>[
    Menu(
      title: "All",
    ),
    Menu(
      title: "Breakfast",
    ),
    Menu(
      title: "Lunch",
    ),
    Menu(
      title: "Hi-Tea",
    ),
    Menu(
      title: "Dinner",
    ),
    Menu(
      title: "Snacks",
    ),
    Menu(
      title: "Lunch",
    ),
    Menu(
      title: "Hi-Tea",
    ),

  ];

  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: ListView.builder(
            itemCount:menuItems.length ,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border:
                      Border.all(color: Colors.grey[300], width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        menuItems[index].title,
                        style: Constant.Text13_w500White,
                      )
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
