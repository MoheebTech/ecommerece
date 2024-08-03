import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
   var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
                            'Notifications',
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
              height: height * 0.07,
              width: width * 0.75,
              decoration: BoxDecoration(
                color: MyThemeClass.transColor?.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                controller: searchcontroller,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: ('Search'),
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.mic,
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(height: height * 0.01),
            SizedBox(
              height: height * 0.05,
              width: width,
              // color: Colors.amber,
              child: Center(
                child: Text('Notifications',
                    style: TextStyle(
                      color: MyThemeClass.whiteColor,
                      fontSize: width * 0.06,
                    )),
              ),
            ),
            SizedBox(height: height * 0.01),
            Container(
              height: height * 0.12,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: MyThemeClass.transColor?.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('New Arrivals',
                        style: TextStyle(
                          color: MyThemeClass.whiteColor,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('New Summer Colloction just arrived,\nTake a look',
                        style: TextStyle(
                          color: MyThemeClass.whiteColor,
                          fontSize: width * 0.03,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Container(
              height: height * 0.12,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: MyThemeClass.transColor?.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('50% OFF Sale!',
                        style: TextStyle(
                          color: MyThemeClass.whiteColor,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('Upto 50%  Sale on Sneakers and Sandals,\nCheck Out',
                        style: TextStyle(
                          color: MyThemeClass.whiteColor,
                          fontSize: width * 0.03,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Container(
              height: height * 0.12,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: MyThemeClass.transColor?.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Website is LIVE!!!',
                        style: TextStyle(
                          color: MyThemeClass.whiteColor,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('OurWebsite is LIVE now,go and check\nTake a look',
                        style: TextStyle(
                          color: MyThemeClass.whiteColor,
                          fontSize: width * 0.03,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.28),
            Container(
              height: height * 0.05,
              width: width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child: Text(
                'Clear All',
                style: TextStyle(fontSize: width * 0.04),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
