import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/mobile_app/model_classes/rating_model.dart';
import 'package:flutter/material.dart';
import '../../../mobile_app/model_classes/order_modelclass.dart';
import '../../../them_data.dart';
import '../../admin_model/product_model.dart';
import '../../mobile_admin_pannel/mobile_admin_singup.dart';

class Dashboard extends StatefulWidget {
  //const Dashboard({super.key});
  static const String id="Dashboard";
  @override
  State<Dashboard> createState() => _DashboardState();

}

class _DashboardState extends State<Dashboard> {
  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
 //List<ProductModel>productlist=[];
  List<OrderModelClas>orderlist=[];
getOrders()async{
  await getRating();
  await firebaseFirestore.collection("Orders").where("adminid",isEqualTo: AdminStaticVeriable.uid).get().then((value) {
    value.docs.forEach((element) {
      setState(() {
        orderlist.add(OrderModelClas.fromMap(element.data()));
      });
    });
    }
   );
      print("orders ${orderlist}");
      print("orders list length ${orderlist.length}"); 
}
 List<RatingModelClass> ratinglist=[];
getRating()async{
  await firebaseFirestore.collection("reviews").get().then((value) {
    value.docs.forEach((element) {
      setState(() {
        ratinglist.add(RatingModelClass.fromMap(element.data()));
      });
    });
  });
      print("orders ${orderlist}");
      print("orders list length ${orderlist.length}"); 
}
  @override
  void initState() {
    getRating();
    getOrders();
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
                  return orderlist[index].status !='In Progress' ?Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: MyThemeClass.transColor?.withOpacity(0.1),
                        ),
                        child:Expanded(
                          child:Row(
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
                                             padding:EdgeInsets.only(left: width * 0.01),
                                            child: Container(
                                              height: height * 0.02,
                                              width: width * 0.03,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: orderlist[index].color=="white"? Colors.white :
                                                 orderlist[index].color=="brown"? Colors.brown[900] :Colors.black,
                                               
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
                                        height: height*0.12,
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
                                            orderlist[index].status=="Delivered"?  Expanded(
                                              child: Container(
                                              //  height:height*0.08,
                                                child: ratinglist[index].oid==orderlist[index].oid? Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                   Text(
                                                    ' Rating ${ratinglist[index].rating}',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    //  fontSize: width * 0.03,
                                                    ),
                                                  ),
                                                   Icon(Icons.star,color: Colors.amber.shade800,),   
                                                 ] ):Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                  Text(
                                                    'No Rating',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    //  fontSize: width * 0.03,
                                                    ),
                                                  ), 
                                                   Icon(Icons.star,color: Colors.white,),   
                                                 ] ),
                                              ),
                                            ):Container()
                                            ]),
                                      ),
                                      Container(
                                        height: height * 0.05,
                                        width: width*0.5,
                                        decoration:  BoxDecoration(
                                            color: orderlist[index].status ==
                                                  'Delivered'?Colors.white:Colors.red,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15),
                                            )),
                                        child: Center(
                                          child:orderlist[index].status ==
                                                  'Delivered'
                                              ? InkWell(
                                                  onTap: () {
                                                    // Navigator.push(
                                                    //     context,
                                                    //     MaterialPageRoute(
                                                    //         builder: (context) =>
                                                    //             RatingScreen(
                                                    //             ordermodel: ordermodel,
                                                    //             )));
                                                  print("details ${orderlist[index].details}");
                                                  },
                                                  child: Text('Recieved',
                                                      style: TextStyle(
                                                       // fontSize: width * 0.035,
                                                        fontWeight: FontWeight.bold,
                                                      )),
                                                )
                                              : InkWell(
                                                      onTap: () {
                                                      },
                                                      child: Text('Cancel',
                                                          style: TextStyle(
                                                            color: MyThemeClass.whiteColor,
                                                            // fontSize: width *
                                                            //  0.035,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )
                                                          ),
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