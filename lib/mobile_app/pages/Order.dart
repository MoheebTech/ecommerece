import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/mobile_app/Orderdetail.dart';
import 'package:ecommerece/mobile_app/model_classes/order_modelclass.dart';
import 'package:ecommerece/mobile_app/model_classes/static_value.dart';
import 'package:ecommerece/mobile_app/pages/home.dart';
import 'package:ecommerece/mobile_app/pages/rating_screen.dart';
import 'package:flutter/material.dart';

import '../../them_data.dart';

class OrderClass extends StatefulWidget {
  @override
  State<OrderClass> createState() => _OrderClassState();
}

class _OrderClassState extends State<OrderClass> {  
FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
 //List<ProductModel>productlist=[];
  List<OrderModelClas>orderlist=[];
getOrders()async{
  await firebaseFirestore.collection("Orders").where("id",isEqualTo: StaticDate.uid).get().then((value) {
    value.docs.forEach((element) {
      setState(() {
        orderlist.add(OrderModelClas.fromMap(element.data()));
      });
    });
  });
  print("orders ${orderlist}");
 print("orders list length ${orderlist.length}"); 
   }
 
  @override
    void initState() {
    getOrders();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
   var height = MediaQuery.of(context).size.height;
  var  width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:MyThemeClass.primaryColor ,
        leading: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: MyThemeClass.whiteColor,
                          size: width * 0.06,
                        ),
                      ),
        title: Text(
                        'Orders',
                        style: TextStyle(
                          color: MyThemeClass.whiteColor,
                          fontSize: width * 0.06,
                        ),
                      ),
      ),
        body:  WillPopScope(
        onWillPop: () async => false,
          child: Container(
                height: height,
                width: width,
                color: MyThemeClass.primaryColor,
                child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
              width: width,
              // color: Colors.amber,
              child: Center(
                child: Text('Your Orders Status',
                    style: TextStyle(
                      color: MyThemeClass.whiteColor,
                      fontSize: width * 0.05,
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
                  itemCount: orderlist.length,
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
                                      image: NetworkImage(
                                         "${orderlist[index].image![0]}")
                                         ),
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
                                      '${orderlist[index].productname}',
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
                                              color: orderlist[index].color=="white"? Colors.white : orderlist[index].color=="brown"? Colors.brown[900] :Colors.black,
                                             
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
                                      '${orderlist[index].price}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.04,
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
                                                '${orderlist[index].status}',
                                                style: TextStyle(
                                                  color: 
                                                           orderlist[index]
                                                              .status ==
                                                          'Delivered'
                                                      ? Colors.green
                                                      : orderlist[index].status ==
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
                                                '${orderlist[index].serialcode}',
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
                                        child:orderlist[index].status ==
                                                'Delivered'
                                            ? InkWell(
                                                onTap: () {
                                                  OrderModelClas ordermodel=OrderModelClas(
                                                    image: orderlist[index].image,
                                                    color: orderlist[index].color,
                                                    customername: orderlist[index].customername,
                                                    id: orderlist[index].id,
                                                    oid: orderlist[index].oid,
                                                    price: orderlist[index].price,
                                                    productname: orderlist[index].productname,
                                                    size: orderlist[index].size,
                                                    serialcode: orderlist[index].serialcode,
                                                    status: orderlist[index].status,
                                                    details: orderlist[index].details,
                                                    address: orderlist[index].address,
                                                    emailaddres: orderlist[index].emailaddres,
                                                    phonenumber: orderlist[index].phonenumber,
                                                    ordertime: orderlist[index].ordertime
                                                  );
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              RatingScreen(
                                                              ordermodel: ordermodel,
                                                              )));
                                                print("details ${orderlist[index].details}");
                                                },
                                                child: Text('Rate Product',
                                                    style: TextStyle(
                                                      fontSize: width * 0.035,
                                                      fontWeight: FontWeight.bold,
                                                    )),
                                              )
                                            : orderlist[index]
                                                        .status ==
                                                    'In Progress'
                                                ? InkWell(
                                                    onTap: () {
                                                      OrderModelClas ordermodels=OrderModelClas(
                                                    image: orderlist[index].image,
                                                    color: orderlist[index].color,
                                                    customername: orderlist[index].customername,
                                                    id: orderlist[index].id,
                                                    oid: orderlist[index].oid,
                                                    price: orderlist[index].price,
                                                    productname: orderlist[index].productname,
                                                    size: orderlist[index].size,
                                                    serialcode: orderlist[index].serialcode,
                                                    status: orderlist[index].status,
                                                    details: orderlist[index].details,
                                                    address: orderlist[index].address,
                                                    emailaddres: orderlist[index].emailaddres,
                                                    phonenumber: orderlist[index].phonenumber,
                                                    ordertime: orderlist[index].ordertime,
                                                    adminid: orderlist[index].adminid
                                                  );
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  OrderDetails(
                                                                    ordermodel:ordermodels ,
                                                                  )));
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
              ),
        ));
  }
}
