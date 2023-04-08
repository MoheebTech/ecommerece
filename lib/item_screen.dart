import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerece/Payment_method.dart';
import 'package:ecommerece/cart.dart';
import 'package:ecommerece/mobile_app/model_classes/homepage_modelclass.dart';
import 'package:ecommerece/mobile_app/model_classes/slider_modelclass.dart';
import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatefulWidget {
  HomePageModelClass model;
  ItemScreen({required this.model});
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  TextEditingController searchcontroller = TextEditingController();
  int currentindex = 0;
   
  @override
  Widget build(BuildContext context) {
   var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
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
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: height,
                          width: width * 0.2,

                          // color: Colors.red,

                          child: Text(
                            'Item',
                            style: TextStyle(
                              fontSize: width * 0.06,
                              color: MyThemeClass.whiteColor,
                            ),
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
                              size: width * 0.06,
                              color: MyThemeClass.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Container(
                  height: height * 0.05,
                  width: width * 0.95,
                  decoration: BoxDecoration(
                    color: MyThemeClass.transColor!.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
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
                    itemCount: SliderClass.slider.length,
                    itemBuilder: (context, index, realIndex) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: height * 0.2,
                          width: width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      SliderClass.slider[index].image))),
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
                        widget.model.name,
                        style: TextStyle(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.bold,
                          color: MyThemeClass.whiteColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.02),
                      child: Icon(
                        Icons.favorite_border,
                        color: MyThemeClass.whiteColor,
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
                      '\$${widget.model.amount}',
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
                    'Fell the difference in comfort with our uniquely designed Deep Comfort Tchnology.  More',
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
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        height: height * 0.06,
                        width: width * 0.1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.brown[900],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        height: height * 0.06,
                        width: width * 0.1,
                      ),
                    ),
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
              Padding(
                padding: EdgeInsets.only(top: height * 0.02),
                child: SizedBox(
                  height: height * 0.06,
                  width: width,
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            // color: Color(0xff41382F),
                            border: Border.all(
                                width: width * 0.003,
                                color: MyThemeClass.whiteColor),
                            borderRadius: BorderRadius.circular(15)),
                        height: height * 0.06,
                        width: width * 0.1,
                        child: Center(
                            child: Text(
                          '7.5',
                          style: TextStyle(
                            color: MyThemeClass.whiteColor,
                            fontSize: width * 0.04,
                          ),
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            // color: Color(0xff41382F),
                            border: Border.all(
                                width: width * 0.003,
                                color: MyThemeClass.whiteColor),
                            borderRadius: BorderRadius.circular(15)),
                        height: height * 0.06,
                        width: width * 0.1,
                        child: Center(
                            child: Text(
                          '8',
                          style: TextStyle(
                            color: MyThemeClass.whiteColor,
                            fontSize: width * 0.04,
                          ),
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            // color: Color(0xff41382F),
                            border: Border.all(
                                width: width * 0.003,
                                color: MyThemeClass.whiteColor),
                            borderRadius: BorderRadius.circular(15)),
                        height: height * 0.06,
                        width: width * 0.1,
                        child: Center(
                            child: Text(
                          '8.5',
                          style: TextStyle(
                            color: MyThemeClass.whiteColor,
                            fontSize: width * 0.04,
                          ),
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            // color: Color(0xff41382F),
                            border: Border.all(
                                width: width * 0.003,
                                color: MyThemeClass.whiteColor),
                            borderRadius: BorderRadius.circular(15)),
                        height: height * 0.06,
                        width: width * 0.1,
                        child: Center(
                            child: Text(
                          '9',
                          style: TextStyle(
                            color: MyThemeClass.whiteColor,
                            fontSize: width * 0.04,
                          ),
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            // color: Color(0xff41382F),
                            border: Border.all(
                                width: width * 0.003,
                                color: MyThemeClass.whiteColor),
                            borderRadius: BorderRadius.circular(15)),
                        height: height * 0.06,
                        width: width * 0.1,
                        child: Center(
                            child: Text(
                          '9.5',
                          style: TextStyle(
                            color: MyThemeClass.whiteColor,
                            fontSize: width * 0.04,
                          ),
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            // color: Color(0xff41382F),
                            border: Border.all(
                                width: width * 0.003,
                                color: MyThemeClass.whiteColor),
                            borderRadius: BorderRadius.circular(15)),
                        height: height * 0.06,
                        width: width * 0.1,
                        child: Center(
                            child: Text(
                          '10',
                          style: TextStyle(
                            color: MyThemeClass.whiteColor,
                            fontSize: width * 0.04,
                          ),
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            // color: Color(0xff41382F),
                            border: Border.all(
                                width: width * 0.003,
                                color: MyThemeClass.whiteColor),
                            borderRadius: BorderRadius.circular(15)),
                        height: height * 0.06,
                        width: width * 0.1,
                        child: Center(
                            child: Text(
                          '11',
                          style: TextStyle(
                            color: MyThemeClass.whiteColor,
                            fontSize: width * 0.04,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentMethod(
                                model: widget.model,
                              )));
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
                        'Add to Cart',
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
