// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ecommerece/conter_controller.dart';
import 'package:ecommerece/mobile_app/model_classes/homepage_modelclass.dart';
import 'package:ecommerece/placedorder.dart';
import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PaymentMethod extends StatefulWidget {
  HomePageModelClass model;
  PaymentMethod({Key? key, required this.model}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethoState();
}

class _PaymentMethoState extends State<PaymentMethod> {
  var height, width;
  @override
  void initState() {
    Get.put(ConterController());
    super.initState();
  }

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
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                            size: width * 0.06,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: width * 0.45),
                        child: Text(
                          'Cart',
                          style: TextStyle(
                            color: MyThemeClass.whiteColor,
                            fontSize: width * 0.06,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          SizedBox(height: height * 0.02),
          Container(
            height: height * 0.05,
            width: width,
            // color: Colors.red,
            child: Center(
              child: Text(
                'Choose Your Payment Method',
                style: TextStyle(
                  color: MyThemeClass.whiteColor,
                  fontSize: width * 0.06,
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Card(
            elevation: 5,
            color: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              height: height * 0.2,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: MyThemeClass.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: height * 0.05,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('images/visa.webp'))),
                        ),
                        Icon(
                          Icons.crop_3_2_rounded,
                          color: Colors.white,
                          size: width * 0.06,
                        ),
                      ],
                    ),
                    Text('**** **** **** 7895',
                        style: TextStyle(
                          color: MyThemeClass.whiteColor,
                          fontSize: width * 0.05,
                        )),
                    Text('7890',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: width * 0.04,
                        )),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Simon Alford',
                              style: TextStyle(
                                color: MyThemeClass.whiteColor,
                                fontSize: width * 0.04,
                              )),
                          Container(
                            width: width * 0.3,
                            // color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('VALID\nTILL',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white38,
                                      fontSize: width * 0.03,
                                    )),
                                Text('01/21',
                                    style: TextStyle(
                                      color: MyThemeClass.whiteColor,
                                      fontSize: width * 0.04,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Card(
            elevation: 5,
            color: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              height: height * 0.2,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: MyThemeClass.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: height * 0.06,
                          width: width * 0.2,
                          decoration:const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('images/download.png'))),
                        ),
                        Icon(
                          Icons.crop_3_2_rounded,
                          color: Colors.white,
                          size: width * 0.06,
                        ),
                      ],
                    ),
                    Text('**** **** **** 2344',
                        style: TextStyle(
                          color: MyThemeClass.whiteColor,
                          fontSize: width * 0.05,
                        )),
                    Text('5463',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: width * 0.04,
                        )),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Simon Alford',
                              style: TextStyle(
                                color: MyThemeClass.whiteColor,
                                fontSize: width * 0.04,
                              )),
                          Container(
                            width: width * 0.3,
                            // color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('VALID\nTILL',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white38,
                                      fontSize: width * 0.03,
                                    )),
                                Text('12/20',
                                    style: TextStyle(
                                      color: MyThemeClass.whiteColor,
                                      fontSize: width * 0.04,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.03),
          Card(
            elevation: 5,
            color: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              height: height * 0.05,
              width: width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyThemeClass.primaryColor,
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Add a card',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: width * 0.05,
                        )),
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: width * 0.07,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.03),
          Container(
            height: height * 0.06,
            width: width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: MyThemeClass.whiteColor,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Cash on Delivery',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        color: Colors.black,
                      )),
                  Icon(
                    Icons.check_box,
                    size: width * 0.07,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: height * 0.05),
          InkWell(
            onTap: () {
              if (ConterController.to.cartItemsList.length == 0) {
                print('length is zero');
                ConterController.to.addDataTOCart(widget.model);
              } else {
                ConterController.to.checkIfPresent(widget.model).then((value) {
                  if (value!.isPresent == true) {
                    print('update data');
                    ConterController.to
                        .updateDataToList(widget.model, value.index);
                  } else {
                    print('add item');
                    ConterController.to.addDataTOCart(widget.model);
                  }
                });
              }

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OrderPalced()));
            },
            child: Container(
              height: height * 0.06,
              width: width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyThemeClass.whiteColor,
              ),
              child: Center(
                child: Text('Place Order',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.05,
                      color: Colors.black,
                    )),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
