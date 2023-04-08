import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
                        Padding(
                          padding: EdgeInsets.only(right: width * 0.35),
                          child: Text(
                            'My Details',
                            style: TextStyle(
                              color: MyThemeClass.whiteColor,
                              fontSize: width * 0.05,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(height: height * 0.01),
            Container(
              height: height * 0.05,
              width: width,
              // color: Colors.amber,
              child: Center(
                child: Text('Your Details',
                    style: TextStyle(
                      color: MyThemeClass.whiteColor,
                      fontSize: width * 0.06,
                      // fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            SizedBox(height: height * 0.01),
            Card(
              elevation: 5,
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                height: height * 0.09,
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyThemeClass.primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FIRST NAME',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: width * 0.04,
                        ),
                      ),
                      Text(
                        'Jam',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Card(
              elevation: 5,
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                height: height * 0.09,
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyThemeClass.primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LAST NAME',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: width * 0.04,
                        ),
                      ),
                      Text(
                        'Sharjeel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Card(
              elevation: 5,
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                height: height * 0.09,
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyThemeClass.primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'EMAIL ADDRESS',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: width * 0.04,
                        ),
                      ),
                      Text(
                        'Jamsharjeel78@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Container(
              height: height * 0.04,
              width: width * 0.9,
              color: MyThemeClass.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Address',
                      style: TextStyle(
                        color: MyThemeClass.whiteColor,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                      )),
                  Icon(Icons.add, color: Colors.white, size: width * 0.07)
                ],
              ),
            ),
            SizedBox(height: height * 0.01),
            Card(
              elevation: 5,
              color: Colors.white12,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                height: height * 0.13,
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyThemeClass.transColor?.withOpacity(0.1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: height,
                      width: width * 0.5,
                      // color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'House no# 731-D',
                              style: TextStyle(
                                color: Colors.white38,
                                fontSize: width * 0.04,
                              ),
                            ),
                            Text(
                              'Block-3,Streat 61',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.04,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Houston,Taxes.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.04,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: height,
                      width: width * 0.2,
                      // color: Colors.green,
                      child: Icon(
                        Icons.check_box_outline_blank,
                        size: width * 0.06,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Card(
              elevation: 5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                height: height * 0.13,
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyThemeClass.transColor?.withOpacity(0.1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: height,
                      width: width * 0.5,
                      // color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'House no# 664-D',
                              style: TextStyle(
                                fontSize: width * 0.04,
                              ),
                            ),
                            Text(
                              'Block-7H,Streat 4',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Dallas,Taxes.',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: height,
                      width: width * 0.2,
                      // color: Colors.green,
                      child: Icon(
                        Icons.check_box,
                        size: width * 0.06,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Container(
              height: height * 0.06,
              width: width * 0.8,
              decoration: BoxDecoration(
                  color: MyThemeClass.whiteColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text('Save Changes',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
