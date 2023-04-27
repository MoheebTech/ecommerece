import 'package:ecommerece/admin_pannel/mobile_admin_pannel/mobile_admin_Loginscreen.dart';
import 'package:ecommerece/admin_pannel/mobile_admin_pannel/mobile_update_screen.dart';
import 'package:ecommerece/mobile_app/pages/forgetpasword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../them_data.dart';

class MobileAdminHome extends StatefulWidget {
  const MobileAdminHome({Key? key}) : super(key: key);

  @override
  State<MobileAdminHome> createState() => _MobileAdminHomeState();
}

class _MobileAdminHomeState extends State<MobileAdminHome> {
  FirebaseAuth auth=FirebaseAuth.instance;
   bool leading=true;
  logout()async{
  await auth.signOut();
    clearSF();
     Navigator.push(context, MaterialPageRoute(builder: (context)=>MobileAdminLogin()));
    }

  clearSF()async{
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     sharedPreferences.getKeys();
     sharedPreferences.clear();
  }
  @override
void initState() {
  setState(() {
    leading=false;
  });
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeClass.lightsecoundryColor,
      appBar: AppBar(
        
        elevation: 0,
        backgroundColor: MyThemeClass.lightsecoundryColor,
        title: Text("RIGE ADMIN",style: TextStyle(color: MyThemeClass.secoundryColor,fontWeight: FontWeight.bold,fontSize: 27),),
      centerTitle: true,
     actions: [
       IconButton(
          icon: Icon(Icons.logout),
          onPressed: (){
            logout();

               },)
     ],
      ),
      drawer: Drawer(
        backgroundColor: MyThemeClass.lightsecoundryColor,
       elevation: 7,
        child:
        Container(
          child: Column(
            children: [
                 drawerwidget("DashBoard", Icons.dashboard),
                 InkWell(
                  onTap: (){
                    Future.delayed(Duration(milliseconds: 15,),()=>
                   Navigator.push(context,MaterialPageRoute(builder: (context)=>MoUpdateProduct())));
                  },
                  child: drawerwidget("Update Product", Icons.edit_note),),
                  drawerwidget("Add Product", Icons.add),
                
                 drawerwidget("Home Screen", Icons.home),
                // SizedBox(height: height*0.4,),
                 drawerwidget("LogOut", Icons.logout)
            ],
          ),
        ),

      ),
      body: Center(
        child: Container(
          height: 600,
          width: 700,
          color: MyThemeClass.lightsecoundryColor,
        ),
      ),

    );
  }
   Widget drawerwidget( String title,IconData icons,){
    return  ListTile(
      selected: true,
      selectedColor: MyThemeClass.greenColor,
      horizontalTitleGap: 30,
    selectedTileColor: MyThemeClass.lightsecoundryColor,
      leading: Icon(icons,color:MyThemeClass.whiteColor,),
     title: Text(title,style: TextStyle(color: MyThemeClass.whiteColor,fontWeight: FontWeight.bold),),
      focusColor: MyThemeClass.greenColor,
    
    );

   }
}