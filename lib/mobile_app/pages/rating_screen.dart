import 'package:ecommerece/mobile_app/pages/cart.dart';
import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              color: MyThemeClass.primaryColor,
            ),
            Column(
              children: [
                Card(
                  elevation: 15,
                  color: Colors.black,
                  child: Container(
                    height: height * 0.07,
                    width: width,
                    color: Color(0xff42382E),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.02),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: MyThemeClass.whiteColor,
                                size: width * 0.07,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: width * 0.4),
                            child: Text(
                              'Review',
                              style: TextStyle(
                                  fontSize: width * 0.07,
                                  color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/okii.jpg'))),
                  height: height * 0.33,
                  width: width,
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Container(
                    height: height * 0.04,
                    width: width,
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Text(
                        'Monk Straps',
                        style: TextStyle(
                          fontSize: width * 0.06,
                          color: MyThemeClass.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: Container(
                    height: height * 0.04,
                    width: width,
                    // color: Colors.pink,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.02,
                      ),
                      child: Text(
                        '\$299',
                        style: TextStyle(
                            fontSize: width * 0.06,
                            color: MyThemeClass.whiteColor),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: Container(
                    height: height * 0.04,
                    width: width,
                    // color: Colors.green,
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Text(
                        'Details',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          color: MyThemeClass.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.02),
                  child: Container(
                    height: height * 0.03,
                    width: width,
                    // color: Colors.pink,
                    child: Text(
                      'Delivered on 14/07/20 in Auckland',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        color: MyThemeClass.whiteColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.04,
                  width: width,
                  // color: Colors.yellow,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: Row(
                      children: [
                        Text(
                          'Color Ordered',
                          style: TextStyle(
                            fontSize: width * 0.04,
                            color: MyThemeClass.whiteColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.03),
                          child: Container(
                            height: height * 0.04,
                            width: width * 0.04,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height * 0.03,
                  width: width,
                  // color: Colors.pink,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: Text(
                      'Amount: 1',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        color: MyThemeClass.whiteColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.05,
                  width: width,
                  // color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_border,
                        size: width * 0.08,
                        color: MyThemeClass.whiteColor,
                      ),
                      Icon(
                        Icons.star_border,
                        size: width * 0.08,
                        color: MyThemeClass.whiteColor,
                      ),
                      Icon(
                        Icons.star_border,
                        size: width * 0.08,
                        color: MyThemeClass.whiteColor,
                      ),
                      Icon(
                        Icons.star_border,
                        size: width * 0.08,
                        color: MyThemeClass.whiteColor,
                      ),
                      Icon(
                        Icons.star_border,
                        size: width * 0.08,
                        color: MyThemeClass.whiteColor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Container(
                    height: height * 0.13,
                    width: width * 0.85,
                    decoration: BoxDecoration(
                      color: MyThemeClass.transColor?.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Write a Review...',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
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
                              builder: (context) => CartScreen()));
                    },
                    child: Container(
                      height: height * 0.06,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                        color: MyThemeClass.whiteColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Submit Review',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: width * 0.045),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
