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
  List<HomePageModelClass> cartItemsList = [];

  decrement(int index, int item, int price) {
    print('decre Call');
    var i = item - 1;
    print(i);
    var p = i * price;
    print(p);
    cartItemsList[index].count = i;
    cartItemsList[index].totalPrice = p;
    update();
  }

  increment(int index, int item, int price) {
    print('Increment Call');
    var i = item + 1;
    print(i);
    var p = i * price;
    print(p);
    cartItemsList[index].count = i;
    cartItemsList[index].totalPrice = p;
    update();
  }

  totalall() {
    print(cartItemsList.length);
    totalprice = 0;

    for (int i = 0; i < cartItemsList.length; i++) {
      totalprice = totalprice + cartItemsList[i].totalPrice;
    }

    update();
  }

//add item to list
  addDataTOCart(HomePageModelClass model) {
    cartItemsList.add(model);
    update();
  }

  ///////////
  List<bool> valuesChecking = [];

// for check item is present?
  Future<ResponseModelClass?> checkIfPresent(HomePageModelClass model) async {
    ResponseModelClass? responsemodel;

    for (int i = 0; i < cartItemsList.length; i++) {
      if (cartItemsList[i].name == model.name) {
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
  updateDataToList(HomePageModelClass model, int i) {
    print(i);
    print('inside update');
    cartItemsList[i].totalPrice += model.totalPrice;
    cartItemsList[i].count += model.count;

    update();
  }
}
