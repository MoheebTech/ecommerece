import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/admin_pannel/admin_model/product_model.dart';
import 'package:ecommerece/mobile_app/pages/cart.dart';
import 'package:ecommerece/mobile_app/pages/catagries.dart';
import 'package:ecommerece/mobile_app/item_screen.dart';
import 'package:ecommerece/mobile_app/pages/new_arrivals.dart';
import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchcontroller = TextEditingController();
   FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
 bool leading=true;
 final imagepicker=ImagePicker();
 List<XFile> image=[];
  List<dynamic> imageUrls=[];
    
  //         getProducts() async {
  //           QuerySnapshot snapshot=await  FirebaseFirestore.instance.collection("Products").get();
  //           snapshot.docs.forEach((doc) {
  //     productlist.add(ProductModel.fromMap(doc.data()as Map<String, dynamic>)); 
  // });
  //    print('productlist: ${productlist}');
  //    setState(() {
  //      leading=true;
  //    });
  // }
   List<ProductModel>productlist=[];
   getProducts() async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("Products").get();
  snapshot.docs.forEach((doc) {
    // for(var item in doc[imageUrls]){
    //   if(item.isNotEmpty){
 setState(() {
            productlist.add(ProductModel.fromMap(doc.data() as Map<String, dynamic>)); 
      });
   // }
     // }
  });
  print('productlist: $productlist');








  // productlist[doc].imageUrls
