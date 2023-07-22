import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/mobile_app/Payment_method.dart';
import 'package:ecommerece/mobile_app/pages/cart.dart';
import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';

import '../../admin_pannel/admin_model/product_model.dart';
import '../item_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchcontroller = TextEditingController();
  var height, width;
   String? search;
  List<ProductModel> newproductlist = [];
  getProducts() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("Products").get();
    snapshot.docs.forEach((doc) {
      setState(() {
        newproductlist
            .add(ProductModel.fromMap(doc.data() as Map<String, dynamic>));
      });
    });
    print('productlist: $newproductlist');

    setState(() {
    //  leading = true;
    });
  }
  @override
  void initState() {
    getProducts();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      
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
                            'Search',
                            style: TextStyle(
                              fontSize: width * 0.06,
                              color: MyThemeClass.whiteColor,
                            ),
                          ),
      ),
      body: Container(
        height: height,
        width: width,
        color: MyThemeClass.primaryColor,
        child: Column(
          children: [
           
            SizedBox(height: height * 0.02),
             Container(
              height: height * 0.05,
              width: width * 0.95,
              decoration: BoxDecoration(
                color: MyThemeClass.transColor?.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.02),
                child: TextFormField(
                  controller: searchcontroller,
                  onChanged: (value) {
                    setState(() {
                      search=value;
                    });
                  },
                  decoration: InputDecoration(
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
SizedBox(height: height * 0.02),
        Expanded(
          child: ListView.builder(
                          itemCount:search==null || search!.isEmpty ? 1: newproductlist.length,
                          itemBuilder: (context, index) {
                            if (search == null ||
                                search!.isEmpty ||
                                search == '') {
                                    return Container(
                                      child: Column(
                                        children: [
                            SizedBox(height: height * 0.04),
                  Container(
                     height: height * 0.05,
                         width: width,
                       //// color: Colors\.amber,
                         child: Padding(
                      padding: EdgeInsets.only(left: width * 0.03),
                           child: Text(
                  'Try Searching',
                  style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: MyThemeClass.whiteColor,
                  ),
                ),
              ),
            ),
            Container(
              height: height * 0.04,
              width: width * 0.9,
              // color: Colors\.amber,
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.03),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: width * 0.05,
                      color: MyThemeClass.whiteColor,
                    ),
                    Text(
                      'College Shoes',
                      style: TextStyle(
                        fontSize: width * 0.05,
                        color: MyThemeClass.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Container(
              height: height * 0.04,
              width: width * 0.9,
              // color: Colors\.amber,
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.03),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: width * 0.05,
                      color: MyThemeClass.whiteColor,
                    ),
                    Text(
                      'Formal Shoes',
                      style: TextStyle(
                        fontSize: width * 0.05,
                        color: MyThemeClass.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Container(
              height: height * 0.04,
              width: width * 0.9,
              // color: Colors\.amber,
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.03),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: width * 0.05,
                      color: MyThemeClass.whiteColor,
                    ),
                    Text(
                      'Party Shoes',
                      style: TextStyle(
                        fontSize: width * 0.05,
                        color: MyThemeClass.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Container(
              height: height * 0.04,
              width: width * 0.9,
              // color: Colors\.amber,
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.03),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: width * 0.05,
                      color: MyThemeClass.whiteColor,
                    ),
                    Text(
                      'New Shoes',
                      style: TextStyle(
                        fontSize: width * 0.05,
                        color: MyThemeClass.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Container(
              height: height * 0.08,
              width: width * 0.9,
              // color: Colors\.amber,
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.03),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: width * 0.05,
                      color: MyThemeClass.whiteColor,
                    ),
                    Text(
                      'Red Shoes',
                      style: TextStyle(
                        fontSize: width * 0.05,
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
                            } else if (newproductlist[index]
                                .productname!
                                .toLowerCase()
                                .contains(search!.toLowerCase())) {
                                    return Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12.0, bottom: 12.0),
                              child: Container(
                                height: height * 0.3,
                                width: width * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:
                                      MyThemeClass.transColor?.withOpacity(0.1),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: height * 0.17,
                                        width: width * 0.9,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fitHeight,
                                              image: NetworkImage(
                                                  '${newproductlist[index].imageUrls![0]}')),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.1,
                                      width: width,
                                      // color: Colors.red,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: height,
                                            width: width * 0.3,
                                            // color: Colors.green,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.04),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${newproductlist[index].productname}',
                                                    style: TextStyle(
                                                      color: MyThemeClass
                                                          .whiteColor,
                                                      fontSize: width * 0.04,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${newproductlist[index].price}',
                                                    style: TextStyle(
                                                      color: MyThemeClass
                                                          .whiteColor,
                                                      fontSize: width * 0.05,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: height,
                                            width: width * 0.2,
                                            // color: Colors.brown,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: height * 0.015),
                                                  child: Text(
                                                    'Colors',
                                                    style: TextStyle(
                                                      color: MyThemeClass
                                                          .whiteColor,
                                                      fontSize: width * 0.04,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: height * 0.035),
                                                  child: Container(
                                                    // color: Colors.amber,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: height * 0.02,
                                                          width: width * 0.03,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: width *
                                                                      0.02),
                                                          child: Container(
                                                            height:
                                                                height * 0.02,
                                                            width: width * 0.03,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: Colors
                                                                  .brown[900],
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
                                          SizedBox(
                                            height: height,
                                            width: width * 0.3,
                                            // color: Colors.amber,
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: InkWell(
                                                onTap: () {
                                                  ProductModel model =
                                                      ProductModel(
                                                          price: newproductlist[
                                                                  index]
                                                              .price,
                                                          totalprice:
                                                              newproductlist[
                                                                      index]
                                                                  .totalprice,
                                                          //  imageUrls: myList[index].image,
                                                          productname:
                                                              newproductlist[
                                                                      index]
                                                                  .productname,
                                                          count: 1,
                                                          details: newproductlist[index].details,
                                                        imageUrls: newproductlist[index].imageUrls,
                                                        brand:  newproductlist[index].brand,
                                                        category:  newproductlist[index].category,
                                                        discountprice:  newproductlist[index].discountprice,
                                                        id:  newproductlist[index].id,
                                                        isFavourit:  newproductlist[index].isFavourit,
                                                        selerialCode:  newproductlist[index].selerialCode
                                                          );
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ItemScreen(
                                                                model: model,
                                                              )
                                                              ));
                                                },
                                                child: Container(
                                                  height: height * 0.06,
                                                  width: width * 0.3,
                                                  decoration: BoxDecoration(
                                                      color: MyThemeClass
                                                          .whiteColor,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(15),
                                                      )),
                                                  child: Center(
                                                    child: Text('Add to cart',
                                                        style: TextStyle(
                                                          fontSize:
                                                              width * 0.04,
                                                        )),
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
                            );
                            } else {
                              return Container();
                            }
                          
                          }),
        )

          ],
        ),
      ),
    );
  }
}
