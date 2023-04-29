import 'package:ecommerece/admin_pannel/web/web_admin_home.dart';
import 'package:ecommerece/admin_pannel/web_admin_Loginscreen.dart';
import 'package:ecommerece/mobile_app/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'admin_pannel/web/web_sideBar/addProduct_Screen.dart';
import 'admin_pannel/web/web_sideBar/cartProduct.dart';
import 'admin_pannel/web/web_sideBar/dashbord_screen.dart';
import 'admin_pannel/web/web_sideBar/deleteProduct_screen.dart';
import 'admin_pannel/web/web_sideBar/updateProduct_screen.dart';


void main() async{
  
WidgetsFlutterBinding.ensureInitialized();
if(kIsWeb){
await Firebase.initializeApp(
  //name: "com.example.ecommerece",
options:const FirebaseOptions(
 apiKey: "AIzaSyDDCC_Fj4DaUXh4KA3pKzjl9y-JzIdL_B0",
          authDomain: "lundaapp.firebaseapp.com",
          projectId: "lundaapp",
          storageBucket: "lundaapp.appspot.com",
          messagingSenderId: "267474835672",
          appId: "1:267474835672:web:a5c2d8d2ac9ed03b04dfad",
         )
        );
}else{

await Firebase.initializeApp();
}  

ErrorWidget.builder=(FlutterErrorDetails details){
    bool isDebug=false;
    assert((){
      isDebug=true;
      return true;
    }());
    if(isDebug){
      ErrorWidget(details.exception);
    }
    return Container(
      child: Center(
        child: Text(" error ${details.exception}&"),
      ),
    );
  };
  runApp(MyApp());
 
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
      //WebSplashScreen(),
      //LayoutHomeScreen()
      //WebAdminLogin()
     SplashScreen(),
     routes: {
         WebAdminLogin.id:(context) => WebAdminHome(),
         // WebSignupScreen.id:(context) => WebSignupScreen(),
          WebAdminHome.id:(context) =>WebAdminHome(),
          Dashboard.id:(context) => Dashboard(),
           AddProduct.id:(context) => AddProduct(),
          DeleteProduct.id:(context) => DeleteProduct(),
       //   UpdateProduct.id:(context) => DeleteProduct(),
        
          UpdateProduct.id:(context) => UpdateProduct(),
         
            CartProduct.id:(context) => CartProduct(),
     },
    );
  }
}


