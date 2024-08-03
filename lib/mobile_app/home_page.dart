import 'package:ecommerece/mobile_app/pages/Order.dart';
import 'package:ecommerece/mobile_app/pages/home.dart';
import 'package:ecommerece/mobile_app/pages/profile_screen.dart';
import 'package:ecommerece/mobile_app/pages/search.dart';
import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int pageIndex = 0;
  List<Widget> pagewigets = [
    Home(),
    SearchScreen(),
    OrderClass(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
  //  var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  WillPopScope(
        onWillPop: () async => false,
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: pageIndex,
            onTap: (value) {
              print(value);
              setState(() {
                pageIndex = value;
              });
            },
            selectedItemColor: MyThemeClass.primaryColor,
            unselectedItemColor: MyThemeClass.secoundryColor,
            items: const[
               BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Home"),
             BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
               BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined), label: "Favorite"),
               BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile")
            ],
          ),
          body: pagewigets.elementAt(pageIndex)),
    );
  }
}
