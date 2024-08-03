import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/admin_pannel/mobile_admin_pannel/mobile_admin_singup.dart';
import 'package:ecommerece/mobile_app/pages/textformfield.dart';
import 'package:ecommerece/them_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../admin_model/product_model.dart';

class AddProduct extends StatefulWidget {
 // const AddProduct({super.key});
  static const String id="AddProduct";
  var uuid=Uuid();
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController brandcontroller=TextEditingController();
  TextEditingController productnamecontr=TextEditingController();
  TextEditingController categorycontr=TextEditingController();
  TextEditingController detailcontr=TextEditingController();
  TextEditingController pricecontr=TextEditingController();
  TextEditingController serialcodecontr=TextEditingController();
  TextEditingController discountpriceC=TextEditingController();
  
  TextEditingController totalPrice=TextEditingController();
  TextEditingController count=TextEditingController();
  bool isOnSale=false;
  bool isPopular=false;
  bool isFavourit=false;
  String uuid=Uuid().v4();
 final imagepicker=ImagePicker();
     List<XFile> image=[];
     List<String> imageUrls=[];
  var width;
  bool isSaving=false;
  bool isloading=false;
   String dropdownValue = 'GROCERY';

   List categories=[
    "GROCERY",
    "SHOES",
    "GARMENTS",
    "PHARMACY",
    "Casmatics",
    "Computer",
     "Electronic",
       "Cloths"
  ];
  @override
  Widget build(BuildContext context) {
     width=MediaQuery.of(context).size.width;
     var height=MediaQuery.of(context).size.height;
    return Scaffold(
    backgroundColor: MyThemeClass.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.03),
          child: Column(
      
            children: [
            Center(
              child:  Text("AddProduct",style: TextStyle(
                color: MyThemeClass.secoundryColor,
                fontWeight: FontWeight.bold,fontSize: 30
      
              ),),
            ),
              Row(
              
             mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
      
               
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
           //   product id field        
          //       lableTextname("Product ID"),
          //      Container(
          //       width: width*0.3,
          //        child: Textformfield(
          //         controller: productidcontr,
          //         validation: (value){
          //           if(value!.isEmpty){
          //             return "should not be empty";
          //           }
          //           return null;
          //         },
          // abscureText: false,
          
          //        ),
          //      ),
                       
          //   product name field
          lableTextname("Product Name"),
             Container(
            width: width*0.3,
             child: Textformfield(
              controller: productnamecontr,
          abscureText: false,
          validation: (value){
                    if(value!.isEmpty){
                      return "should not be empty";
                    }
                    return null;
                  },
          
          ),
           ),
         //   category dropdownbutton       
          lableTextname("Select Category"),
           Container(
            width: width*0.3,
           // color: Colors.black54,
             child: DropdownButton(
              
              autofocus: true,
              //
                    hint:  Text('Select the Categary',style: TextStyle(color: MyThemeClass.secoundryColor),),
                    focusColor: MyThemeClass.secoundryColor,
                    // borderRadius: BorderRadius.circular(20),
                    elevation: 10,
                  //  dropdownColor: Colors.black54,
                  iconEnabledColor: MyThemeClass.secoundryColor,
                 // style: TextStyle(color: MyThemeClass.transColor),
                    underline: Container(
                      height: 0,
                    color: Colors.transparent,
                    ),
              isExpanded: true,
                 value: dropdownValue,
                 
                 onChanged: ( newValue) {
                          setState(() {
                       dropdownValue = newValue.toString();
                       });
                     },
          items: categories
          .map((e)=>DropdownMenuItem<String>(
        
          value: e,
          child: Text(e),
          
          ))
          .toList(),
          ),
           ),
             //   serial code field
            lableTextname("Brand Name"),
                Container(
            width: width*0.3,
             child: Textformfield(
              controller: brandcontroller,
          abscureText: false,
          validation: (value){
                    if(value!.isEmpty){
                      return "should not be empty";
                    }
                    return null;
                  },
          ),
           ),
            //   serial code field
            lableTextname("Serial Code"),
                Container(
            width: width*0.3,
             child: Textformfield(
              controller: serialcodecontr,
          abscureText: false,
          validation: (value){
                    if(value!.isEmpty){
                      return "should not be empty";
                    }
                    return null;
                  },
          ),
           ),
           
           //   Details field 
            lableTextname("Details"),
           Container(
            width: width*0.3,
             child: Textformfield(
              controller: detailcontr,
          abscureText: false,
          validation: (value){
                    if(value!.isEmpty){
                      return "should not be empty";
                    }
                    return null;
                  },
          ),
           ),
           Row(
           //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(right: width*0.01),
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
      //   price field              
                 lableTextname("Price"),
            Container(
            width: width*0.14,
             child: Textformfield(
              controller: pricecontr,
          abscureText: false,
          validation: (value){
                    if(value!.isEmpty){
                      return "should not be empty";
                    }
                    return null;
                  },
          ),
           ),
                  ],
                ),
              ),
               Padding(
                 padding:  EdgeInsets.only(left: width*0.01),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
        //  discount field          
                 lableTextname("Discount"),
            Container(
            width: width*0.14,
             child: Textformfield(
              controller: discountpriceC,
          abscureText: false,
          validation: (value){
                    if(value!.isEmpty){
                      return "should not be empty";
                    }
                    return null;
                  },
          ),
           ),
                  ],
              ),
               )
            ],
           ),
      Row(
           //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(right: width*0.01),
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
      //   price field              
                 lableTextname("Total Price"),
            Container(
            width: width*0.14,
             child: Textformfield(
              controller: totalPrice,
          abscureText: false,
          validation: (value){
                    if(value!.isEmpty){
                      return "should not be empty";
                    }
                    return null;
                  },
          ),
           ),
                  ],
                ),
              ),
               Padding(
                 padding:  EdgeInsets.only(left: width*0.01),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
        //  discount field          
                 lableTextname("Count"),
            Container(
            width: width*0.14,
             child: Textformfield(
              controller: count,
          abscureText: false,
          validation: (value){
                    if(value!.isEmpty){
                      return "should not be empty";
                    }
                    return null;
                  },
          ),
           ),
                  ],
              ),
               )
            ],
           )
             ],
           ),
           Column(
           // mainAxisAlignment: MainAxisAlignment.start,
        children: [
                  Container(
                    height: height*0.4,
                    width: width*0.3,
                  
                     decoration: BoxDecoration(
                        color: MyThemeClass.lightsecoundryColor,
                      borderRadius: BorderRadius.circular(20)
                     ),
                     child: GridView.builder(
                      itemCount: image.length,
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
          
                     ),
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color:MyThemeClass.secoundryColor,width: 1)
                              ),
                              child: Image.network(File(image[index].path).path,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                              setState(() {
                          image.removeAt(index);
                              });
                              }, 
                              icon: Icon(Icons.cancel))
                          ],
                        );
                      },),
                  ),
                  //      // pick image from gallary
          //      //    
          SizedBox(height: height*0.08,),
             Container(
              width: width*0.3,
               child: ElevatedButton(
           style: ElevatedButton.styleFrom(
            backgroundColor:MyThemeClass.secoundryColor,
            padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.03)
           ),
                onPressed: (){
                  _getFromGallery();
                },
          
                child:
                  Center(child: Text(" PRODUCT IMAGE",style: TextStyle(color:MyThemeClass.blackColor,fontWeight: FontWeight.bold),)
                )
                ),
             ),
        
        
        
        ],
           )
          
              ],
             ),
           SwitchListTile(
        title: Text('Is this Product on Sale?',style: TextStyle(color: MyThemeClass.secoundryColor),),
        value: isOnSale, 
        inactiveThumbColor: MyThemeClass.secoundryColor,
        onChanged:(value) {
          setState(() {
            isOnSale=!isOnSale;
          });
        },),
         SwitchListTile(
        title: Text('Is this Product Popular?',style: TextStyle(color: MyThemeClass.secoundryColor)),
        value: isPopular, 
        inactiveThumbColor: MyThemeClass.secoundryColor,
        onChanged:(value) {
          setState(() {
            isPopular=!isPopular;
          });
        },),
          SizedBox(height: height*0.08,),
             Container(
              width: width*0.6,
               child: ElevatedButton(
           style: ElevatedButton.styleFrom(
            backgroundColor:MyThemeClass.secoundryColor,
            padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.03)
           ),
                onPressed: (){
                  _saveData();
                },
          
                child:
                  Center(child: Text("SAVE PRODUCT",style: TextStyle(color:MyThemeClass.blackColor,fontWeight: FontWeight.bold),)
                )
                ),
             ),
       
            ],
          ),
        ),
      ),
    );
  }

   /// Get from gallery
  _getFromGallery()  async{
   final List<XFile> pickedFile = await imagepicker.pickMultiImage();
    // getImage(
    //   source: ImageSource.gallery,
    //   maxWidth: 1800,
    //   maxHeight: 1800,
    // );
    if (pickedFile != null) {
      setState(() {
        image.addAll(pickedFile);
      });
    }else{
      print('select image');}}
  /// post image on firebase 
    Future postImage(XFile? imagefile)async{
     String urls;
  //   await Permission.photos.request();
   Reference ref=FirebaseStorage.instance.ref().child('/image').child(imagefile!.name);
   
   if(kIsWeb){
       await ref.putData(await imagefile.readAsBytes(),
          SettableMetadata(
      contentType: "image/jpeg",) 
       );
       urls=await ref.getDownloadURL();
       return urls;
   }
   }
  
   uploadImage()async{
    for(var images in image){
      await postImage(images).then((downloadUrl) =>imageUrls.add(downloadUrl));
    }
   }

