import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';

import '../../../mobile_app/pages/textformfield.dart';
import '../../../them_data.dart';
import '../../admin_model/product_model.dart';

// ignore: must_be_immutable
class UpdateCompleteScreen extends StatefulWidget {
  String? id;
  ProductModel? productModel;
  UpdateCompleteScreen({
    Key? key,
    this.id,
    this.productModel,
  }) : super(key: key);

  @override
  State<UpdateCompleteScreen> createState() => _UpdateCompleteScreenState();
}

class _UpdateCompleteScreenState extends State<UpdateCompleteScreen> {
  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  TextEditingController productnamecontr=TextEditingController();
   TextEditingController brandcontroller=TextEditingController();
  TextEditingController detailcontr=TextEditingController();
  TextEditingController pricecontr=TextEditingController();
  TextEditingController serialcodecontr=TextEditingController();
  TextEditingController discountpriceC=TextEditingController();
  bool isOnSale=false;
  bool isPopular=false;
  bool isFavourit=false;
  String uuid=Uuid().v4();
 final imagepicker=ImagePicker();
  List<XFile> image=[];
  List<dynamic> imageUrls=[];
  var width;
  bool isSaving=false;
  bool isloading=false;
   String dropdownValue = 'GROCERY';

   List categories=[
    "GROCERY",
    "SHOES",
    "GARMENTS",
    "PHARMACY"
    "GARMENTS"
  ];
  /// update product
  /// 
       updateproduct(String id)async{
try{
         await uploadImage();
       await firebaseFirestore.collection("Products").doc(id).update(
        {"category":dropdownValue,
        "price":pricecontr.text,
        "discountprice":discountpriceC.text,
        "productname":productnamecontr.text,
        "selerialCode":serialcodecontr.text,
        "details":detailcontr.text,
        "isOnSale":isOnSale,
        "isPopular":isPopular,
        "imageUrls":imageUrls,
        "brand":brandcontroller.text,
        }
       );
        Fluttertoast.showToast(
          msg: "Update Product Successfully",
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
   @override
   void initState() {
    dropdownValue=widget.productModel!.category!;
    pricecontr.text=widget.productModel!.price!.toString();
    discountpriceC.text=widget.productModel!.discountprice!.toString();
    productnamecontr.text=widget.productModel!.productname!;
    serialcodecontr.text=widget.productModel!.selerialCode!;
    detailcontr.text=widget.productModel!.details!;
    
     brandcontroller.text=widget.productModel!.brand!;
   // isFavourit=widget.productModel!.isFavourit!;
    isOnSale=widget.productModel!.isOnSale!;
    isPopular=widget.productModel!.isPopular!;

  //  imageUrls=widget.productModel!.imageUrls!;
    // TODO: implement initState
    super.initState();
    
  }
  
  Widget build(BuildContext context) {
     width=MediaQuery.of(context).size.width;
     var height=MediaQuery.of(context).size.height;
    return Scaffold(
  backgroundColor: MyThemeClass.primaryColor,
      appBar: AppBar(
        backgroundColor: MyThemeClass.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: MyThemeClass.secoundryColor,),
          onPressed: (){
            Navigator.pop(context ,context);
          },
        ),
        centerTitle: true,
        title: Text('UpdateProduct',style: TextStyle(
              fontWeight: FontWeight.bold,
              color: MyThemeClass.secoundryColor,
              fontSize: 30),
      ),),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.03),
          child: Column(
        
            children: [
          //  Center(
          //     child:  Text("AddProduct",style: TextStyle(
          //       color: MyThemeClass.secoundryColor,
          //       fontWeight: FontWeight.bold,fontSize: 30
      
          //     ),),
          //   ),
              Row(
              
             mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
      
               
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
        
                       
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
                    hint: const Text('Select the Categary'),
                    focusColor: MyThemeClass.secoundryColor,
                    // borderRadius: BorderRadius.circular(20),
                    elevation: 10,
                  //  dropdownColor: Colors.black54,
      
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
              //   product Brand field        
                lableTextname("Brand Name"),
               Container(
                width: width*0.3,
                 child: Textformfield(
                  controller: brandcontroller,
                  validation: (value){
                    if(value!.isEmpty){
                      return "should not be empty";
                    }
                    return null;
                  },
          abscureText: false,
          
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
                                border: Border.all(color: Colors.black,width: 1)
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
                              icon: Icon(Icons.cancel,color: MyThemeClass.redColor,))
                          ],
                        );
                      },),
                  ),
    // Padding(
    //   padding:  EdgeInsets.only(left: 2.w,right: 40.w),
    //   child: Column(
    //     //children: widget.productModel!.imageUrls!.map((e) => Image.memory(e)).toList(),
    //       children: [
    //         ...List.generate(widget.productModel!.imageUrls!.length, (index) =>   Stack(
    //         children: [
    //           Image.network(widget.productModel!.imageUrls![index],
    //           height: height*0.1,
    //           width: width*0.1,
    //           fit: BoxFit.contain,
    //           ),
    //           IconButton(
    //         icon: Icon(Icons.cancel_rounded),
    //         onPressed: (){
    //          setState(() {
    //    image.removeAt(index);
    //             });
    //         },
    //      )
    //        ],
    //      ))
    //       ],
          
    //     ),
    // ),            
                  //      // pick image from gallary
          //      //    
          SizedBox(height: height*0.08,),
             Container(
              width: width*0.3,
               child: ElevatedButton(
           style: ElevatedButton.styleFrom(
            backgroundColor: MyThemeClass.secoundryColor,
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
        title: Text('Is this Product on Sale?',style: TextStyle(color: MyThemeClass.secoundryColor)),
        value: isOnSale, 
        inactiveThumbColor: MyThemeClass.secoundryColor,
        onChanged:(value) {
          setState(() {
            isOnSale=!isOnSale;
          });
        },),
         SwitchListTile(
        title: Text('Is this Product Popular?',style: TextStyle(color: MyThemeClass.secoundryColor),),
        value: isPopular, 
        inactiveThumbColor: MyThemeClass.secoundryColor,
        onChanged:(value) {
          setState(() {
            isPopular=!isPopular;
          });
        },),
          Container(
                    height: height*0.25,
                    width: width*0.3,
                  
                     decoration: BoxDecoration(
                        color:MyThemeClass.lightsecoundryColor,
                      borderRadius: BorderRadius.circular(20)
                     ),
                     child: GridView.builder(
                      itemCount: widget.productModel!.imageUrls!.length,
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
          
                     ),
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(

                                border: Border.all(color: Colors.black,width: 1)
                              ),
                              child:
                      //          CachedNetworkImage(
                      //    imageUrl:widget.productModel!.imageUrls![index],
                      // placeholder: (context, url) =>const CircularProgressIndicator(),
                      // errorWidget: (context, url, error) =>const Icon(Icons.error),
                      //       height: 100,
                      //         width: 100,
                      //         fit: BoxFit.cover,
                      //     ),
                              Image.network(
                                     widget.productModel!.imageUrls![index],
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              )
                          ), 
                          IconButton(
                             onPressed: (){
                               setState(() {
                            widget.productModel!.imageUrls!.removeAt(index);                     
                                } 
                                 );
                                 
                                  }, 
                              icon:Icon(Icons.cancel,color: MyThemeClass.redColor,)),
                             
                          ],
                        );
                      },),
                  ),
                  

          SizedBox(height: height*0.08,),
             Container(
              width: width*0.6,
               child: ElevatedButton(
           style: ElevatedButton.styleFrom(
            backgroundColor:MyThemeClass.secoundryColor,
            padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.03)
           ),
                onPressed: (){
                  updateproduct(widget.id!);
                 
              //    _saveData();
                },
          
                child:
                 Center(child: Text("Update PRODUCT",style: TextStyle(color: MyThemeClass.blackColor,fontWeight: FontWeight.bold),)
                )
                ),
             ),
          //  Row(
          //   children: widget.productModel!.imageUrls!.map((e) => Image.memory(e,
          //   height: height*0.2,
          //   width: width*0.2,
          //   )).toList(),
          //  )
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
      print('select image');
    }

  }
 
  /// post image on firebase 
  /// 
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
    imageUrls.addAll(widget.productModel!.imageUrls!);
   }



  // lable name 
 Widget lableTextname(String title){
   var height=MediaQuery.of(context).size.height;
  return Padding(
    padding: EdgeInsets.only(top: height*0.015,bottom: height*0.01),
    child: Text(title,style: TextStyle(color: MyThemeClass.secoundryColor,fontWeight: FontWeight.bold),),
    );
 }



     
 }
  