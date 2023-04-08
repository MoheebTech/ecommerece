import 'package:ecommerece/Orderdetail.dart';
import 'package:ecommerece/mobile_app/model_classes/order_modelclass.dart';
import 'package:ecommerece/mobile_app/pages/home.dart';
import 'package:ecommerece/mobile_app/pages/rating_screen.dart';
import 'package:flutter/material.dart';

import '../../them_data.dart';

class OrderClass extends StatefulWidget {
  @override
  State<OrderClass> createState() => _OrderClassState();
}

class _OrderClassState extends State<OrderClass> {

  @override
  Widget build(BuildContext context) {
   var height = MediaQuery.of(context).size.height;
  var  width = MediaQuery.of(context).size.width;
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
                        'Orders',
                        style: TextStyle(
                          color: MyThemeClass.whiteColor,
                          fontSize: width * 0.05,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(height: height * 0.01),
          SizedBox(
            height: height * 0.05,
            width: width,
            // color: Colors.amber,
            child: Center(
              child: Text('Your Orders',
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
              color: MyThemeClass.primaryColor,
              child: ListView.builder(
                itemCount: OrderModelClass.orderClass.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: height * 0.15,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: MyThemeClass.transColor?.withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: height * 0.2,
                              width: width * 0.3,
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        '${OrderModelClass.orderClass[index].image}')),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height,
                            width: width * 0.35,
                            // color: Colors.green,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Casual Wear',
                                    style: TextStyle(
                                      color: Colors.white38,
                                      fontSize: width * 0.035,
                                    )),
                                Text(
                                    '${OrderModelClass.orderClass[index].name}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.045,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(
                                  height: height * 0.02,
                                  width: width,
                                  // color: Colors.yellow,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Color',
                                        style: TextStyle(
                                          fontSize: width * 0.035,
                                          color: MyThemeClass.whiteColor,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: width * 0.01),
                                        child: Container(
                                          height: height * 0.03,
                                          width: width * 0.03,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.brown[900],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text('Amount:',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.03,
                                        )),
                                    Text('1',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.03,
                                        )),
                                  ],
                                ),
                                Text(
                                    '${OrderModelClass.orderClass[index].price}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.06,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: height,
                              width: width,
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: height,
                                      width: width,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${OrderModelClass.orderClass[index].status}',
                                              style: TextStyle(
                                                color: OrderModelClass
                                                            .orderClass[index]
                                                            .status ==
                                                        'Delivered'
                                                    ? Colors.green
                                                    : OrderModelClass
                                                                .orderClass[
                                                                    index]
                                                                .status ==
                                                            'In Progress'
                                                        ? Colors.orange
                                                        : Colors.red,
                                                fontSize: width * 0.04,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: height * 0.01),
                                            Text(
                                              'OrderID#',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.03,
                                              ),
                                            ),
                                            Text(
                                              '${OrderModelClass.orderClass[index].orderNo}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.03,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                  Container(
                                    height: height * 0.04,
                                    width: width,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                        )),
                                    child: Center(
                                      child: OrderModelClass
                                                  .orderClass[index].status ==
                                              'Delivered'
                                          ? InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            RatingScreen()));
                                              },
                                              child: Text('Rate Product',
                                                  style: TextStyle(
                                                    fontSize: width * 0.035,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            )
                                          : OrderModelClass.orderClass[index]
                                                      .status ==
                                                  'In Progress'
                                              ? InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                OrderDetails()));
                                                  },
                                                  child: Text('View Details',
                                                      style: TextStyle(
                                                        fontSize: width * 0.035,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                )
                                              : InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Home()));
                                                  },
                                                  child: Text('Order Again',
                                                      style: TextStyle(
                                                        fontSize: width * 0.035,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