// save product on firebase

   _saveData()async{
    try{
    
    await uploadImage();
    ProductModel productModel=ProductModel(
     id: uuid,

     category: dropdownValue,
     productname: productnamecontr.text,
     selerialCode: serialcodecontr.text,
     brand: brandcontroller.text,
    price:int.tryParse(pricecontr.text),
    discountprice: discountpriceC.text,
    details: detailcontr.text,
     isFavourit: isFavourit,
     imageUrls: imageUrls,
     isOnSale: isOnSale,
     isPopular: isPopular,
    totalprice: int.tryParse(totalPrice.text),
    count:int.tryParse(count.text), 
    adminid:AdminStaticVeriable.uid
    );
   await firebaseFirestore.collection('Products').doc(uuid).set(productModel.toMap());
    Fluttertoast.showToast(
          msg: "Product Add Successfully",
          backgroundColor: Colors.green,
          fontSize: 16.0,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_SHORT,
        );
       // Future.delayed(Duration(seconds: 10),(){
          clearfield();
          setState(() {
               image.clear();
               imageUrls.clear();
          });
       
          //});
        
    }on FirebaseAuthException catch (e) {
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





  // lable name 
 Widget lableTextname(String title){
   var height=MediaQuery.of(context).size.height;
  return Padding(
    padding: EdgeInsets.only(top: height*0.015,bottom: height*0.01),
    child: Text(title,style: TextStyle(color: MyThemeClass.secoundryColor,fontWeight: FontWeight.bold),),
    );
 }


// clear field

 clearfield(){
  
//    imageUrls.clear();
 //  image.removeAt;
  productnamecontr.clear();
  detailcontr.clear();
 // dropdownValue='';
  pricecontr.clear();
  discountpriceC.clear();
  serialcodecontr.clear();
  brandcontroller.clear();
  totalPrice.clear();
  count.clear();
 }
 }
  