import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/mobile_app/model_classes/order_modelclass.dart';
import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderDetails extends StatefulWidget {
  OrderModelClas ordermodel;
  OrderDetails({required this.ordermodel});
  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
            height: height*0.9,
            child: ListView.builder(
              itemCount: 1,
            itemBuilder: (context, index){
                return Container(
                    height: height,
                    width: width,
                color: MyThemeClass.primaryColor,
                    child: Column(
                children: [
                  Card(
                    elevation: 5,
                    color: Colors.black,
                    child: Container(
                        height: height * 0.06,
                        width: width,
                        color: MyThemeClass.primaryColor,
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
                                  size: width * 0.06,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: width * 0.35),
                              child: Text(
                                'Order Details',
                                style: TextStyle(
                                  color: MyThemeClass.whiteColor,
                                  fontSize: width * 0.06,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    decoration:  BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("${widget.ordermodel.image![0]}"))),
                    height: height * 0.3,
                    width: width,
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    height: height * 0.05,
                    width: width,
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Text(
                        '${widget.ordermodel.productname}',
                        style: TextStyle(
                          fontSize: width * 0.07,
                          color: MyThemeClass.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.04,
                    width: width,
                    // color: Colors.pink,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.02,
                      ),
                      child: Text(
                        '${widget.ordermodel.price}',
                        style: TextStyle(
                            fontSize: width * 0.07, color: MyThemeClass.whiteColor),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    height: height * 0.05,
                    width: width,
                    // color: Colors.yellow,
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Row(
                        children: [
                          Text(
                            'Color Ordered',
                            style: TextStyle(
                              fontSize: width * 0.05,
                              color: MyThemeClass.whiteColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.03),
                            child:widget.ordermodel.color=="brown"? Container(
                              height: height * 0.04,
                              width: width * 0.04,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.brown ,
                              ),
                            ):widget.ordermodel.color=="black"? Container(
                              height: height * 0.04,
                              width: width * 0.04,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black ,
                              ),
                            ): Container(
                              height: height * 0.04,
                              width: width * 0.04,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white ,
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.04,
                    width: width,
                    // color: Colors.pink,
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Text(
                        'Amount: 1',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          color: MyThemeClass.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    height: height * 0.11,
                    width: width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MyThemeClass.transColor?.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Placed ',
                            style: TextStyle(
                              fontSize: width * 0.05,
                              color: MyThemeClass.whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${widget.ordermodel.address}',
                            style: TextStyle(
                              fontSize: width * 0.04,
                              color: MyThemeClass.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    height: height * 0.11,
                    width: width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MyThemeClass.transColor?.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Moved from Warehouse',
                            style: TextStyle(
                              fontSize: width * 0.05,
                              color: MyThemeClass.whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'the item was moved from Warehouse to\n the head Office',
                            style: TextStyle(
                              fontSize: width * 0.04,
                              color: MyThemeClass.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    height: height * 0.11,
                    width: width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MyThemeClass.transColor?.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipping in Progress',
                            style: TextStyle(
                              fontSize: width * 0.05,
                              color: MyThemeClass.whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'The item was handed over to the\n shipping company on 18/8/21',
                            style: TextStyle(
                              fontSize: width * 0.04,
                              color: MyThemeClass.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                    ),
                  );
              }
            ),
          )),
    );
  }
}
