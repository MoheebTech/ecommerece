import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece/admin_pannel/admin_model/admin_model.dart';
import 'package:ecommerece/admin_pannel/mobile_admin_pannel/mobile_admin_singup.dart';
import 'package:ecommerece/admin_pannel/web/web_admin_home.dart';
import 'package:ecommerece/admin_pannel/web/webintroduction_screen.dart';
import 'package:ecommerece/mobile_app/home_page.dart';
import 'package:ecommerece/mobile_app/model_classes/static_value.dart';
import 'package:ecommerece/mobile_app/model_classes/userModel.dart';
import 'package:ecommerece/mobile_app/pages/introduction_screen.dart';
import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var height, width;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future userstatus()async{
    await firebaseFirestore
                    .collection('users')
                    .doc(StaticDate.uid)
                    .get()
                    .then((value) {
                  StaticDate.usermodel = UserModel.fromMap(value.data()!);
                });
   }
void getuserdata(v) async {
    await firebaseFirestore.collection('users').doc(v).get().then((value) {
      setState(
        () {
          if (value.data() == null) {
          AdminStaticVeriable.uid = v;
            Future.delayed(
              const Duration(seconds: 4),
              () async {
                await firebaseFirestore
                    .collection('Admins')
                    .doc(AdminStaticVeriable.uid)
                    .get()
                    .then((value) {
                  setState(() {
                    AdminStaticVeriable.adminModel = AdminModel.fromMap(value.data()!);
                  });
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>WebAdminHome(),
                  ),
                );
                print(" value of admin ${v}");
              },
            );
          } else  {
            print(" value of user ${v}");
            StaticDate.uid = v;
            Future.delayed(
              const Duration(seconds: 4),
              () {
                userstatus();
          
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage()
                  ),
                );
              },
            );
          }
        },
      );
    });
  }
    void getDataFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? v = prefs.getString('UserId');

    if (v == null) {
      Future.delayed(
        const Duration(seconds: 4),
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => width>600?WebIntroductionScreen():IntroductionScreen()),
          );
        },
      );
    } else {
      getuserdata(v);
    }
  }
 
  @override
   
  void initState() {
    getDataFromSF();
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
                    'Shop Flux',
                    style: TextStyle(
                        fontSize: width * 0.1,
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
