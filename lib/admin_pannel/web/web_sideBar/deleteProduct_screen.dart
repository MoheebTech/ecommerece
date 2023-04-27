import 'package:flutter/cupertino.dart';

class DeleteProduct extends StatelessWidget {
 // const DeleteProduct({super.key});
static const String id="DeleteProduct";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("DeleteProduct",style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}