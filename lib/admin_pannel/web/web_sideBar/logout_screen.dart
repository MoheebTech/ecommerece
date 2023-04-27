
import 'package:ecommerece/admin_pannel/web_admin_Loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutScreen extends StatefulWidget {
//  const LogoutScreen({super.key});
  static const id="weblogouot";
  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  FirebaseAuth auth=FirebaseAuth.instance;
   void logout() async {
    await auth.signOut();
    clearSF();
    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  WebAdminLogin(),
        ));
  }

  void clearSF() async {
    SharedPreferences sharedprfrence = await SharedPreferences.getInstance();
    sharedprfrence.getKeys();
    sharedprfrence.clear();
  }
  @override
  void initState() {
    logout();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Container();
  }
}