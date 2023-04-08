import 'package:ecommerece/Add_Card.dart';
import 'package:ecommerece/conter_controller.dart';
import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var height, width;
  @override
  void initState() {
    Get.put(ConterController());
    ConterController.to.totalall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GetBuilder<ConterController>(
        builder: (obj) {
          return Container(
              height: height,
              width: width,
              color: MyThemeClass.primaryColor,
              child: Column(children: [
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
                            Text(
                              'RIGEL',
                              style: TextStyle(
                                color: MyThemeClass.secoundryColor,
                                fontSize: width * 0.07,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: width * 0.02),
                              child: Icon(
                                Icons.shopping_bag,
                                color: MyThemeClass.whiteColor,
                                size: width * 0.06,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                SizedBox(height: height * 0.01),
                Container(
                  height: height * 0.05,
                  width: width,
                  // color: Colors.amber,
                  child: Center(
                    child: Text('Your Cart',
                        style: TextStyle(
                          color: MyThemeClass.whiteColor,
                          fontSize: width * 0.07,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Expanded(
                    child: Container(
                  height: height,
                  width: width,
                  child: obj.cartItemsList.isEmpty
                      ? Center(
                          child: Card(
                          elevation: 5,
                          color: Colors.black,
                          child: Text(
                            'No Item Add',
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ))
                      : ListView.builder(
                          itemCount: obj.cartItemsList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: height * 0.15,
                                width: width * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:
                                      MyThemeClass.transColor?.withOpacity(0.1),
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: height * 0.2,
                                          width: width * 0.3,
                                          decoration: BoxDecoration(
                                            // color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    '${obj.cartItemsList[index].images}')),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: height,
                                        width: width * 0.35,
                                        // color: Colors.green,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Casual Wear',
                                                style: TextStyle(
                                                  color: Colors.white38,
                                                  fontSize: width * 0.035,
                                                )),
                                            Text(
                                                '${obj.cartItemsList[index].name}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.045,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Container(
                                              height: height * 0.02,
                                              width: width,
                                              // color: Colors.yellow,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Color',
                                                    style: TextStyle(
                                                      fontSize: width * 0.035,
                                                      color: MyThemeClass
                                                          .whiteColor,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: width * 0.01),
                                                    child: Container(
                                                      height: height * 0.03,
                                                      width: width * 0.03,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: height * 0.04,
                                              width: width * 0.3,
                                              decoration: BoxDecoration(
                                                color: MyThemeClass.primaryColor
                                                    .withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      obj.decrement(
                                                          index,
                                                          obj
                                                              .cartItemsList[
                                                                  index]
                                                              .count,
                                                          obj
                                                              .cartItemsList[
                                                                  index]
                                                              .amount);
                                                      obj.totalall();
                                                    },
                                                    child: Container(
                                                      height: height * 0.06,
                                                      width: width * 0.06,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '-',
                                                          style: TextStyle(
                                                            fontSize:
                                                                width * 0.06,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      '${obj.cartItemsList[index].count}',
                                                      style: TextStyle(
                                                        fontSize: width * 0.06,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: MyThemeClass
                                                            .whiteColor,
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      obj.increment(
                                                          index,
                                                          obj
                                                              .cartItemsList[
                                                                  index]
                                                              .count,
                                                          obj
                                                              .cartItemsList[
                                                                  index]
                                                              .amount);
                                                      obj.totalall();
                                                    },
                                                    child: Container(
                                                      height: height * 0.06,
                                                      width: width * 0.06,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '+',
                                                          style: TextStyle(
                                                            fontSize:
                                                                width * 0.06,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: height,
                                          width: width,
                                          decoration: BoxDecoration(
                                            // color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: width * 0.02,
                                                bottom: height * 0.01),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height: height * 0.05,
                                                  width: width * 0.05,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'x',
                                                      style: TextStyle(
                                                        fontSize: width * 0.04,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${obj.cartItemsList[index].totalPrice}',
                                                  style: TextStyle(
                                                    fontSize: width * 0.055,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        MyThemeClass.whiteColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            );
                          },
                        ),
                )),
                Card(
                  elevation: 10,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                      height: height * 0.2,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        color: MyThemeClass.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: width * 0.02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delivery Address',
                                  style: TextStyle(
                                    color: MyThemeClass.whiteColor,
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: Colors.white38,
                                    fontSize: width * 0.05,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              'Simon Alfred',
                              style: TextStyle(
                                color: MyThemeClass.whiteColor,
                                fontSize: width * 0.04,
                              ),
                            ),
                            Text(
                              'House no# 731-D',
                              style: TextStyle(
                                color: MyThemeClass.whiteColor,
                                fontSize: width * 0.04,
                              ),
                            ),
                            Text(
                              'block-3,Street 61',
                              style: TextStyle(
                                color: MyThemeClass.whiteColor,
                                fontSize: width * 0.04,
                              ),
                            ),
                            Text(
                              'Houston,Taxes.',
                              style: TextStyle(
                                color: MyThemeClass.whiteColor,
                                fontSize: width * 0.04,
                              ),
                            ),
                            Text(
                              '+1 333 5687 3252',
                              style: TextStyle(
                                color: MyThemeClass.whiteColor,
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.black,
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
                                Text(
                                  'Items',
                                  style: TextStyle(
                                    color: MyThemeClass.whiteColor,
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${obj.cartItemsList.length}',
                                  style: TextStyle(
                                    color: Colors.white38,
                                    fontSize: width * 0.05,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Subtotal',
                                  style: TextStyle(
                                    color: MyThemeClass.whiteColor,
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${obj.totalprice}',
                                  style: TextStyle(
                                    color: Colors.white38,
                                    fontSize: width * 0.05,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tax & Fees',
                                  style: TextStyle(
                                    color: MyThemeClass.whiteColor,
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '\$10',
                                  style: TextStyle(
                                    color: Colors.white38,
                                    fontSize: width * 0.05,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delivery Charges',
                                  style: TextStyle(
                                    color: MyThemeClass.whiteColor,
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Free',
                                  style: TextStyle(
                                    color: Colors.white38,
                                    fontSize: width * 0.05,
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: height * 0.04,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                  color:
                                      MyThemeClass.transColor?.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text('Apply Voucher',
                                      style: TextStyle(
                                        color: MyThemeClass.whiteColor,
                                        fontSize: width * 0.04,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: height * 0.03,
                  width: width * 0.85,
                  // color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',
                          style: TextStyle(
                            color: MyThemeClass.whiteColor,
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold,
                          )),
                      Text('${obj.totalprice + 10}',
                          style: TextStyle(
                            color: MyThemeClass.whiteColor,
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddCardDetails()));
                  },
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MyThemeClass.whiteColor,
                    ),
                    child: Center(
                      child: Text('Checkout',
                          style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
              ]));
        },
      ),
    );
  }
}
