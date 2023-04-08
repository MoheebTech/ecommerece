import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';

class Textformfield extends StatelessWidget {
  final String? hinttext;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardtype;
  final TextInputAction? inputaction;
  final String? Function(String?)? validation;
  final bool abscureText;
   final TextEditingController? controller;
  Textformfield({
    Key? key,
    this.hinttext,
    this.inputaction,
    this.keyboardtype,
    this.prefixIcon,
    this.suffixIcon,
    this.validation,
    this.controller,
    required this.abscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: abscureText,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: MyThemeClass.whiteColor,
        keyboardType: keyboardtype,
        autofocus: false,
        textInputAction: inputaction,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: MyThemeClass.whiteColor,
        ),
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(color: MyThemeClass.whiteColor),
          contentPadding: const EdgeInsets.
              //symmetric(horizontal: width*0.6,vertical: height*0.02),
              fromLTRB(20.0, 0.0, 20.0, 0.0),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(32.0)),
          filled: true,
          prefixIcon: prefixIcon,
          suffix: suffixIcon,
          fillColor: Colors.black,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(32.0)),
        ),
        validator: validation
        // (value) {
        //                         if (value == null ||
        //                         value.isEmpty) {
        //                         return 'Please enter your name';
        //                              }
        //                         return null;
        //                                                     },
        );
  }
}
