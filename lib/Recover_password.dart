import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';

class RecoverPassword extends StatefulWidget {
  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

TextEditingController passcontroller = TextEditingController();
TextEditingController newpasscontroller = TextEditingController();
var height, width;

class _RecoverPasswordState extends State<RecoverPassword> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              color: MyThemeClass.primaryColor,
            ),
            Positioned(
              left: width * 0.25,
              top: height * -0.07,
              child: Image(
                  height: height * 0.4,
                  width: width * 0.5,
                  image: AssetImage('images/back.png')),
            ),
            Container(
              height: height,
              width: width,
              color: MyThemeClass.primaryColor.withOpacity(0.6),
            ),
            Center(
              child: Container(
                height: height,
                width: width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.23),
                      child: Container(
                        height: height * 0.06,
                        width: width,
                        // color: Colors.amber,
                        child: Center(
                            child: Text(
                          'Reset Password',
                          style: TextStyle(
                              fontSize: width * 0.1,
                              color: MyThemeClass.secoundryColor),
                        )),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Container(
                      height: height * 0.35,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.yellow[50]?.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.04),
                              child: Container(
                                height: height * 0.06,
                                width: width * 0.75,
                                decoration: BoxDecoration(
                                  color: MyThemeClass.whiteColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  controller: passcontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: ('Old Password'),
                                    hintStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.04),
                              child: Container(
                                height: height * 0.06,
                                width: width * 0.75,
                                decoration: BoxDecoration(
                                  color: MyThemeClass.whiteColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  controller: passcontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: ('new Password'),
                                    hintStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.04),
                              child: Container(
                                  height: height * 0.06,
                                  width: width * 0.5,
                                  decoration: BoxDecoration(
                                    color: MyThemeClass.whiteColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Confirm Password',
                                      style: TextStyle(
                                        fontSize: width * 0.05,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )),
                            ),
                          ],
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
  }
}
