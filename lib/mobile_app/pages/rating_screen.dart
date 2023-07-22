import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/mobile_app/model_classes/order_modelclass.dart';
import 'package:ecommerece/mobile_app/model_classes/rating_model.dart';
import 'package:ecommerece/mobile_app/model_classes/static_value.dart';
import 'package:ecommerece/mobile_app/pages/cart.dart';
import 'package:ecommerece/them_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RatingScreen extends StatefulWidget {
  OrderModelClas ordermodel;
  RatingScreen({required this.ordermodel});
  //ProductModel model;
  //ItemScreen({required this.model});
  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  TextEditingController reviewcontro = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  var height, width;
  int ratingindex = 0;
  // postreview
  postreview() async {
    try{
    RatingModelClass ratingmodel = RatingModelClass(
      ProductImage: widget.ordermodel.image,
      customerid: widget.ordermodel.id,
      customername: widget.ordermodel.customername,
      oid: widget.ordermodel.oid,
      details: widget.ordermodel.details,
      price: widget.ordermodel.price,
      productcolor: widget.ordermodel.color,
      productname: widget.ordermodel.productname,
      rating: ratingindex,
      review: reviewcontro.text,
      serialcode: widget.ordermodel.serialcode,
      status: widget.ordermodel.status,
      delivereddate: DateTime.now().toString(),
      reviewtime: DateTime.now().toString(),
      adminid: widget.ordermodel.adminid
    );
    await firebaseFirestore
        .collection("reviews")
        .doc(widget.ordermodel.oid)
        .set(ratingmodel.toMap());
  Fluttertoast.showToast(
          msg: " Thanks For Rating",
          backgroundColor: Colors.green,
          fontSize: 16.0,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_SHORT,
        );
        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                               CartScreen(
                                 ordermodel: widget.ordermodel,
                              )));
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
  /// rating funtion
  //int ratingindex = 0;
  ratingvalue(v) {
    setState(() {
      ratingindex = v;
    });
  }
  
  @override
  void initState() {
    // setState(() {
    // ratingvalue();
    // });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                          image:
                              NetworkImage("${widget.ordermodel.image![0]}"))),
                  height: height * 0.32,
                  width: width,
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: Container(
                    height: height * 0.025,
                    width: width,
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Text(
                        'Product :${widget.ordermodel.productname}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          //  fontSize: width * 0.05,
                          color: MyThemeClass.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: Container(
                    height: height * 0.025,
                    width: width,
                    // color: Colors.pink,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.02,
                      ),
                      child: Text(
                        'Price :${widget.ordermodel.price}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            // fontSize: width * 0.05,
                            color: MyThemeClass.whiteColor),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: Container(
                    height: height * 0.025,
                    width: width,
                    // color: Colors.green,
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Text(
                        'SerailCode :${widget.ordermodel.serialcode}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // fontSize: width * 0.04,
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
                    // color: Colors.green,
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.01),
                      child: Text(
                        'Details :${widget.ordermodel.details}',
                        style: TextStyle(
                          //  fontWeight: FontWeight.bold,
                          // fontSize: width * 0.05,
                          color: MyThemeClass.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.02, top: height * 0.01),
                  child: Container(
                    height: height * 0.03,
                    width: width,
                    // color: Colors.pink,

                    ///???????????? date and time set
                    child: Text(
                      'Delivered on 14/07/20 in Auckland',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        //  fontSize: width * 0.04,
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
                          'Color Ordered :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
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
                              color: widget.ordermodel.color == "brown"
                                  ? Colors.brown[900]
                                  : widget.ordermodel.color == "white"
                                      ? Colors.white
                                      : Colors.black,
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
                        fontWeight: FontWeight.bold,
                        color: MyThemeClass.whiteColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.03,
                  width: width,
                  // color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          ratingvalue(1);
                        },
                        child: Icon(
                          Icons.star_border,
                          size: width * 0.08,
                          color: ratingindex == 0
                              ? MyThemeClass.whiteColor
                              : MyThemeClass.greenColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ratingvalue(2);

                          print("ratingindex${ratingindex}");
                        },
                        child: Icon(
                          Icons.star_border,
                          size: width * 0.08,
                          color: ratingindex < 2
                              ? MyThemeClass.whiteColor
                              : MyThemeClass.greenColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ratingvalue(3);

                          print("ratingindex${ratingindex}");
                        },
                        child: Icon(
                          Icons.star_border,
                          size: width * 0.08,
                          color: ratingindex < 3
                              ? MyThemeClass.whiteColor
                              : MyThemeClass.greenColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ratingvalue(4);
                          print("ratingindex${ratingindex}");
                        },
                        child: Icon(
                          Icons.star_border,
                          size: width * 0.08,
                          color: ratingindex < 4
                              ? MyThemeClass.whiteColor
                              : MyThemeClass.greenColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ratingvalue(5);
                          print("ratingindex${ratingindex}");
                        },
                        child: Icon(
                          Icons.star_border,
                          size: width * 0.08,
                          color: ratingindex < 5
                              ? MyThemeClass.whiteColor
                              : MyThemeClass.greenColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: reviewcontro,
                      cursorColor: MyThemeClass.whiteColor,
                      style: TextStyle(color: MyThemeClass.whiteColor),
                      maxLines: 2,
                      decoration: InputDecoration(
                          hintText: 'Write a Review...',
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.white),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15.0)),
                          filled: true,
                          // prefixIcon: prefixIcon,
                          //suffix: suffixIcon,
                          fillColor: MyThemeClass.lightsecoundryColor,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15.0))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: InkWell(
                    onTap: () {
                      postreview();
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
