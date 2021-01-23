import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:spiffy/Screens/Cart2_Screen.dart';
import 'package:spiffy/Screens/Id_Screen.dart';
import 'package:spiffy/Screens/Search_Screen.dart';
import 'package:spiffy/conStant.dart';
import 'DashBoard.dart';

// ignore: camel_case_types
class Navigation_Screen extends StatefulWidget {
  @override
  _Navigation_ScreenState createState() => _Navigation_ScreenState();
}

// ignore: camel_case_types
class _Navigation_ScreenState extends State<Navigation_Screen> {

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        activeColor: Constant.primaryColor,
        inactiveColor: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        activeColor:Constant.primaryColor,
        inactiveColor: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_basket),
        activeColor:Constant.primaryColor,
        inactiveColor: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        activeColor: Constant.primaryColor,
        inactiveColor: Colors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      controller: _controller,
      screens: [
        Dashboard(),
        SearchScreen(),
        Cart2Screen(),
        IdScreen(),
      ],
      items: _navBarsItems(),

      confineInSafeArea: true,
      backgroundColor: Colors.grey[900],
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style5, // Choose the nav bar style with this property.
    );
  }
}
