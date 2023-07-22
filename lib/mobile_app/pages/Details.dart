import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/mobile_app/home_page.dart';
import 'package:ecommerece/mobile_app/model_classes/static_value.dart';
import 'package:ecommerece/mobile_app/pages/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerece/mobile_app/model_classes/userModel.dart';
import 'package:ecommerece/them_data.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model_classes/address_model.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget{
  UserModel model;
  DetailsScreen({
    Key? key,
    required this.model,
  }) : super(key: key);
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}
class _DetailsScreenState extends State<DetailsScreen> {
  var height, width;
  TextEditingController addresscontro=TextEditingController();
    TextEditingController phonecontr=TextEditingController();
    FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
      List<UserModel> userdetails=[];
     final _formKey = GlobalKey<FormState>();
    //  //  get index => null;
    //  getuserdetails()async{
    //   await firebaseFirestore.collection("users").where("uid",isEqualTo: StaticDate.uid).get().then((value) {
    //   value.docs.forEach((element) {
    //     setState(() {
    //       userdetails.add(UserModel.fromMap(element.data()));
    //     });
    //   });
    //   });
    //  }
  
     updateAddress()async{
             try {
      await firebaseFirestore
          .collection("users")
          .doc(StaticDate.uid).update(
            {
            "number":phonecontr.text,
             "address":addresscontro.text,
            }
          );
          //.set(addressmodel.toMap());
      Fluttertoast.showToast(
        msg: "Your Address Update Successfully",
        backgroundColor: Colors.green,
        fontSize: 16.0,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.green,
        fontSize: 16.0,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
     }
  @override
   void initState() {
   // getuserdetails();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView.builder(
            
                itemBuilder: (context, index){
                  return Container(
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
                                  'NAME',
                                  style: TextStyle(
                                    color: Colors.white38,
                                    fontSize: width * 0.04,
                                  ),
                                ),
                                Text(
                                   '${widget.model.name}',
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5,
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: SizedBox(
                              height: height*0.07,
                            child: Textformfield(
                                          abscureText: false,
                                          controller: phonecontr,
                                          hinttext: 'Phone Number',
                                          // inputaction: TextInputAction.continueAction,
                                          keyboardtype:
                                              TextInputType.emailAddress,
                                          // prefixIcon: Icon(
                                          //   Icons.person,
                                          //   color: MyThemeClass.whiteColor,
                                          // ),
                                          validation: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your Number';
                                            }
      
                                            return null;
                                          }),
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
                          height: height * 0.1,
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
                                   '${widget.model.email}',
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
                         color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: SizedBox(
                          height: height*0.1,
                          child: TextFormField(
                          controller: addresscontro,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Address must be Enter";
                            }
                          },
                          cursorColor: MyThemeClass.whiteColor,
                          style: TextStyle(color: MyThemeClass.whiteColor),
                          maxLines: 2,
                          decoration:InputDecoration(
                          hintText: 'Enter Address',
                          hintStyle: TextStyle(fontSize: 0, color: Colors.white),
                          border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15.0)),
            filled: true,
          
           // prefixIcon: prefixIcon,
            //suffix: suffixIcon,
             fillColor: Colors.black,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15.0))
                          ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      // Card(
                      //   elevation: 5,
                      //   color: Colors.white,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(15)),
                      //   child: Container(
                      //     height: height * 0.13,
                      //     width: width * 0.9,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(15),
                      //       color: MyThemeClass.transColor?.withOpacity(0.1),
                      //     ),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Container(
                      //           height: height,
                      //           width: width * 0.5,
                      //           // color: Colors.red,
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: Column(
                      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 Text(
                      //                   'House no# 664-D',
                      //                   style: TextStyle(
                      //                     fontSize: width * 0.04,
                      //                   ),
                      //                 ),
                      //                 Text(
                      //                   'Block-7H,Streat 4',
                      //                   style: TextStyle(
                      //                     fontSize: width * 0.04,
                      //                     // fontWeight: FontWeight.bold,
                      //                   ),
                      //                 ),
                      //                 Text(
                      //                   'Dallas,Taxes.',
                      //                   style: TextStyle(
                      //                     fontSize: width * 0.04,
                      //                     // fontWeight: FontWeight.bold,
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         Container(
                      //           height: height,
                      //           width: width * 0.2,
                      //           // color: Colors.green,
                      //           child: Icon(
                      //             Icons.check_box,
                      //             size: width * 0.06,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: height * 0.04),
                      InkWell(
                        onTap: (){
                          if(_formKey.currentState!.validate()){
                            updateAddress();
                          }
                        },
                        child: Container(
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
                      ),
                    ],
                  ),
            );
                }
        
        ),
      ),
    );
  }
}
