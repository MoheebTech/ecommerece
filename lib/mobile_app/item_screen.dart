import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/admin_pannel/admin_model/product_model.dart';
import 'package:ecommerece/mobile_app/model_classes/order_modelclass.dart';
import 'package:ecommerece/mobile_app/model_classes/slider_modelclass.dart';
import 'package:ecommerece/mobile_app/model_classes/static_value.dart';
import 'package:ecommerece/mobile_app/pages/color_and_size_select.dart';
import 'package:ecommerece/mobile_app/placedorder.dart';
import 'package:ecommerece/them_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

import 'model_classes/userModel.dart';

class ItemScreen extends StatefulWidget {
 ProductModel model;
ItemScreen({required this.model});
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  TextEditingController searchcontroller = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  int currentindex = 0;
  bool isfavourit = false;
  int ordernNo = 1;
  var uuid=Uuid().v4();


  // sized select method

var selecedsizedvalue;
int sizeoption=0;
void checkSizeoption(int index){
   sizeoption=index;
  }
// color select method
int optionselect=0;
  var selecedcolorname;
void checkoption(int index){
  optionselect=index;
}
//  select product colors
List<Map<String, dynamic>>colorselect=<Map<String, dynamic>>[
   <String,dynamic>{
    'title':'brown',
    'color':Colors.brown,
    'size':"S"

   },
  <String,dynamic>{
    'title':'white',
    'color':Colors.white,
    'size':"M"
   },
   <String,dynamic>{
    'title':'black',
    'color':Colors.black,
    'size':"L"
    
   }
];

  orderno() {
    setState(() {
      ordernNo = ordernNo++;
    });
  }
  // FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
     List<UserModel> userdetails=[];
     getuserdetails()async{
      await firebaseFirestore.collection("users").where("uid",isEqualTo: StaticDate.uid).get().then((value) {
      value.docs.forEach((element) {
        setState(() {
          UserModel model=UserModel();
       //   userdetails.add(UserModel.fromMap(element.data()));
        });
      });
      });
     }
  buyOrder() async {
    try {
      orderno();
      OrderModelClas ordermodel = OrderModelClas(
        id: StaticDate.uid,
        image: widget.model.imageUrls,
        productname: widget.model.productname,
        serialcode: widget.model.selerialCode,
        price: widget.model.price,
        color:  selecedcolorname,
        customername: StaticDate.usermodel.name,
        status: "In Progress",
        size: selecedsizedvalue,
        oid: uuid,
        details: widget.model.details,
        ordertime: DateTime.now().toString(),
        address: StaticDate.usermodel.address,
        emailaddres: StaticDate.usermodel.email,
        phonenumber: StaticDate.usermodel.name ,
        adminid: widget.model.adminid
      );
      await firebaseFirestore
          .collection("Orders").doc(uuid)
          .set(ordermodel.toMap());
      Fluttertoast.showToast(
        msg: " Your Order Successfully",
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
              builder: (context) => OrderPalced(
                 
                  )));
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.green,
        fontSize: 16.0,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
    //print("usermodel ${ordermodel.toString()}");
  }

