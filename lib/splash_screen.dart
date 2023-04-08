import 'package:ecommerece/Loginscreen.dart';
import 'package:ecommerece/home_page.dart';
import 'package:ecommerece/introduction_screen.dart';
import 'package:ecommerece/mobile_app/models/static_value.dart';
import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var height, width;
  void getDataFromSf() async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    String? value = sharedPreferences.getString('UserID',);

    //bool? intro = sharedPreferences.getBool('introValue');

    if (value == null) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => IntroductionScreen()));
      });
    } 
    // ignore: unnecessary_null_comparison
    else if (value == null) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Loginscreen()));
      });
    } 
    else {
     
       StaticDate.uid=value;
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage()));
      });
    }
  }

  @override
   
  void initState() {
    getDataFromSf();
    super.initState();
  }
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/hafeez.jpg'))),
              height: height,
              width: width,
            ),
            Container(
              height: height,
              width: width,
              color: MyThemeClass.primaryColor.withOpacity(0.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'RIGEL',
                    style: TextStyle(
                        fontSize: width * 0.25,
                        color: MyThemeClass.secoundryColor),
                  ),
                  Text(
                    'Beacuse Shoes take you place',
                    style: TextStyle(
                        fontSize: width * 0.055,
                        color: MyThemeClass.secoundryColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
