import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/admin_pannel/admin_model/product_model.dart';
import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../item_screen.dart';

class NewArrival extends StatefulWidget {
 String heading;
 NewArrival({required this.heading});

  @override
  State<NewArrival> createState() => _NewArrivalState();
}

class _NewArrivalState extends State<NewArrival> {
  TextEditingController searchcontroller = TextEditingController();
  final imagepicker = ImagePicker();
  List<XFile> image = [];
  String? search;
  // List<NewArrivals> myList = [];
  bool leading = true;

  // getList() {
  //   if (widget.heading == "Casual Wear") {
  //     myList = NewArrivals.casualItemList;
  //   } else if (widget.heading == "Boots") {
  //     myList = NewArrivals.bootsItemList;
  //   } else if (widget.heading == "Sneakers") {
  //     myList = NewArrivals.sneakersItemList;
  //   } else if (widget.heading == "Sandals") {
  //     myList = NewArrivals.sandalItemList;
  //   } else {
  //     myList = NewArrivals.newArrivals;
  //   }
  // }

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
      leading = true;
    });
  }

  @override
  void initState() {
    getProducts();
    // getList();
    super.initState();
  }

  @override
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
                            'Shop Flux',
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

            Padding(
              padding: EdgeInsets.only(top: height * 0.01),
              child: Container(
                height: height * 0.07,
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
                        search = value;
                      });
                    },
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
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.02),
              child: SizedBox(
                height: height * 0.04,
                width: width,
                // color: Colors.red,
                child: Center(
                  child: Text(
                    "New Products",
                    style: TextStyle(
                      color: MyThemeClass.whiteColor,
                      fontSize: width * 0.06,
                    ),
                  ),
                ),
              ),
            ),
            leading == false
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: Container(
                      height: height,
                      width: width,
                      color: MyThemeClass.primaryColor,
                      child: ListView.builder(
                          itemCount: newproductlist.length,
                          itemBuilder: (context, index) {
                            if (search == null ||
                                search!.isEmpty ||
                                search == '') {
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
                                    Flexible(
                                   
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
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
                                                  'Price: ${newproductlist[index].price}',
                                                  style: TextStyle(
                                                    color: MyThemeClass
                                                        .whiteColor,
                                                    fontSize: width * 0.045,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              ],
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
                                                          brand: newproductlist[index].brand,
                                                          category: newproductlist[index].category,
                                                          details: newproductlist[index].details,
                                                          discountprice: newproductlist[index].discountprice,
                                                          id: newproductlist[index].id,
                                                          imageUrls: newproductlist[index].imageUrls,
                                                          selerialCode: newproductlist[index].selerialCode,
                                                          );

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ItemScreen(
                                                                model: model,
                                                              )));
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
                                    Flexible(
                                     
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
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
                                                  'Price: ${newproductlist[index].price}',
                                                  style: TextStyle(
                                                    color: MyThemeClass
                                                        .whiteColor,
                                                    fontSize: width * 0.045,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              ],
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
                                                          brand: newproductlist[index].brand,
                                                          category: newproductlist[index].category,
                                                          details: newproductlist[index].details,
                                                          discountprice: newproductlist[index].discountprice,
                                                          id: newproductlist[index].id,
                                                          imageUrls: newproductlist[index].imageUrls,
                                                          selerialCode: newproductlist[index].selerialCode,

                                                          );

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ItemScreen(
                                                                model: model,
                                                              )));
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
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
