import 'package:ecommerece/mobile_app/Loginscreen.dart';
import 'package:ecommerece/mobile_app/Recover_password.dart';
import 'package:ecommerece/them_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetScreen extends StatefulWidget {
  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

TextEditingController emailcontroller = TextEditingController();
var height, width;

class _ForgetScreenState extends State<ForgetScreen> {

String? errorMessage;
  FirebaseAuth auth=FirebaseAuth.instance;

          forget()async {
              try{
  await auth.sendPasswordResetEmail(email: emailcontroller.text);
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
               Fluttertoast.showToast(
      msg: "please check your mail \n forget password",
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
      );
      }on FirebaseAuthException catch(e){
      switch(e.code){
         case "invalid-email":
          errorMessage = "Invalid Email!";
          break;
         case "wrong-password":
          errorMessage = "Wrong Password";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "No internet connection?";
      }
      Fluttertoast.showToast(
        msg: errorMessage!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
         );
         }               
        }

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
                  image: const AssetImage('images/back.png')),
            ),
            Container(
              height: height,
              width: width,
              color: MyThemeClass.primaryColor.withOpacity(0.6),
            ),
            Center(
              child: SizedBox(
                height: height,
                width: width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.23),
                      child: SizedBox(
                        height: height * 0.06,
                        width: width,
                        // color: Colors.amber,
                        child: Center(
                            child: Text(
                          'Verify Email',
                          style: TextStyle(
                              fontSize: width * 0.1,
                              color: MyThemeClass.secoundryColor),
                        )),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Container(
                      height: height * 0.3,
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
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  controller: emailcontroller,
                                  style: TextStyle(
                                    color: MyThemeClass.whiteColor
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                  decoration:  InputDecoration(
                                    hintText: ('Email'),
                                    hintStyle: TextStyle(color: MyThemeClass.whiteColor),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: MyThemeClass.whiteColor,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.04),
                              child: InkWell(
                                onTap: () {
                                  forget();
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             RecoverPassword()));
                                },
                                child: Container(
                                    height: height * 0.06,
                                    width: width * 0.5,
                                    decoration: BoxDecoration(
                                      color: MyThemeClass.secoundryColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Verify Email',
                                        style: TextStyle(
                                          fontSize: width * 0.05,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )),
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
          ],
        ),
      ),
    );
  }
}
