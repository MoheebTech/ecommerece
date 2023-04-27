import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import 'Payment_method.dart';

class AddCardDetails extends StatefulWidget {
  @override
  State<AddCardDetails> createState() => _AddCardDetailsState();
}

class _AddCardDetailsState extends State<AddCardDetails> {
  TextEditingController cardnamecontroller = TextEditingController();
  TextEditingController cardnocontroller = TextEditingController();
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
                          padding: EdgeInsets.only(right: width * 0.35),
                          child: Text(
                            'Add Card',
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
                  'Add your Card',
                  style: TextStyle(
                    color: MyThemeClass.whiteColor,
                    fontSize: width * 0.07,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              height: height * 0.04,
              width: width * 0.9,
              // color: Colors.red,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Card Details',
                  style: TextStyle(
                    color: MyThemeClass.whiteColor,
                    fontSize: width * 0.05,
                  ),
                ),
              ),
            ),
            Container(
              height: height * 0.07,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: MyThemeClass.transColor?.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.02),
                child: TextFormField(
                  controller: cardnamecontroller,
                  decoration: InputDecoration(
                    hintText: ('Name on Card'),
                    hintStyle: TextStyle(
                      color: Colors.white38,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              height: height * 0.07,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: MyThemeClass.transColor?.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.02),
                child: TextFormField(
                  controller: cardnocontroller,
                  decoration: InputDecoration(
                    hintText: ('Card Number'),
                    hintStyle: TextStyle(
                      color: Colors.white38,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Container(
              height: height * 0.1,
              width: width * 0.9,
              // color: Colors.red,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height * 0.04,
                        width: width * 0.35,
                        // color: Colors.green,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: width * 0.01),
                            child: Text(
                              'Expiry Date',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyThemeClass.whiteColor,
                                  fontSize: width * 0.04),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: height * 0.04,
                        width: width * 0.35,
                        // color: Colors.green,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: width * 0.06),
                            child: Text(
                              'CVV',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyThemeClass.whiteColor,
                                  fontSize: width * 0.04),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height * 0.06,
                        width: width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MyThemeClass.transColor?.withOpacity(0.1),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: width * 0.03),
                            child: Text(
                              '00/00',
                              style: TextStyle(
                                  color: MyThemeClass.whiteColor,
                                  fontSize: width * 0.04),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: height * 0.06,
                          width: width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: MyThemeClass.transColor?.withOpacity(0.1),
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: width * 0.03),
                              child: Icon(
                                Icons.card_membership,
                                color: MyThemeClass.whiteColor,
                                size: width * 0.06,
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            Container(
              height: height * 0.05,
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
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.05),
                            child: Text(
                              'Save my Card details',
                              style: TextStyle(
                                color: MyThemeClass.whiteColor,
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.02),
                      child: LiteRollingSwitch(
                        animationDuration: Duration(milliseconds: 800),
                        colorOn: MyThemeClass.secoundryColor,
                        colorOff: MyThemeClass.primaryColor,
                        iconOff: Icons.power_settings_new,
                        iconOn: Icons.check,
                        onChanged: (bool state) {
                          print('turned ${(state) ? 'Yes' : 'No'}');
                        },
                         onTap: (){},
                          onDoubleTap: (){},
                          onSwipe: (){},
                        //  onChanged: onChanged
                         )
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.1),
            Card(
              elevation: 5,
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: height * 0.05,
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyThemeClass.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: width * 0.06,
                    ),
                    Text('Secure Payment',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: width * 0.05,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.1),
            InkWell(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => PaymentMethod()));
              },
              child: Container(
                height: height * 0.06,
                width: width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyThemeClass.whiteColor,
                ),
                child: Center(
                  child: Text('Add',
                      style: TextStyle(
                        fontSize: width * 0.05,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
