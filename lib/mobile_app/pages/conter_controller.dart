import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/admin_pannel/admin_model/product_model.dart';
import 'package:ecommerece/mobile_app/model_classes/homepage_modelclass.dart';
import 'package:ecommerece/mobile_app/model_classes/order_modelclass.dart';
import 'package:get/get.dart';

import '../model_classes/static_value.dart';

class ConterController extends GetxController {
  static ConterController get to => Get.find();

  int numbr = 1;
  var found = false;

  // int total = 299;
  // int total1 = 199;
  // int price = 299;
  // int price1 = 199;
  int totalprice = 0;
  List<OrderModelClas> cartItemsList = [];

     getOrders()async{
  await FirebaseFirestore.instance.collection("Orders").doc(StaticDate.uid).collection("IsProgress").get().then((value) {
    value.docs.forEach((element) {
      
        cartItemsList.add(OrderModelClas.fromMap(element.data()));
      update();
    });
  });
  print("orders ${cartItemsList}");
 print("orders list length ${cartItemsList.length}"); 
 update();
}    

  decrement(int index, int item, int price) {
    print('decre Call');
    var i = item - 1;
    print(i);
    var p = i * price;
    print(p);
    cartItemsList[index].quantity = i;
    cartItemsList[index].price = p;
    update();
  }

  increment(int index, int item, int price) {
    print('Increment Call');
    var i = item + 1;
    print(i);
    var p = i * price;
    print(p);
    cartItemsList[index].quantity = i;
    cartItemsList[index].price = p;
    update();
  }

  totalall() {
    print(cartItemsList.length);
    totalprice = 0;

    for (int i = 0; i < cartItemsList.length; i++) {
      totalprice = totalprice + cartItemsList[i].price!;
    }

    update();
  }

//add item to list
  addDataTOCart(OrderModelClas modelone) {
    cartItemsList.add(modelone);
    update();
  }

  ///////////
  List<bool> valuesChecking = [];

// // for check item is present?
//   Future<OrderModelClas?> checkIfPresent(OrderModelClas model) async {
//     OrderModelClas? responsemodel;

//     for (int i = 0; i < cartItemsList.length; i++) {
//       if (cartItemsList[i].productname == model.productname) {
//         print("item found: do not add");
//         print(i);
//         responsemodel = OrderModelClas(index: i, isPresent: true);
//         i = cartItemsList.length;
//         update();
//       } else {
//         responsemodel = OrderModelClas(index: 00, isPresent: false);
//       }
//     }
//     return responsemodel;
//   }

//   //update Data in the list
//   updateDataToList(OrderModelClas model, int i) {
//     print(i);
//     print('inside update');
//     cartItemsList[i].price = model.totalprice!;
//     cartItemsList[i].quantity = model.count!;

//     update();
//   }
}
