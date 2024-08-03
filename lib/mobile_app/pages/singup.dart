import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/admin_pannel/web/web_singup.dart';
import 'package:ecommerece/mobile_app/Loginscreen.dart';
import 'package:ecommerece/mobile_app/home_page.dart';
import 'package:ecommerece/mobile_app/model_classes/static_value.dart';
import 'package:ecommerece/mobile_app/model_classes/userModel.dart';
import 'package:ecommerece/mobile_app/pages/textformfield.dart';
import 'package:ecommerece/them_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();

  bool hide = true;
  bool islogin = false;
  String? errorMessage;

  final FirebaseAuth auth = FirebaseAuth.instance;

//-------
// Get TockenID Funtion

 
  FirebaseMessaging firebasemessaging = FirebaseMessaging.instance;
  void getToken() {
    firebasemessaging.getToken().then((value) {
      StaticDate.tockenId= value!;
       
    });
  }
/// signup method
/// 
         final FirebaseAuth _auth = FirebaseAuth.instance;
               Future signup() async {
  
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email:   emailcontroller.text, password: passcontroller.text );
      if (userCredential.user != null) {
       // getToken();

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Loginscreen()));
        Fluttertoast.showToast(
          msg: "Registration Successfully",
          backgroundColor: Colors.green,
          fontSize: 16.0,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_SHORT,
        );
       //  print('we' + id.toString());
       postdatatoDB(userCredential.user!.uid);
      }
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
        backgroundColor: Colors.red,
        fontSize: 16.0,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }
List<String> profileimage=[];
// post datatoDB
        final FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
         void postdatatoDB(String id)async{
         UserModel model=UserModel(
        
         email: emailcontroller.text,
         password: passcontroller.text,
         name: namecontroller.text,
         tockenId: StaticDate.tockenId,
        uid: id,
        status: "user",
        address: "no address",
         number: "0545",
         profileImage: ""
      // profileimage: profileimage,
         );
         await firebaseFirestore.collection('users').doc(id).set(model.toMap());
         }

  @override
  void initState() {
  //   getToken();
    print(" tocken id =${StaticDate.tockenId.toString()}");
   
    super.initState();  
  }
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return width>600? WebAdminSignUp():Scaffold(
       resizeToAvoidBottomInset: false,
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
                      image: const AssetImage('images/back.png')),
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
                              'WellCome User',
                              style: TextStyle(
                                  fontSize: width * 0.09,
                                  color: MyThemeClass.secoundryColor),
                            )),
                          ),
                        ),
                        Container(
                            height: height * 0.52,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.yellow[50]?.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(children: [
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
                                              'SignUp ',
                                              style: TextStyle(
                                                  fontSize: width * 0.06,
                                                  fontWeight: FontWeight.bold,
                                                  color: MyThemeClass
                                                      .secoundryColor),
                                            )),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: width * 0.03),
                                          //--------------
                                          //  login back screen
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, context);
                                            },
                                            child: Text('LOGIN',
                                                style: TextStyle(
                                                    fontSize: width * 0.05,
                                                    color: MyThemeClass
                                                        .secoundryColor)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

// name field

                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Textformfield(
                                            abscureText: false,
                                            controller: namecontroller,
                                            hinttext: 'Name',

                                            // inputaction: TextInputAction.continueAction,
                                            keyboardtype:
                                                TextInputType.emailAddress,
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: MyThemeClass.whiteColor,
                                            ),
                                            validation: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter your name';
                                              }

                                              return null;
                                            }),

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
                                                return 'Please enter your email';
                                            //   } else if ( value.contains('@') && value.endsWith('.com')) {
                                            //     return  " valid email @gmail.com";
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
                                            if (value == null ||
                                                value.isEmpty) {
                                              return'Please enter your password';
                                            }
                                           else if(value.length<6){
                                             return ' your password greaterthan 6 characters';
                                           }
                                            return null;
                                          },
                                        ),
                                        ////-----------------
      /// signup button
                                        ///
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: height * 0.03),
                                            child: InkWell(
                                              onTap: () {
                                                // addloginDataToSf();
                                            
                                               signup();
                                               
                                             
                                             
                                              },
                                              child: Container(
                                                height: height * 0.05,
                                                width: width * 0.4,
                                                decoration: BoxDecoration(
                                                    color: MyThemeClass
                                                        .secoundryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Center(
                                                    child: Text(
                                                  'Sign Up',
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
                                ]))),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.01),
                          child: Container(
                            height: height * 0.06,
                            width: width * 0.4,
                            child: Center(
                                child: Text(
                              'Or Signup With',
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
                              decoration: const BoxDecoration(
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
