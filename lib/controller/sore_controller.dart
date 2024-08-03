import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StoreController extends GetxController{
  static StoreController get to =>Get.find();

 final imagepicker=ImagePicker();
     List<XFile> image=[];
     List<String> imageUrls=[];

   /// Get from galleryd 
  _getFromGallery()  async{
   final List<XFile> pickedFile = await imagepicker.pickMultiImage();
    // getImage(
    //   source: ImageSource.gallery,
    //   maxWidth: 1800,. 12
    //   maxHeight: 1800,
    // );
    if (pickedFile != null) {
   
        image.addAll(pickedFile);
      update();
    }else{
      print('select image');}}
}