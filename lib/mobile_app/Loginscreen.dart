// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/admin_pannel/mobile_admin_pannel/mobile_admin_Loginscreen.dart';
import 'package:ecommerece/admin_pannel/web/web_admin_Loginscreen.dart';
import 'package:ecommerece/mobile_app/model_classes/userModel.dart';
import 'package:ecommerece/mobile_app/pages/forgetpasword.dart';
import 'package:ecommerece/mobile_app/home_page.dart';
import 'package:ecommerece/mobile_app/model_classes/static_value.dart';
import 'package:ecommerece/mobile_app/pages/singup.dart';
import 'package:ecommerece/mobile_app/pages/textformfield.dart';
import 'package:ecommerece/them_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}
class _LoginscreenState extends State<Loginscreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  var height, width;
  bool islogin = false;
  bool hide=true;

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
    prefs.setString('UserId', StaticDate.uid!);
  }

  final _formKey = GlobalKey<FormState>();
  String? errorMessage;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  signin() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passcontroller.text);
          var user=await _auth.currentUser;
        StaticDate.uid=user!.uid;
  await firebaseFirestore.collection("users").doc(StaticDate.uid).get().then((value) {
    setState(() {
         if(value.data()==null){
            Fluttertoast.showToast(
            msg: "Dont't have an account Signup ",
            backgroundColor: Colors.red,
            textColor: Colors.white,
            gravity: ToastGravity.CENTER,
            fontSize: 17,
            timeInSecForIosWeb: 1,
            toastLength: Toast.LENGTH_SHORT);
              addloginDataToSf();
         }else{
          var usermodel=UserModel.fromMap(value.data()!);
          String status=usermodel.status!;
          if(user!=null){
            if(status=="user"){
                Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  HomePage()));
            }
                 Fluttertoast.showToast(
            msg: "User Login Successfully",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            gravity: ToastGravity.CENTER,
            fontSize: 17,
            timeInSecForIosWeb: 1,
            toastLength: Toast.LENGTH_SHORT);
           addloginDataToSf();
            }
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
    // shared prefrence
  // void postdatatoSF(String uid) async {
  //   SharedPreferences sharedprfrence = await SharedPreferences.getInstance();
  //   sharedprfrence.setString('userID', uid);
  //   // print(StaaticVariable.uid);
  // }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return width>600? WebAdminLogin():Scaffold(
      resizeToAvoidBottomInset: false,
   //   drawerScrimColor: MyThemeClass.transColor,
        body: Form(
            key: _formKey,
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
                      image:const AssetImage('images/back.png')),
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
                                child: 
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       children: [
                                         Text(
                                            'User ',
                                            style: TextStyle(
                                                fontSize: width * 0.09,
                                                color: MyThemeClass.secoundryColor),
                                          ),
                                           InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MobileAdminLogin()));
                                            },
                                             child: Text(
                                              'Admin?',
                                              style: TextStyle(
                                                  fontSize: width * 0.09,
                                                  color: MyThemeClass.secoundryColor),
                                                                                     ),
                                           ),
                                       ],
                                     )
                                   
                          
                            ),)),
                        Container(
                          height: islogin ? height * 0.43 : height * 0.5,
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
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.03),
                                          child: Text(
                                            'LOGIN',
                                            style: TextStyle(
                                                fontSize: width * 0.06,
                                                fontWeight: FontWeight.bold,
                                                color: MyThemeClass
                                                    .secoundryColor),
                                          )),
  // ///------------------
//      /// signup screen
//     ///                                        
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: width * 0.03),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUp()));
                                          },
                                          child: Text('SignUp',
                                              style: TextStyle(
                                                  fontSize: width * 0.05,
                                                  color: MyThemeClass
                                                      .secoundryColor)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

// email field

                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Textformfield(
                                        abscureText: false,
                                          controller: emailcontroller,
                                          hinttext: 'Email',

                                          // inputaction: TextInputAction.continueAction,
                                          keyboardtype:
                                              TextInputType.emailAddress,
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: MyThemeClass.whiteColor,
                                          ),
                                          validation: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your name';
                                            }
                                            return null;
                                          }),
          //----------------
      // password field

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
                                          icon: Icon(hide==true?Icons.visibility_off:Icons.visibility,color:MyThemeClass.whiteColor,),
                                          onPressed: (){
                                            setState(() {
                                              hide=!hide;
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
     ///---------
     /// forget button                                 
                                      // InkWell(
                                      //   onTap: () {
                                         
                                      //   },
                                        //child:
                                        //  Center(
                                        //  child: TextButton(
                                          
                                        //  onPressed: (){
                                        //     Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetScreen()));
                                        //  },
                                        //  child: Text('Forget Password?',
                                        //  style: TextStyle(color: MyThemeClass.secoundryColor),),
                                        //  ),
                                        // ),

                                        InkWell(
                                       
                                        child:
                                         Center(
                                         child: Text(  
                                         'Forget Password?',
                                         style: TextStyle(color: MyThemeClass.secoundryColor),
                                         ),
                                        ),
                                         onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetScreen()));
                                        },
                                  ),
                                      
   ////-----------------
   /// login button
   ///                                   
                                      Padding(
                                  padding: EdgeInsets.only(top: height * 0.03),
                                  child: 
                                      InkWell(
                                          onTap: () {
                                            // addloginDataToSf();

                                            // if (_formKey.currentState!
                                            //     .validate()) {
                                            //   ScaffoldMessenger.of(context)
                                            //       .showSnackBar(
                                            //     const SnackBar(
                                            //         content: Text(
                                            //             'Processing Data')),
                                            //   );
                                            signin(); 
                                            
                                          },
                                          child: Container(
                                            height: height * 0.05,
                                            width: width * 0.4,
                                            decoration: BoxDecoration(
                                                color:
                                                    MyThemeClass.secoundryColor,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                                child: Text(
                                              'LOGIN',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: width * 0.05,
                                              ),
                                            )),
                                          ),
                                        ))
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                       Padding(
                                padding: EdgeInsets.only(top: height * 0.05),
                                child: Container(
                                  height: height * 0.1,
                                  width: width * 0.4,
                                  child: Center(
                                      child: Text(
                                    'Or Login With',
                                    style: TextStyle(
                                        fontSize: width * 0.045,
                                        color: MyThemeClass.secoundryColor),
                                  )),
                                ),
                              ),
                           
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: height * 0.1,
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
                                    fontSize: width * 0.13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.03),
                            Container(
                              height: height * 0.1,
                              width: width * 0.13,
                              decoration:const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage('images/twitter.png'))),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
