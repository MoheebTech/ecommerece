

// ignore: undefined_shown_name
import 'dart:io';

import 'package:ecommerece/controller/user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/mobile_app/Add_Card.dart';
import 'package:ecommerece/mobile_app/Loginscreen.dart';
import 'package:ecommerece/mobile_app/model_classes/static_value.dart';
import 'package:ecommerece/mobile_app/pages/Details.dart';
import 'package:ecommerece/mobile_app/pages/Notification.dart';
import 'package:ecommerece/mobile_app/pages/Order.dart';
import 'package:ecommerece/them_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model_classes/userModel.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController searchcontroller = TextEditingController();
  final FirebaseAuth auth=FirebaseAuth.instance;
  final imagepicker=ImagePicker();

  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;

 XFile? profileimg;
  _getFromGallery(userID)  async{
   final XFile? pickedFile = await imagepicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
setState(() {
  profileimg=pickedFile;

});     postImage(profileimg!,userID);

    }else{
      print('select image');}}
      Future postImage(XFile? imagefile,uid)async{
     String urls;
   Reference ref=FirebaseStorage.instance.ref().child('/users').child(imagefile!.name).child(uid);
       await ref.putData(await imagefile.readAsBytes(),
          SettableMetadata(
      contentType: "users/jpeg",) 
       );
       print("res $ref");
       urls=await ref.getDownloadURL();
       return urls;
   
   }
   
    Future updateDBProfile(XFile? imagefile)async{
   
       try{
       print("image URL: ${postImage}");
   await firebaseFirestore.collection("users").doc(StaticDate.uid).update(
        {"profileimage":postImage});
     
        Fluttertoast.showToast(
          msg: " Profile Update Successfully",
          backgroundColor: Colors.green,
          fontSize: 16.0,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_SHORT,
        );
}  on FirebaseAuthException catch (e) {
     Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.red,
          fontSize: 16.0,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_SHORT,
        );    
   }
   }
      
  
    logout()async{
  await auth.signOut();
    clearSF();
     Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
    }

  clearSF()async{
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     sharedPreferences.getKeys();
     sharedPreferences.clear();
  }
  @override
  void initState() {
    Get.put(UserController());
    // TODO: implement initState
    super.initState();
  
  }

  Widget build(BuildContext context) {
  var  height = MediaQuery.of(context).size.height;
  var  width = MediaQuery.of(context).size.width;

    return  WillPopScope(
        onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
        backgroundColor: MyThemeClass.primaryColor,
                    title:Text(
                      'My Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyThemeClass.whiteColor,
                      ),
                    ), 
          actions: [
          Padding(
                    padding: EdgeInsets.only(right: width * 0.05),
                    child: Icon(
                      Icons.shopping_bag,
                      size: width * 0.06,
                      color: MyThemeClass.whiteColor,
                    ),
                  ),
          ],
          
        ),
        body:
        StreamBuilder<List<UserModel>>(
          stream: UserController.to.filter(StaticDate.uid!),
          builder: (context, snapshot) {
           if (snapshot.hasError) {
                    return Text('Something went wrong! ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final model = snapshot.data![0];
                    print("image :: ${model.profileImage}");
            return Column(
              children: [
                 
                Padding(
                  padding: EdgeInsets.only(),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                    SizedBox(
                      height: height * 0.3,
                            child:
                              Container(
                                      height: height * 0.3,
                                      width: width,
                                      decoration: BoxDecoration(
                                           color: Colors.amber,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                               image:
                                             AssetImage('images/ok.jpg')
                                              )
                                              ),
                                    child: Align(
                                     alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding:  EdgeInsets.only(left: width*0.3),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.camera_alt_outlined,color: MyThemeClass.whiteColor,),
                                              onPressed: (){
                                                _getFromGallery(StaticDate.uid);
                                              },
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(backgroundColor: MyThemeClass.secoundryColor,),
                                            onPressed: (){
                                            postImage(profileimg,StaticDate.uid);
                                            },
                                            child: Text("Update"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                   
                                )
                             
                          ),
                      
                              profileimg==null&&model.profileImage==null?CircleAvatar(
                                   radius: 70,
                                   backgroundColor: Colors.yellow.shade800,
                                 
                                  backgroundImage:
                                   AssetImage('images/ok.jpg'),
                                   ):model.profileImage!.isNotEmpty?CircleAvatar(
                                   radius: 70,
                                  //  backgroundColor: Colors.red,
                                 
                                  backgroundImage:
                                   NetworkImage(model.profileImage!),
                                   ):profileimg!=null?CircleAvatar(
                                   radius: 70,
                                   backgroundColor: Colors.yellow.shade800,
                                 backgroundImage: FileImage(File(profileimg!.path)),
                                 
                                   ):CircleAvatar(
                                   radius: 70,
                                   backgroundColor: Colors.transparent,
                                 
                                  backgroundImage:
                                   AssetImage('images/ok.jpg'),
                                   )
                                         
                     
      
                   ],
                  ),
                ),
                             Expanded(
                            child: Container(
                              height: height*0.4,
                              width: width,
                              color: MyThemeClass.primaryColor,
                              child:
                                  
                                   ListView(
                                    children: [
                                      Container(
                                        height: height * 0.03,
                                        width: width,
                                        child: Center(
                                          child: Text(
                                            'Hey,',
                                            style: TextStyle(
                                                color: MyThemeClass.whiteColor,
                                                fontSize: width * 0.04),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: height * 0.04,
                                        width: width,
                                        child: Center(
                                          child: Text(
                                            '${model.name}',
                                            style: TextStyle(
                                              color: MyThemeClass.whiteColor,
                                              fontSize: width * 0.06,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: height * 0.02),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => OrderClass()));
                                          },
                                          child: Container(
                                            height: height * 0.04,
                                            width: width,
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(left: width * 0.02),
                                                    child: Container(
                                                        child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.check_box,
                                                          color: MyThemeClass.whiteColor,
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              left: width * 0.05),
                                                          child: Text(
                                                            'My Orders',
                                                            style: TextStyle(
                                                              color: MyThemeClass.whiteColor,
                                                              fontSize: width * 0.05,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(right: width * 0.02),
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: MyThemeClass.whiteColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: width * 0.001,
                                        color: MyThemeClass.whiteColor,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NotificationScreen()));
                                        },
                                        child: Container(
                                          height: height * 0.04,
                                          width: width,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: width * 0.02),
                                                  child: Container(
                                                      child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.notification_important,
                                                        color: MyThemeClass.whiteColor,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: width * 0.05),
                                                        child: Text(
                                                          'Notification',
                                                          style: TextStyle(
                                                            color: MyThemeClass.whiteColor,
                                                            fontSize: width * 0.05,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(right: width * 0.02),
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: MyThemeClass.whiteColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: width * 0.001,
                                        color: MyThemeClass.whiteColor,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          UserModel models=UserModel(
                                            email:model.email,
                                            name:model.name,
                                            uid:model.uid,
                                            status:model.status,
                                            address:model.address
            
                                          );
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => DetailsScreen(
                                                    model: models,
                                                  )));
                                        },
                                        child: Container(
                                          height: height * 0.04,
                                          width: width,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: width * 0.02),
                                                  child: Container(
                                                      child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.card_travel,
                                                        color: MyThemeClass.whiteColor,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: width * 0.05),
                                                        child: Text(
                                                          'My Details',
                                                          style: TextStyle(
                                                            color: MyThemeClass.whiteColor,
                                                            fontSize: width * 0.05,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(right: width * 0.02),
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: MyThemeClass.whiteColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: width * 0.001,
                                        color: MyThemeClass.whiteColor,
                                      ),
                                      Container(
                                        height: height * 0.04,
                                        width: width,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: width * 0.02),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                AddCardDetails()));
                                                  },
                                                  child: Container(
                                                      child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.card_travel,
                                                        color: MyThemeClass.whiteColor,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: width * 0.05),
                                                        child: Text(
                                                          'Payment Methods',
                                                          style: TextStyle(
                                                            color: MyThemeClass.whiteColor,
                                                            fontSize: width * 0.05,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(right: width * 0.02),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: MyThemeClass.whiteColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: width * 0.001,
                                        color: MyThemeClass.whiteColor,
                                      ),
                                      Container(
                                        height: height * 0.04,
                                        width: width,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: width * 0.02),
                                                child: Container(
                                                    child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.card_travel,
                                                      color: MyThemeClass.whiteColor,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.only(left: width * 0.05),
                                                      child: Text(
                                                        'Dark Mood',
                                                        style: TextStyle(
                                                          color: MyThemeClass.whiteColor,
                                                          fontSize: width * 0.05,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(right: width * 0.02),
                                                child: LiteRollingSwitch(
                                                  animationDuration:
                                                    const  Duration(milliseconds: 800),
                                                  colorOn: MyThemeClass.secoundryColor,
                                                  colorOff: MyThemeClass.primaryColor,
                                                  iconOff: Icons.power_settings_new,
                                                  iconOn: Icons.check,
                                                  onChanged: (bool state) {
                                                    print('turned ${(state) ? 'Yes' : 'No'}');
                                                  },
                                                  onDoubleTap: (){},
                                                  onSwipe: (){},
                                                  onTap: (){},
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: width * 0.001,
                                        color: MyThemeClass.whiteColor,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // OrderModelClas order=OrderModelClas();
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) => RatingScreen(
                                          //           ordermodel: order,
                                          //         )));
                                        },
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: width * 0.02),
                                                  child: Container(
                                                      child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: MyThemeClass.whiteColor,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: width * 0.05),
                                                        child: Text(
                                                          'Rate Us',
                                                          style: TextStyle(
                                                            color: MyThemeClass.whiteColor,
                                                            fontSize: width * 0.05,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: width * 0.001,
                                        color: MyThemeClass.whiteColor,
                                      ),
                                      InkWell(
                                        onTap: () {
                                         logout();
            
                                          print('Data clear');
                                        },
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: width,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: width * 0.02),
                                                  child: Container(
                                                      child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.logout,
                                                        color: MyThemeClass.whiteColor,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: width * 0.05),
                                                        child: Text(
                                                          'Log Out',
                                                          style: TextStyle(
                                                            color: MyThemeClass.whiteColor,
                                                            fontSize: width * 0.05,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                
                            ),
                          )
                        ],
                      );
          }else if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else{
            return SizedBox();
            }
      
          }
        )
      
      ),
    );
  }
 
  
}

