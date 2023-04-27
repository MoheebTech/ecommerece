// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/admin_pannel/admin_model/admin_model.dart';
import 'package:ecommerece/admin_pannel/mobile_admin_pannel/mobile_admin_singup.dart';
import 'package:ecommerece/admin_pannel/web/web_admin_home.dart';
import 'package:ecommerece/admin_pannel/web/web_singup.dart';
import 'package:ecommerece/mobile_app/Loginscreen.dart';
import 'package:ecommerece/mobile_app/pages/textformfield.dart';
import 'package:ecommerece/them_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebAdminLogin extends StatefulWidget {
  static  String id="weblogin";
  @override
  _WebAdminLoginState createState() => _WebAdminLoginState();
}

class _WebAdminLoginState extends State<WebAdminLogin> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  TextEditingController namecontroller = TextEditingController();
FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  var height, width;
  bool islogin = false;
  bool hide = true;

  @override
  void initState() {
    emailcontroller.text.isEmpty;
    passcontroller.text.isEmpty;
    setState(() {
      islogin = true;
    });
    super.initState();
  }

  // shared prefrence
    void addloginDataToSf() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('UserId', AdminStaticVeriable.uid);
  }

  final _formKey = GlobalKey<FormState>();
  String? errorMessage;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  webAdminSignin() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passcontroller.text);
         var user=await _auth.currentUser;
        AdminStaticVeriable.uid=user!.uid;
 await firebaseFirestore.collection("Admins").doc(AdminStaticVeriable.uid).get().then((value){
               setState(() {
                 if(value.data()==null){
                   Fluttertoast.showToast(
            msg: "signing on user side ",
            backgroundColor: Colors.red,
            textColor: Colors.white,
            gravity: ToastGravity.CENTER,
            fontSize: 17,
            timeInSecForIosWeb: 1,
            toastLength: Toast.LENGTH_SHORT);
              addloginDataToSf();
                 }else{
                  var adminmodel=AdminModel.fromMap(value.data()!);
                  String status=adminmodel.status!;
                  if(user!=null){
                    if(status=="Admin"){
                   Navigator.push(
            context, MaterialPageRoute(builder: (context) => WebAdminHome()));

        Fluttertoast.showToast(
            msg: " Admin Login Successfully",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            gravity: ToastGravity.CENTER,
            fontSize: 17,
            timeInSecForIosWeb: 1,
            toastLength: Toast.LENGTH_SHORT);
               addloginDataToSf();
                  }}
                 }
               });
                 });

    } on FirebaseAuthException catch (e) {
      switch (e.code) {
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
          fontSize: 16.0);
    }
  }

  

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return width<600?Loginscreen(): Scaffold(
        backgroundColor: MyThemeClass.primaryColor,
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image(
                      height: height * 0.27,
                      width: width * 0.5,
                      image: const AssetImage('images/back.png')),
                ),
                Container(
                  height: height * 0.06,
                  width: width,
                  child: Center(
                      child: Text(
                    'WELCOME BACK Admin!',
                    style: TextStyle(
                        fontSize: width * 0.03,
                        color: MyThemeClass.secoundryColor),
                  )),
                ),
                Card(
                  color: MyThemeClass.lightsecoundryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 14,
                  child: Container(
                      height: height * 0.42,
                      width: width * 0.65,
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.03, top: height * 0.01),
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      fontSize: width * 0.03,
                                      fontWeight: FontWeight.bold,
                                      color: MyThemeClass.secoundryColor),
                                )),
                            // ///------------------
                            //      /// signup screen
                            //     ///
                            Padding(
                              padding: EdgeInsets.only(
                                  right: width * 0.03, top: height * 0.01),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const WebAdminSignUp()));
                                },
                                child: Text('SignUp',
                                    style: TextStyle(
                                        fontSize: width * 0.03,
                                        color: MyThemeClass.secoundryColor)),
                              ),
                            )
                          ],
                        ),
                        //
                        // email field

                        Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.1,
                              right: width * 0.1,
                              bottom: height * 0.01,
                              top: height * 0.024),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Textformfield(
                                  abscureText: false,
                                  controller: emailcontroller,
                                  hinttext: 'Email',

                                  // inputaction: TextInputAction.continueAction,
                                  keyboardtype: TextInputType.emailAddress,
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: MyThemeClass.whiteColor,
                                  ),
                                  validation: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  }),
                              //----------------
                              // password field
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Textformfield(
                                controller: passcontroller,
                                hinttext: 'Password',
                                abscureText: hide,
                                // inputaction: TextInputAction.continueAction,
                                keyboardtype: TextInputType.text,
                                prefixIcon: Icon(
                                  Icons.key,
                                  color: MyThemeClass.whiteColor,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    hide == true
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: MyThemeClass.whiteColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      hide = !hide;
                                    });
                                  },
                                ),
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),

                              ///---------
                              /// forget button

                              InkWell(
                                child: Center(
                                  child: Text(
                                    'Forget Password?',
                                    style: TextStyle(
                                        color: MyThemeClass.secoundryColor),
                                  ),
                                ),
                                onTap: () {
                                  //    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetScreen()));
                                },
                              ),

                              ////-----------------
                              /// login button
                              ///
                              InkWell(
                                onTap: () {
                                  webAdminSignin();
                                  //   addloginDataToSf();

                                  //   if (_formKey.currentState!
                                  //       .validate()) {
                                  //     ScaffoldMessenger.of(context)
                                  //         .showSnackBar(
                                  //       const SnackBar(
                                  //           content: Text(
                                  //               'Processing Data')),
                                  //     );
                                  //  signin();
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: height * 0.015),
                                  child: Container(
                                    height: height * 0.055,
                                    width: width * 0.34,
                                    decoration: BoxDecoration(
                                        color: MyThemeClass.secoundryColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                        child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.02,
                                      ),
                                    )),
                                  ),
                                ),
                              )
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ])),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Center(
                      child: Text(
                    'Or Login With',
                    style: TextStyle(
                        fontSize: width * 0.03,
                        color: MyThemeClass.secoundryColor),
                  )),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height * 0.08,
                      width: width * 0.13,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[900],
                      ),
                      child: Center(
                        child: Text(
                          'f',
                          style: TextStyle(
                            color: MyThemeClass.whiteColor,
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.03),
                    Container(
                      height: height * 0.08,
                      width: width * 0.13,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage('images/twitter.png'))),
                    ),
                  ],
                ),
              ],
            )));
  }
}
