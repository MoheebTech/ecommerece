import 'package:ecommerece/admin_pannel/admin_model/product_model.dart';
import 'package:ecommerece/mobile_app/model_classes/homepage_modelclass.dart';
import 'package:get/get.dart';

class ConterController extends GetxController {
  static ConterController get to => Get.find();

  int numbr = 1;
  var found = false;

  // int total = 299;
  // int total1 = 199;
  // int price = 299;
  // int price1 = 199;
  int totalprice = 0;
  List<ProductModel> cartItemsList = [];

  decrement(int index, int item, int price) {
    print('decre Call');
    var i = item - 1;
    print(i);
    var p = i * price;
    print(p);
    cartItemsList[index].count = i;
    cartItemsList[index].totalprice = p;
    update();
  }

  increment(int index, int item, int price) {
    print('Increment Call');
    var i = item + 1;
    print(i);
    var p = i * price;
    print(p);
    cartItemsList[index].count = i;
    cartItemsList[index].totalprice = p;
    update();
  }

  totalall() {
    print(cartItemsList.length);
    totalprice = 0;

    for (int i = 0; i < cartItemsList.length; i++) {
      totalprice = totalprice + cartItemsList[i].totalprice!;
    }

    update();
  }

//add item to list
  addDataTOCart(ProductModel model) {
    cartItemsList.add(model);
    update();
  }

  ///////////
  List<bool> valuesChecking = [];

// for check item is present?
  Future<ResponseModelClass?> checkIfPresent(ProductModel model) async {
    ResponseModelClass? responsemodel;

    for (int i = 0; i < cartItemsList.length; i++) {
      if (cartItemsList[i].productname == model.productname) {
        print("item found: do not add");
        print(i);
        responsemodel = ResponseModelClass(index: i, isPresent: true);
        i = cartItemsList.length;
        update();
      } else {
        responsemodel = ResponseModelClass(index: 00, isPresent: false);
      }
    }
    return responsemodel;
  }

  //update Data in the list
  updateDataToList(ProductModel model, int i) {
    print(i);
    print('inside update');
    cartItemsList[i].totalprice = model.totalprice!;
    cartItemsList[i].count = model.count!;

    update();
  }
}
