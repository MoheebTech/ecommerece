import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/admin_pannel/web/web_sideBar/update_complete_screen.dart';
import 'package:ecommerece/them_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../admin_model/product_model.dart';

class UpdateProduct extends StatefulWidget {
   //UpdateProduct({super.key});
static const String id="updateproduct";

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
     var width=MediaQuery.of(context).size.width;
    return Scaffold(
      
      body: Column(
        children: [
         
          
           Container(
             child: StreamBuilder<QuerySnapshot>(
                    stream: firebaseFirestore
                        .collection('Products').snapshots(),
                    builder: (context, snapshot) {
                      final data=snapshot.data!.docs;
                      return snapshot.hasData
                          ? snapshot.data != null
                              ? SizedBox(
                                  height:height*0.8,
                                  width: width,
                                  child: ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        
                                          return Card(
                                            elevation: 6,
                                            
                                             color: MyThemeClass.lightsecoundryColor,
                                            child: ListTile(
                                              focusColor: MyThemeClass.lightsecoundryColor,
                                              trailing: Container(
                                                width: width*0.2,
                                                  
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    InkWell(
                                                      onTap: (){
                                                        deleteProduct(data[index].id);
                                                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>const UpdateCompleteScreen()));
                                                      },
                                                      child:  Icon(
                                                        Icons.delete,
                                                       color: MyThemeClass.redColor,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: (){
                                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateCompleteScreen(
                                                          id: data[index].id,

                                                          productModel: ProductModel(
                                                            category: data[index].get('category'),
                                                            details: data[index].get('details'),
                                                            discountprice: data[index].get('discountprice'),
                                                            id: data[index].get('id'),
                                                            imageUrls: data[index]["imageUrls"],
                                                            isFavourit: data[index].get('isFavourit'),
                                                            isOnSale: data[index].get('isOnSale'),
                                                            isPopular: data[index].get('isPopular'),
                                                            price: data[index].get('price'),
                                                            productname: data[index].get('productname'),
                                                            selerialCode: data[index].get('selerialCode'),
                                                            brand: data[index].get("brand"),

                                                          ),
                                                        )));
                                                        print("image :"+data[index]["imageUrls"]);
                                                      },
                                                      child:  Icon(
                                                        Icons.edit,
                                                        color: MyThemeClass.greenColor
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              title: Text(
                                                "${snapshot.data!.docs[index].get('productname')}",
                                                style:  TextStyle(
                                                    color:MyThemeClass.secoundryColor,
                                                    fontSize: 20),
                                              ),
                                             
                                              ),
                                            );
                              } )):Center(child: Text("No Data Exist",style: TextStyle(color: MyThemeClass.secoundryColor),),)
                                      :const CircularProgressIndicator();
                              }),
           )
                                      
                              
                           // : const Center(child: CircularProgressIndicator())
                     //   : const Center(child: Text('Empty'));
                  
        ],
      ),
    );
  }
  // delete product on firebase

 Future <void>deleteProduct(String id)async{
  try{
await firebaseFirestore.collection("Products").doc(id).delete();
  Fluttertoast.showToast(
          msg: " Product Delete Successfully",
          backgroundColor: Colors.green,
          fontSize: 16.0,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_SHORT,
        );
 }on FirebaseAuthException catch (e) {
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
}