  @override
  void initState() {
    getuserdetails();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        backgroundColor: MyThemeClass.primaryColor,
        elevation: 0,
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

       centerTitle: true,
       title: Text(
                            'Item',
                            style: TextStyle(
                              fontSize: width * 0.06,
                              color: MyThemeClass.whiteColor,
                            ),
                          ),
      ),
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            color: MyThemeClass.primaryColor,
          ),
          Column(
            children: [
  
              SizedBox(
                  height: height * 0.22,
                  width: width,
                  // color: Colors.red,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentindex = index;
                        });
                      },
                      aspectRatio: 2,
                      autoPlay: true,
                    ),
                    itemCount: widget.model.imageUrls?.length,
                    itemBuilder: (context, index, realIndex) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: height * 0.2,
                          width: width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      widget.model.imageUrls![index]))),
                        ),
                      );
                    },
                  )),
              SizedBox(
                  height: height * 0.04,
                  width: width,
                  // color: Colors.red,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: SliderClass.slider
                        .asMap()
                        .entries
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: currentindex == e.key
                                    ? BoxDecoration(
                                        color: MyThemeClass.whiteColor,
                                        shape: BoxShape.circle)
                                    : BoxDecoration(
                                        border: Border.all(
                                          width: width * 0.003,
                                          color: MyThemeClass.whiteColor,
                                        ),
                                        shape: BoxShape.circle),
                                height: height * 0.04,
                                width: width * 0.03,
                              ),
                            ))
                        .toList(),
                  )),
              SizedBox(
                height: height * 0.045,
                width: width,
                // color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Text(
                        widget.model.productname!,
                        style: TextStyle(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.bold,
                          color: MyThemeClass.whiteColor,
                        ),
                      ),
                    ),

                    /// // favourit items

                    Padding(
                      padding: EdgeInsets.only(right: width * 0.02),
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: isfavourit == false
                              ? MyThemeClass.whiteColor
                              : MyThemeClass.redColor,
                        ),
                        onPressed: () {
                          setState(() {
                            isfavourit = true;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
                width: width,
                // color: Colors.yellow,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ),
                    const Icon(Icons.star, color: Colors.yellow),
                    const Icon(Icons.star, color: Colors.yellow),
                    const Icon(Icons.star, color: Colors.yellow),
                    Icon(
                      Icons.star_border,
                      color: MyThemeClass.whiteColor,
                    ),
                    Text(
                      '4.0  (73 reviews)',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        color: MyThemeClass.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: SizedBox(
                  height: height * 0.045,
                  width: width,
                  // color: Colors.pink,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: Text(
                      '\$${widget.model.price}',
                      style: TextStyle(
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.bold,
                        color: MyThemeClass.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.02),
                child: SizedBox(
                  height: height * 0.03,
                  width: width,
                  // color: Colors.green,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: Text(
                      'Details',
                      style: TextStyle(
                        fontSize: width * 0.05,
                        color: MyThemeClass.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.02),
                child: SizedBox(
                  height: height * 0.06,
                  width: width,
                  // color: Colors.pink,
                  child: Text(
                    widget.model.details!,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: width * 0.039,
                      color: MyThemeClass.whiteColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: SizedBox(
                  height: height * 0.04,
                  width: width,
                  // color: Colors.yellow,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: Text(
                      'Select Color',
                      style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: MyThemeClass.whiteColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.06,
                width: width,
                // color: Colors.red,
                child: ListView(
                  scrollDirection: Axis.horizontal,

                  // crossAxisCount: 7,
                  // crossAxisSpacing: 10,
                  children: [
                      for(int i=0; i<colorselect.length;i++)Colorselect(
                          
                        title: colorselect[i]['title'] as String,
                        color: colorselect[i]['color'],
                        onTap: (){
                           selecedcolorname=colorselect[i]['title'] ;
                          checkoption(i+1);
                          print( " color title ${colorselect[i]['title'] as String}");
                        //  var selecedcolorname=colorselect[i]['title'] as String;
                          
                        },
                        selected: i+1==optionselect,

                      )
                   
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.02),
                child: SizedBox(
                  height: height * 0.03,
                  width: width,
                  // color: Colors.pink,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: Text(
                      'Select Size ( UK Size )',
                      style: TextStyle(
                          fontSize: width * 0.04,
                          color: MyThemeClass.whiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.06,
                width: width,
                // color: Colors.red,
                child:  ListView(
                  scrollDirection: Axis.horizontal,
                  
                  // crossAxisCount: 7,
                  // crossAxisSpacing: 10,
                children: [
                     for(int i=0; i<colorselect.length;i++)SelectSized(
                        
                      sizes: colorselect[i]['size'] as String,
                      onTap: (){
                         selecedsizedvalue=colorselect[i]['size'] ;
                        checkSizeoption(i+1);
                        print( " size name ${colorselect[i]['size'] as String}");
                        
                      },
                      selected: i+1==sizeoption,

                    )
                ],
              ),
          
              ),
              InkWell(
                onTap: () {
                  buyOrder();
                },
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.015),
                  child: Container(
                    decoration: BoxDecoration(
                        color: MyThemeClass.whiteColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                    height: height * 0.06,
                    width: width * 0.6,
                    child: Center(
                      child: Text(
                        'Buy Order',
                        style: TextStyle(
                            color: MyThemeClass.secoundryColor,
                            fontSize: width * 0.04),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
