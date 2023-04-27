import 'package:ecommerece/mobile_app/pages/cart.dart';
import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchcontroller = TextEditingController();
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

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
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                          'Search',
                          style: TextStyle(
                            color: MyThemeClass.whiteColor,
                            fontSize: width * 0.06,
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
      ),
    );
  }
}