//  List<String> stringList = productlist.map((element) => element.toString()).toList();
  // Converts the dynamic productlist to a string list
  
 // print('stringList: $stringList');
   //  String splitvalue=stringList[]
  setState(() {
    leading = true;
  });
}
    // getProduct() async {
    //     FirebaseFirestore.instance.collection("Products").get().then((value) {
    //      value.docs.forEach((element) {
    //      setState(() {
    //       print("image urls"+ element["imageUrls"]);
    //      });
    //      });
    //     });
    // }  
  // deleteDataSf() async {
  @override
  void initState() {
   // getProduct();
    setState(() {
      leading=false;
    });
    getProducts();
 //   getuser();
  //   print("list ${productlist}");
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
   var height = MediaQuery.of(context).size.height;
   var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:  Stack(
                children: [
                  Container(
                    height: height,
                    width: width,
                    color: MyThemeClass.primaryColor,
                  ),
                  SizedBox(
                    height: height,
                    width: width,
                    child: Column(
                      children: [
                        Card(
                          elevation: 5,
                          color: MyThemeClass.primaryColor,
                          child: SizedBox(
                          height: height * 0.1,
                          width: width,
                          child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.35),
                                  child: Container(
                                    height: height,
                                    width: width * 0.25,
                                    alignment: Alignment.bottomCenter,
                                    // color: Colors.red,
                                    child: Text(
                                      'RIGEL',
                                      style: TextStyle(
                                          fontSize: width * 0.09,
                                          color: MyThemeClass.secoundryColor),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: width * 0.02),
                                  child: InkWell(
                                    // onTap: () {
                                    //   deleteDataSf();
          
                                    //   Navigator.of(context).pushAndRemoveUntil(
                                    //       MaterialPageRoute(
                                    //           builder: (context) => Loginscreen()),
                                    //       (Route<dynamic> route) => false);
          
                                    //   print('Data clear');
                                    // },
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => CartScreen()));
                                      },
                                      child: Icon(
                                        Icons.shopping_bag,
                                        size: width * 0.07,
                                        color: MyThemeClass.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Container(
                          height: height * 0.06,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                              color: MyThemeClass.transColor?.withOpacity(0.1),
                              borderRadius: const BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: searchcontroller,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  hintText: ('Search'),
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  border: InputBorder.none,
                                  suffixIcon: Icon(
                                    Icons.mic,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.03),
                          child: SizedBox(
                            height: height * 0.03,
                            width: width * 0.9,
                            // color: Colors.green,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.02),
                                  child: Text(
                                    'New Arrival',
                                    style: TextStyle(
                                      fontSize: width * 0.05,
                                      color: MyThemeClass.whiteColor,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => NewArrival(
                                                  heading: "New Arrival",
                                                )));
                                  },
                                  child: Text(
                                    'See more >',
                                    style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: MyThemeClass.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                       
                        Padding(
                          padding:
                              EdgeInsets.only(top:height * 0.02, left: width * 0.05),
                          child: Container(
                            height: height * 0.31,
                            width: width,
                            color:const Color(0xff42382E),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                               itemCount: productlist.length,
                                itemBuilder: (context, index) {
                                    print("https://firebasestorage.googleapis.com/v0/b/lundaapp.appspot.com/o/image%2Fkeybord.jpg?alt=mdia&token=54928902-a5a3-4da8-942a-17ed17ce6d53"
                                      //"https://firebasestorage.googleapis.com/v0/b/lundaapp.appspot.com/o/image%2Fkeybord.jpg?alt=media&token = ${productlist[index].id}"
                                      );
                                  ///  print("length"+productlist.length.toString());
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: height,
                                      width: width * 0.45,
                                      decoration: BoxDecoration(
                                        color:
                                            MyThemeClass.transColor?.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: 
                                     leading==false?Center(child: CircularProgressIndicator()):
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 8.0, top: 8.0),
                                            child: SizedBox(
                                              height: height * 0.23,
                                              width: width * 0.9,
                                              child: Column(
                                                children:[
                                                
                                                Container(
                                                  height: height * 0.14,
                                                  width: width,
                                                  decoration: BoxDecoration(
                                                  //  color: Colors.black26,
                                                    borderRadius:
                                                        BorderRadius.circular(15),
                                                   image: DecorationImage(
                                                       fit: BoxFit.cover,
                                                     image: NetworkImage(
                                                  "${productlist[index].imageUrls}",scale: 1)
                                                    
                                                     ),
                                                     
                                                  ),
                                    //             child:  Image.network(
                                    //  '${productlist[0].imageUrls}',
                                    //         //         height: 100,
                                    //         // width: 100,
                                    //               fit: BoxFit.cover,
                                    //          ),
                                    //             ),)
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: height * 0.01),
                                                  child: Container(
                                                      height: height * 0.03,
                                                      width: width,
                                                      child: Text(productlist[index].productname!,
                                                      //  '${snapshot.data!.docs[index].get('productname')}',
                                                        style: TextStyle(
                                                          fontSize: width * 0.04,
                                                          color:
                                                              MyThemeClass.whiteColor,
                                                        ),
                                                      )),
                                                ),
                                                Container(
                                                    height: height * 0.035,
                                                    width: width,
                                                    child: Text(
                                                      '${productlist[index].price}',
                                                      style: TextStyle(
                                                        fontSize: width * 0.05,
                                                        color: MyThemeClass.whiteColor,
                                                      ),
                                                    )),
                                              ]),
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              height: height,
                                              width: width,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 8.0),
                                                    child: SizedBox(
                                                      height: height,
                                                      width: width * 0.2,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Colors',
                                                            style: TextStyle(
                                                              color: MyThemeClass
                                                                  .whiteColor,
                                                              fontSize: width * 0.035,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              height: height * 0.04,
                                                              width: width * 0.1,
                                                              decoration:const BoxDecoration(
                                                                  // color: Colors.red,
                                                                  borderRadius:
                                                                      BorderRadius.only(
                                                                bottomLeft:
                                                                    Radius.circular(15),
                                                              )),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    height:
                                                                        height * 0.035,
                                                                    width:
                                                                        width * 0.035,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color: Colors
                                                                          .brown[900],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        height * 0.035,
                                                                    width:
                                                                        width * 0.035,
                                                                    decoration:
                                                                      const  BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color:
                                                                          Colors.black,
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
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                        ProductModel model=ProductModel(
                                                      price: productlist[index].price,
                                                      brand: productlist[index].brand,
                                                      category: productlist[index].category,
                                                      details: productlist[index].details,
                                                      discountprice: productlist[index].discountprice,
                                                      imageUrls: productlist[index].imageUrls,
                                                      isFavourit: productlist[index].isFavourit,
                                                      isOnSale: productlist[index].isOnSale,
                                                      isPopular: productlist[index].isPopular,
                                                      productname: productlist[index].productname,
                                                      selerialCode: productlist[index].selerialCode
      
                                                        );
                                                        // HomePageModelClass model =
                                                        //     HomePageModelClass(
                                                        //   amount: HomePageModelClass
                                                        //       .homePageModelClass[index]
                                                        //       .amount,
                                                        //   count: 1,
                                                        //   images: HomePageModelClass
                                                        //       .homePageModelClass[index]
                                                        //       .images,
                                                        //   name: HomePageModelClass
                                                        //       .homePageModelClass[index]
                                                        //       .name,
                                                        //   totalPrice: HomePageModelClass
                                                        //       .homePageModelClass[index]
                                                        //       .amount,
                                                        // );
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    ItemScreen(
                                                                      model: model,
                                                                    )));
                                                      },
                                                      child: Container(
                                                        height: height,
                                                        width: width,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                MyThemeClass.whiteColor,
                                                            borderRadius:
                                                                const BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(15),
                                                              bottomRight:
                                                                  Radius.circular(15),
                                                            )),
                                                        child: Center(
                                                          child: Text('Add to cart',
                                                              style: TextStyle(
                                                                fontSize: width * 0.04,
                                                              )),
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
                                  );
                                }),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.02),
                          child: SizedBox(
                            height: height * 0.032,
                            width: width * 0.9,
                            // color: Colors.green,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Categories',
                                  style: TextStyle(
                                    fontSize: width * 0.05,
                                    color: MyThemeClass.whiteColor,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CatagriesScreen()));
                                  },
                                  child: Text(
                                    'View All >',
                                    style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: MyThemeClass.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Expanded(
                          child: Container(
                            height: height,
                            width: width,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: height * 0.01,
                                  left: width * 0.05,
                                  bottom: height * 0.01,
                                  right: width * 0.05),
                              child: ListView(
                                children: [

                                 // Image.network("${productlist[0].imageUrls}"),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => NewArrival(
                                                    heading: "Casual Wear",
                                                  )));
                                    },
                                    child: Card(
                                      elevation: 3,
                                      color: MyThemeClass.primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15)),
                                      child: Container(
                                        height: height * 0.08,
                                        width: width * 0.95,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image:const DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage('images/boots.jpg'))),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: height,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: MyThemeClass.primaryColor
                                                      .withOpacity(0.7)),
                                            ),
                                            Container(
                                              height: height,
                                              width: width,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: width * 0.02),
                                                    child: Text(
                                                      'Casual Wear',
                                                      style: TextStyle(
                                                          fontSize: width * 0.08,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.white,
                                                    size: width * 0.08,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  ////////////////
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => NewArrival(
                                                    heading: "Boots",
                                                  )));
                                    },
                                    child: Card(
                                      elevation: 3,
                                      color: MyThemeClass.primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15)),
                                      child: Container(
                                        height: height * 0.08,
                                        width: width * 0.95,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image: const DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage('images/2nd.jpg'))),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: height,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: MyThemeClass.primaryColor
                                                      .withOpacity(0.7)),
                                            ),
                                            Container(
                                              height: height,
                                              width: width,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: width * 0.02),
                                                    child: Text(
                                                      'Boots',
                                                      style: TextStyle(
                                                          fontSize: width * 0.08,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.white,
                                                    size: width * 0.08,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  ///////////////////////////////////
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => NewArrival(
                                                    heading: "Sneakers",
                                                  )));
                                    },
                                    child: Card(
                                      elevation: 3,
                                      color: MyThemeClass.primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15)),
                                      child: Container(
                                        height: height * 0.08,
                                        width: width * 0.95,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image:const DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    AssetImage('images/snkars.jpg'))),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: height,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: MyThemeClass.primaryColor
                                                      .withOpacity(0.7)),
                                            ),
                                            Container(
                                              height: height,
                                              width: width,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: width * 0.02),
                                                    child: Text(
                                                      'Sneakers',
                                                      style: TextStyle(
                                                          fontSize: width * 0.08,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.white,
                                                    size: width * 0.08,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  /////////////////////////////////
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => NewArrival(
                                                    heading: "Sandals",
                                                  )));
                                    },
                                    child: Card(
                                      elevation: 3,
                                      color: MyThemeClass.primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15)),
                                      child: Container(
                                        height: height * 0.08,
                                        width: width * 0.95,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image:const DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    AssetImage('images/sandals.jpg'))),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: height,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: MyThemeClass.primaryColor
                                                      .withOpacity(0.7)),
                                            ),
                                            Container(
                                              height: height,
                                              width: width,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: width * 0.02),
                                                    child: Text(
                                                      'Sandals',
                                                      style: TextStyle(
                                                          fontSize: width * 0.08,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.white,
                                                    size: width * 0.08,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                ],
              // ):Center(child: CircularProgressIndicator())
              // :Center(
              //   child: Text("Not found data"),
              // )
              // ;
          )
    
    
      
    );
  }
}
