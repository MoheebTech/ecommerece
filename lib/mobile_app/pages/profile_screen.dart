import 'dart:ffi';

import 'package:ecommerece/Add_Card.dart';
import 'package:ecommerece/Loginscreen.dart';
import 'package:ecommerece/mobile_app/pages/Details.dart';
import 'package:ecommerece/mobile_app/pages/Notification.dart';
import 'package:ecommerece/mobile_app/pages/Order.dart';
import 'package:ecommerece/mobile_app/pages/rating_screen.dart';
import 'package:ecommerece/them_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController searchcontroller = TextEditingController();
  final FirebaseAuth auth=FirebaseAuth.instance;
  // deleteDataSf() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.remove('loginId');
  // }
  void logout() async {
    await auth.signOut();
    clearSF();
    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  Loginscreen(),
        ));
  }

  void clearSF() async {
    SharedPreferences sharedprfrence = await SharedPreferences.getInstance();
    sharedprfrence.getKeys();
    sharedprfrence.clear();
  }

  @override
  Widget build(BuildContext context) {
  var  height = MediaQuery.of(context).size.height;
  var  width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            color: MyThemeClass.primaryColor,
          ),
          Container(
            height: height * 0.1,
            width: width,
            color: MyThemeClass.primaryColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width * 0.03),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: MyThemeClass.whiteColor,
                    size: width * 0.06,
                  ),
                ),
                Container(
                  height: height,
                  width: width * 0.3,
                  // color: Colors.amber,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: width * 0.06,
                      color: MyThemeClass.whiteColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: width * 0.05),
                  child: Icon(
                    Icons.shopping_bag,
                    size: width * 0.06,
                    color: MyThemeClass.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.11),
            child: Column(
              children: [
                Container(
                  height: height * 0.3,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/ok.jpg'))),
                ),
                Expanded(
                  child: Container(
                    height: height,
                    width: width,
                    color: MyThemeClass.primaryColor,
                    child: ListView(
                      children: [
                        Container(
                          height: height * 0.03,
                          width: width,
                          child: Center(
                            child: Text(
                              'Hey,',
                              style: TextStyle(
                                  color: MyThemeClass.whiteColor,
                                  fontSize: width * 0.04),
                            ),
                          ),
                        ),
                        Container(
                          height: height * 0.04,
                          width: width,
                          child: Center(
                            child: Text(
                              'Jam Sharjeel',
                              style: TextStyle(
                                color: MyThemeClass.whiteColor,
                                fontSize: width * 0.06,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.02),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OrderClass()));
                            },
                            child: Container(
                              height: height * 0.04,
                              width: width,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.02),
                                      child: Container(
                                          child: Row(
                                        children: [
                                          Icon(
                                            Icons.check_box,
                                            color: MyThemeClass.whiteColor,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: width * 0.05),
                                            child: Text(
                                              'My Orders',
                                              style: TextStyle(
                                                color: MyThemeClass.whiteColor,
                                                fontSize: width * 0.05,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: width * 0.02),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: MyThemeClass.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: width * 0.001,
                          color: MyThemeClass.whiteColor,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NotificationScreen()));
                          },
                          child: Container(
                            height: height * 0.04,
                            width: width,
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: width * 0.02),
                                    child: Container(
                                        child: Row(
                                      children: [
                                        Icon(
                                          Icons.notification_important,
                                          color: MyThemeClass.whiteColor,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.05),
                                          child: Text(
                                            'Notification',
                                            style: TextStyle(
                                              color: MyThemeClass.whiteColor,
                                              fontSize: width * 0.05,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: width * 0.02),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: MyThemeClass.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: width * 0.001,
                          color: MyThemeClass.whiteColor,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsScreen()));
                          },
                          child: Container(
                            height: height * 0.04,
                            width: width,
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: width * 0.02),
                                    child: Container(
                                        child: Row(
                                      children: [
                                        Icon(
                                          Icons.card_travel,
                                          color: MyThemeClass.whiteColor,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.05),
                                          child: Text(
                                            'My Details',
                                            style: TextStyle(
                                              color: MyThemeClass.whiteColor,
                                              fontSize: width * 0.05,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: width * 0.02),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: MyThemeClass.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: width * 0.001,
                          color: MyThemeClass.whiteColor,
                        ),
                        Container(
                          height: height * 0.04,
                          width: width,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.02),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddCardDetails()));
                                    },
                                    child: Container(
                                        child: Row(
                                      children: [
                                        Icon(
                                          Icons.card_travel,
                                          color: MyThemeClass.whiteColor,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.05),
                                          child: Text(
                                            'Payment Methods',
                                            style: TextStyle(
                                              color: MyThemeClass.whiteColor,
                                              fontSize: width * 0.05,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: width * 0.02),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: MyThemeClass.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: width * 0.001,
                          color: MyThemeClass.whiteColor,
                        ),
                        Container(
                          height: height * 0.04,
                          width: width,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.02),
                                  child: Container(
                                      child: Row(
                                    children: [
                                      Icon(
                                        Icons.card_travel,
                                        color: MyThemeClass.whiteColor,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: width * 0.05),
                                        child: Text(
                                          'Dark Mood',
                                          style: TextStyle(
                                            color: MyThemeClass.whiteColor,
                                            fontSize: width * 0.05,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: width * 0.02),
                                  child: LiteRollingSwitch(
                                    animationDuration:
                                      const  Duration(milliseconds: 800),
                                    colorOn: MyThemeClass.secoundryColor,
                                    colorOff: MyThemeClass.primaryColor,
                                    iconOff: Icons.power_settings_new,
                                    iconOn: Icons.check,
                                    onChanged: (bool state) {
                                      print('turned ${(state) ? 'Yes' : 'No'}');
                                    },
                                    onDoubleTap: (){},
                                    onSwipe: (){},
                                    onTap: (){},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: width * 0.001,
                          color: MyThemeClass.whiteColor,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RatingScreen()));
                          },
                          child: SizedBox(
                            height: height * 0.04,
                            width: width,
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: width * 0.02),
                                    child: Container(
                                        child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: MyThemeClass.whiteColor,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.05),
                                          child: Text(
                                            'Rate Us',
                                            style: TextStyle(
                                              color: MyThemeClass.whiteColor,
                                              fontSize: width * 0.05,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: width * 0.001,
                          color: MyThemeClass.whiteColor,
                        ),
                        InkWell(
                          onTap: () {
                            logout();

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => Loginscreen()),
                                (Route<dynamic> route) => false);

                            print('Data clear');
                          },
                          child: SizedBox(
                            height: height * 0.04,
                            width: width,
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: width * 0.02),
                                    child: Container(
                                        child: Row(
                                      children: [
                                        Icon(
                                          Icons.logout,
                                          color: MyThemeClass.whiteColor,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.05),
                                          child: Text(
                                            'Log Out',
                                            style: TextStyle(
                                              color: MyThemeClass.whiteColor,
                                              fontSize: width * 0.05,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: height * 0.13,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: height * 0.05,
                width: width * 0.95,
                decoration: BoxDecoration(
                    color: MyThemeClass.whiteColor,
                    borderRadius:const BorderRadius.all(Radius.circular(20))),
                child: Container(
                  height: height * 0.05,
                  width: width * 0.75,
                  decoration: BoxDecoration(
                    color: MyThemeClass.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: searchcontroller,
                      decoration:const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: ('Search'),
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.mic)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.23),
              child: Container(
                height: height * 0.2,
                width: width * 0.3,
                decoration:const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/profile.jpg')),
                    color: Colors.amber,
                    shape: BoxShape.circle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
