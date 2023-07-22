

// ignore: undefined_shown_name
import 'package:flutter/foundation.dart' show Uint8List, Unit8List;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/mobile_app/Add_Card.dart';
import 'package:ecommerece/mobile_app/Loginscreen.dart';
import 'package:ecommerece/mobile_app/model_classes/order_modelclass.dart';
import 'package:ecommerece/mobile_app/model_classes/static_value.dart';
import 'package:ecommerece/mobile_app/pages/Details.dart';
import 'package:ecommerece/mobile_app/pages/Notification.dart';
import 'package:ecommerece/mobile_app/pages/Order.dart';
import 'package:ecommerece/mobile_app/pages/rating_screen.dart';
import 'package:ecommerece/them_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  Uint8List? image;
     String imageUrls="";
  // deleteDataSf() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.remove('loginId');
  // }
  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
     List<UserModel> userdetails=[];
     getuserdetails()async{
      await firebaseFirestore.collection("users").where("uid",isEqualTo: StaticDate.uid).get().then((value) {
      value.docs.forEach((element) {
        setState(() {
          userdetails.add(UserModel.fromMap(element.data()));
        });
      });
      });
     }
 XFile? profileimg;
   /// Get from gallery
  _getFromGallery()  async{
   final XFile? pickedFile = await imagepicker.pickImage(source: ImageSource.gallery);
    // getImage(
    //   source: ImageSource.gallery,
    //   maxWidth: 1800,
    //   maxHeight: 1800,
    // );
    if (pickedFile != null) {
profileimg=pickedFile;
print('pickedFile${pickedFile}');
     image= await pickedFile.readAsBytes();
print('image${image}');
    }else{
      print('select image');}}
  /// post image on firebase 
    Future postImage(XFile? imagefile)async{
     String urls;
  //   await Permission.photos.request();
   Reference ref=FirebaseStorage.instance.ref().child('/image').child(imagefile!.name);
   
   
       await ref.putData(await imagefile.readAsBytes(),
          SettableMetadata(
      contentType: "image/jpeg",) 
       );
       urls=await ref.getDownloadURL();
       try{
         
       await firebaseFirestore.collection("users").doc(StaticDate.uid).update(
        {"profileimage":urls}
       );
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
        updateprofile()async{
     await postImage(profileimg);
  }
  
  /// userprofiledetails
//        List<AddressModel> profiledetails=[];
//           profiledata() async{
//       await firebaseFirestore.collection("usersadrres").where("uid",isEqualTo: StaticDate.uid).get().then((value) {
//          value.docs.forEach((element) {
//         setState(() {
//           profiledetails.add(AddressModel.fromMap(element.data()));
//         });
//       });
//       });
// }
     // profile
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
    getuserdetails();
    // TODO: implement initState
    super.initState();
  
  }

  Widget build(BuildContext context) {
  var  height = MediaQuery.of(context).size.height;
  var  width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      backgroundColor: MyThemeClass.primaryColor,
        leading:  IconButton(
                    icon: Icon(
                    Icons.arrow_back_ios,
                    color: MyThemeClass.whiteColor,
                    size: width * 0.06,
                  ),
                  onPressed: (){
                    Navigator.pop(context,context);
                  },
                  ),
                  title:Text(
                    'My Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                     // fontSize: width * 0.06,
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
      body:userdetails.length==0?Center(child: CircularProgressIndicator(),):
      Column(
        children: [
     
          Padding(
            padding: EdgeInsets.only(),
            child: Stack(
              children: [
              SizedBox(
                height: height * 0.3,
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index){
                          return image==null?Container(
                                height: height * 0.3,
                                width: width,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                         image:
                                        //   NetworkImage("
                                        //  ${File(image[index].path).path}")
                                       AssetImage('images/ok.jpg')
                                       //MemoryImage(image!)
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
                                        icon: Icon(Icons.camera_alt_outlined,color: MyThemeClass.secoundryColor,),
                                        onPressed: (){
                                          _getFromGallery();
                                        },
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(backgroundColor: MyThemeClass.secoundryColor,),
                                      onPressed: (){
                                      postImage(profileimg);
                                      },
                                      child: Text("Update"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                             
                          ):Container(
                                height: height * 0.3,
                                width: width,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                         image:
                                        //   NetworkImage("
                                        //  ${File(image[index].path).path}")
                                      // AssetImage('images/ok.jpg')
                                       MemoryImage(image!)
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
                                        icon: Icon(Icons.camera_alt_outlined,color: MyThemeClass.secoundryColor,),
                                        onPressed: (){
                                          _getFromGallery();
                                        },
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(backgroundColor: MyThemeClass.secoundryColor,),
                                      onPressed: (){
                                      postImage(profileimg);
                                      },
                                      child: Text("Update"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                             
                          );
                        }
                      ),
                    ),
                SizedBox(
                  height: height*0.3,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index){
                      return userdetails[index].profileImage==null? Align(
                        alignment: Alignment.center,
                        child:CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.yellow.shade800,
                        
                         backgroundImage:
                          AssetImage('images/ok.jpg'),
                          //NetworkImage("${userdetails[index].profileImage![0]}")
                          ),
                        // child: Image.network("${userdetails[index].profileImage![index]}"),
                      
                      ):Align(
                        alignment: Alignment.center,
                        child:CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.yellow.shade800,
                        
                         backgroundImage:
                        //  AssetImage('images/ok.jpg'),
                          NetworkImage("${userdetails[index].profileImage}")),
                        // child: Image.network("${userdetails[index].profileImage![index]}"),
                      
                      );
                    }
                  ),
                ),
                
                  //  Container(
                  //   height: height * 0.2,
                  //   width: width * 0.3,
                  //   decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //           fit: BoxFit.cover,
                  //           image: NetworkImage("${userdetails[0].profileimage![0]}")),
                  //       color: Colors.amber,
                  //       shape: BoxShape.circle),
                  // ),
              //  ),
              ],
            ),
          ),
                       Expanded(
                      child: Container(
                        height: height,
                        width: width,
                        color: MyThemeClass.primaryColor,
                        child:ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) 
                          {
                            return Flex(
                              direction: Axis.vertical,
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
                                      '${userdetails[index].name}',
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
                                    UserModel model=UserModel(
                                      email: userdetails[index].email,
                                      name: userdetails[index].name,
                                      uid: userdetails[index].uid,
                                      status: userdetails[index].status,
                                      address: userdetails[index].address

                                    );
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                              model: model,
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
                                    OrderModelClas order=OrderModelClas();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RatingScreen(
                                              ordermodel: order,
                                            )));
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
                            );
                          }
                        ),
                      ),
                    )
                  ],
                )

    );
  }
 
  
}

