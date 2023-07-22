
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/mobile_app/model_classes/static_value.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../mobile_app/model_classes/order_modelclass.dart';
import '../../../them_data.dart';
import '../../mobile_admin_pannel/mobile_admin_singup.dart';

class CartProduct extends StatefulWidget {
  //const CartProduct({super.key});
static const String id="CartProduct";

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
   FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
 //List<ProductModel>productlist=[];
  List<OrderModelClas>orderlist=[];
getOrders()async{
  await firebaseFirestore.collection("Orders").where("adminid",isEqualTo: AdminStaticVeriable.uid).get().then((value) {
    value.docs.forEach((element) {
      setState(() {
        orderlist.add(OrderModelClas.fromMap(element.data()));
      });
    });
  });
      print("orders ${orderlist}");
      print("orders list length ${orderlist.length}"); 
}

//  List<RatingModelClass> ratinglist=[];
UpdateStatue(String id)async{
  try{
  await firebaseFirestore.collection("Orders").doc(id).update(
        {"status":"Delivered"}
       );
     Fluttertoast.showToast(
          msg: " Order Delivered Successfully",
          backgroundColor: Colors.green,
          fontSize: 16.0,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_SHORT,
        );
}  on FirebaseAuthException catch (e) {
     Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.red,
          fontSize: 16.0,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_SHORT,
        );
          
        
   }
}
CancelStatue(String id)async{
  try{
  await firebaseFirestore.collection("Orders").doc(id).update(
        {"status":"Cancelled"}
       );
     Fluttertoast.showToast(
          msg: " Order Cancel ",
          backgroundColor: Colors.red,
          fontSize: 16.0,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_SHORT,
        );
}  on FirebaseAuthException catch (e) {
     Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.red,
          fontSize: 16.0,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_SHORT,
        );
          
        
   }
}
  @override
  void initState() {
   // getRating();
    getOrders();
    // TODO: implement initState
    super.initState();
  }
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
        
          Expanded(
            child: Container(
              height: height,
              width: width,
              color: MyThemeClass.primaryColor,
              child: ListView.builder(
                itemCount: orderlist.length,
                itemBuilder: (context, index) {
                  return  orderlist[index].status == 'In Progress'?  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: height * 0.2,
                        //width: width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: MyThemeClass.transColor?.withOpacity(0.1),
                        ),
                        child: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Container(
                                    height: height * 0.23,
                                    width: width * 0.25,
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
                              ),
                              SizedBox(
                                height: height,
                                width: width * 0.27,
                                // color: Colors.green,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text('Casual Wear',
                                    //     style: TextStyle(
                                    //       color: Colors.white38,
                                    //       fontSize: width * 0.035,
                                    //     )),
                                    Text(
                                        '${orderlist[index].productname}',
                                        style: TextStyle(
                                          color: Colors.white,
                                        //  fontSize: width * 0.045,
                                          fontWeight: FontWeight.bold,
                                        )),
                                         Text(
                                        '${orderlist[index].serialcode}',
                                        style: TextStyle(
                                          color: Colors.white,
                                        //  fontSize: width * 0.045,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(
                                      height: height * 0.03,
                                      width: width,
                                      // color: Colors.yellow,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Color',
                                            style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                             // fontSize: width * 0.035,
                                              color: MyThemeClass.whiteColor,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: width * 0.01),
                                            child: Container(
                                              height: height * 0.02,
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
                                             // fontSize: width * 0.03,
                                            )),
                                        Text('1',
                                            style: TextStyle(
                                              color: Colors.white,
                                              //fontSize: width * 0.03,
                                            )),
                                      ],
                                    ),
                                    Text(
                                        '${orderlist[index].price}',
                                        style: TextStyle(
                                          color: Colors.white,
                                         // fontSize: width * 0.06,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: height,
                                  width: width*0.9,
                                  decoration: BoxDecoration(
                                    // color: Colors.red,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: height*0.1,
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
                                                //  fontSize: width * 0.04,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: height * 0.01),
                                              Text(
                                                'OrderID#',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                //  fontSize: width * 0.03,
                                                ),
                                              ),
                                              Text(
                                                '${orderlist[index].serialcode}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                //  fontSize: width * 0.03,
                                                ),
                                              ),
                                            ]),
                                      ),
                                      Container(
                                        height: height * 0.04,
                                        width: width*0.5,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15),
                                            )),
                                        child: Center(
                                          child:InkWell(
                                                      onTap: () {
                                                      UpdateStatue(orderlist[index].oid!);
                                                      print("orderid ${orderlist[index].oid}");
                                                      },
                                                      child: Text('Accept ',
                                                          style: TextStyle(
                                                         //   fontSize: width * 0.035,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )),
                                                    )
                                                
                                        ),
                                      ),
                                        Container(
                                        height: height * 0.04,
                                        width: width*0.5,
                                        decoration:  BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15),
                                            )),
                                        child: Center(
                                          child:
                                               
                                                   InkWell(
                                                      onTap: () {
                                                      
                                                        CancelStatue(orderlist[index].oid!);
                                                      },
                                                      child: Text('Cancel ',
                                                          style: TextStyle(
                                                            color: MyThemeClass.whiteColor,
                                                         //   fontSize: width * 0.035,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )),
                                                    )
                                                
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ):Container();
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}