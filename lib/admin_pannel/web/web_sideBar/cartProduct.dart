
import 'package:flutter/cupertino.dart';

class CartProduct extends StatelessWidget {
  //const CartProduct({super.key});
static const String id="CartProduct";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("CartProduct",style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}