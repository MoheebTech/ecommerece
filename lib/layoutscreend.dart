import 'package:flutter/cupertino.dart';

class LayoutScreen extends StatelessWidget {
 Widget mobilebody;
  Widget desktopbody;
   LayoutScreen({Key? key,required this.desktopbody,required this.mobilebody}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:(context,constains){
          if(constains.maxWidth<600){
            return mobilebody; 
          }
          else{
            return desktopbody;
          }
         }
       );
  }
}