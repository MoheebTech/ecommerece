import 'package:flutter/cupertino.dart';

class Dashboard extends StatelessWidget {
  //const Dashboard({super.key});
  static const String id="Dashboard";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("DashBoard",style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}