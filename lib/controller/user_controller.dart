import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/mobile_app/model_classes/userModel.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  static UserController get to=>Get.find();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Stream<List<UserModel>> filter(uid) => FirebaseFirestore.instance
      .collection('users')
      .where(
        'uid',
        isEqualTo: uid,
      )
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((document) => UserModel.fromMap(document.data()))
          .toList());
}