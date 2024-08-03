import 'package:ecommerece/mobile_app/home_page.dart';
import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';

class OrderPalced extends StatefulWidget {
  @override
  State<OrderPalced> createState() => _OrderPalcedState();
}

class _OrderPalcedState extends State<OrderPalced> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: MyThemeClass.primaryColor,
        child: Column(
          children: [
            Card(
              elevation: 5,
              color: Colors.black,
              child: Container(
                  height: height * 0.1,
                  width: width,
                  color: MyThemeClass.primaryColor,
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Order Placed',
                      style: TextStyle(
                        color: MyThemeClass.whiteColor,
                        fontSize: width * 0.06,
                      ),
                    ),
                  )),
            ),
            SizedBox(height: height * 0.1),
            Container(
              height: height * 0.09,
              width: width,
              // color: Colors.red,
              child: Center(
                child: Text('Woo Hoo!',
                    style: TextStyle(
                        color: MyThemeClass.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.15)),
              ),
            ),
            SizedBox(height: height * 0.01),
            Container(
              height: height * 0.04,
              width: width,
              // color: Colors.red,
              child: Center(
                child: Text('Order Placed',
                    style: TextStyle(
                        color: MyThemeClass.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.06)),
              ),
            ),
            SizedBox(height: height * 0.01),
            Container(
                height: height * 0.15,
                width: width * 0.4,
                decoration: BoxDecoration(
                  color: MyThemeClass.whiteColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    size: width * 0.2,
                  ),
                )),
            SizedBox(height: height * 0.01),
            Container(
              height: height * 0.04,
              width: width,
              // color: Colors.red,
              child: Center(
                child: Text('Order ID#143765',
                    style: TextStyle(
                        color: MyThemeClass.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.05)),
              ),
            ),
            SizedBox(height: height * 0.01),
            Container(
              height: height * 0.1,
              width: width,
              // color: Colors.red,
              child: Center(
                child: Text(
                    'Thanks! for using Shopflux,Your Order has\n'
                    'been placed successfully, our representative\n'
                    'will call you within next 24 hours for confirmation',
                    style: TextStyle(
                        color: MyThemeClass.whiteColor,
                        fontSize: width * 0.04)),
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
                height: height * 0.07,
                width: width * 0.5,
                decoration: BoxDecoration(
                  color: MyThemeClass.transColor?.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: Text('View Details',
                        style: TextStyle(
                          color: MyThemeClass.whiteColor,
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.bold,
                        )))),
            SizedBox(height: height * 0.1),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                  height: height * 0.07,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    color: MyThemeClass.whiteColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: Text('Continue Shopping',
                          style: TextStyle(
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.bold,
                          )))),
            ),
          ],
        ),
      ),
    );
  }
}
