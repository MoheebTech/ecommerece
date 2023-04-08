
import 'package:ecommerece/Payment_method.dart';
import 'package:ecommerece/cart.dart';
import 'package:ecommerece/mobile_app/model_classes/New_Arrivals_modelclass.dart';
import 'package:ecommerece/mobile_app/model_classes/homepage_modelclass.dart';
import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';

class NewArrival extends StatefulWidget {
  String heading;
  NewArrival({required this.heading});

  @override
  State<NewArrival> createState() => _NewArrivalState();
}

class _NewArrivalState extends State<NewArrival> {
  TextEditingController searchcontroller = TextEditingController();

  List<NewArrivals> myList = [];
  @override
  void initState() {
    getList();
    super.initState();
  }

  getList() {
    if (widget.heading == "Casual Wear") {
      myList = NewArrivals.casualItemList;
    } else if (widget.heading == "Boots") {
      myList = NewArrivals.bootsItemList;
    } else if (widget.heading == "Sneakers") {
      myList = NewArrivals.sneakersItemList;
    } else if (widget.heading == "Sandals") {
      myList = NewArrivals.sandalItemList;
    } else {
      myList = NewArrivals.newArrivals;
    }
  }

  @override
  Widget build(BuildContext context) {
  var  height = MediaQuery.of(context).size.height;
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
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
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
                        Text(
                          'RIGEL',
                          style: TextStyle(
                            color: MyThemeClass.secoundryColor,
                            fontSize: width * 0.07,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: width * 0.02),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartScreen()));
                            },
                            child: Icon(
                              Icons.shopping_bag,
                              color: MyThemeClass.whiteColor,
                              size: width * 0.06,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.01),
              child: Container(
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
                    widget.heading,
                    style: TextStyle(
                      color: MyThemeClass.whiteColor,
                      fontSize: width * 0.06,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: height,
                width: width,
                color: MyThemeClass.primaryColor,
                child: ListView.builder(
                    itemCount: myList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, bottom: 12.0),
                        child: Container(
                          height: height * 0.3,
                          width: width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: MyThemeClass.transColor?.withOpacity(0.1),
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
                                        image: AssetImage(
                                            '${myList[index].image}')),
                                    borderRadius: BorderRadius.circular(15),
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
                                        padding:
                                            EdgeInsets.only(left: width * 0.04),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${myList[index].name}',
                                              style: TextStyle(
                                                color: MyThemeClass.whiteColor,
                                                fontSize: width * 0.04,
                                              ),
                                            ),
                                            Text(
                                              '${myList[index].amount}',
                                              style: TextStyle(
                                                color: MyThemeClass.whiteColor,
                                                fontSize: width * 0.05,
                                                fontWeight: FontWeight.bold,
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
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: height * 0.015),
                                            child: Text(
                                              'Colors',
                                              style: TextStyle(
                                                color:
                                                    MyThemeClass.whiteColor,
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
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: height * 0.02,
                                                    width: width * 0.03,
                                                    decoration:const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: width * 0.02),
                                                    child: Container(
                                                      height: height * 0.02,
                                                      width: width * 0.03,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            Colors.brown[900],
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
                                            HomePageModelClass model =
                                                HomePageModelClass(
                                                    amount:
                                                        myList[index].amount,
                                                    totalPrice:
                                                        myList[index].amount,
                                                    images: myList[index].image,
                                                    name: myList[index].name,
                                                    count: 1);

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PaymentMethod(
                                                          model: model,
                                                        )));
                                          },
                                          child: Container(
                                            height: height * 0.06,
                                            width: width * 0.3,
                                            decoration: BoxDecoration(
                                                color: MyThemeClass.whiteColor,
                                                borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(15),
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
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
