
import 'package:flutter/material.dart';

import '../../them_data.dart';

class Colorselect extends StatelessWidget {
  final String? title;
  final Color? color;
  final VoidCallback? onTap;
  final bool? selected;

   Colorselect({Key? key, this.title, this.color, this.onTap, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      
                    // border:selected==false? Border.all( color: Colors.green, width: 1):Border.all(),
      child: Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Container(
                        decoration: BoxDecoration(
                             border:selected==true? Border.all( color: Colors.green, width: 3):Border.all(color: Colors.transparent),
                            color:color,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            )),
                        height: height * 0.06,
                        width: width * 0.12,
                      ),
                    ),
    );
  }
}

class SelectSized extends StatelessWidget {
  final String? sizes;
  final VoidCallback? onTap;
  final bool? selected;
   SelectSized({Key? key, this.sizes, this.onTap, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  InkWell(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.only(left: width*0.02),
        child:Container(
                            decoration: BoxDecoration(
                                // color: Color(0xff41382F),
                                border:selected==false? Border.all(
                                    width: width * 0.003,
                                    color: MyThemeClass.whiteColor):Border.all(
                                    width: width * 0.004,
                                    color:Colors.green),
                                borderRadius: BorderRadius.circular(15)),
                            height: height * 0.06,
                            width: width * 0.12,
                            child: Center(
                                child: Text(
                              sizes!,
                              style: TextStyle(
                                color: MyThemeClass.whiteColor,
                               // fontSize: width * 0.04,
                              ),
                            )),
                          ),
      ),
    );
  }
}