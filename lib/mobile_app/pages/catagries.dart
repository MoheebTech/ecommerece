import 'package:ecommerece/mobile_app/pages/cart.dart';
import 'package:ecommerece/mobile_app/pages/new_arrivals.dart';
import 'package:ecommerece/them_data.dart';
import 'package:flutter/material.dart';

class CatagriesScreen extends StatefulWidget {
  @override
  State<CatagriesScreen> createState() => _CatagriesScreenState();
}

class _CatagriesScreenState extends State<CatagriesScreen> {
  TextEditingController searchcontroller = TextEditingController();
  String? search;
  var height, width;
  List<String> category=["Carousal","shoes","sandals","Sneekers","Boots"];
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:AppBar(
        backgroundColor: MyThemeClass.primaryColor,
        elevation: 0,
        leading: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: MyThemeClass.whiteColor,
                              size: width * 0.06,
                            ),
      ),

       centerTitle: true,
       title: Text(
                            'RIGEL',
                            style: TextStyle(
                              fontSize: width * 0.06,
                              color: MyThemeClass.whiteColor,
                            ),
                          ),
      ),
      body: Container(
        height: height,
        width: width,
        color: MyThemeClass.primaryColor,
        child: Column(
          children: [
            
            SizedBox(height: height * 0.02),
            Container(
              height: height * 0.06,
              width: width * 0.9,
              decoration: BoxDecoration(
                  color: MyThemeClass.transColor?.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: searchcontroller,
                  onChanged: (value) {
                    search=value;
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: ('Search'),
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.mic,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            SizedBox(
              height: height * 0.04,
              width: width * 0.9,
              // color: Colors.green,
              child: Center(
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: width * 0.05,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        SizedBox(
          height: height*0.7,
          child: ListView.builder(
            itemCount: category.length,
            itemBuilder: (context, index){
              if(search==null|| search!.isEmpty||search==''){
               return Container(
                child: Column(
                  children: [
                     SizedBox(height: height * 0.01),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewArrival(
                              heading: "Casual Wear",
                            )));
              },
              child: Card(
                elevation: 3,
                color: MyThemeClass.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: height * 0.17,
                  width: width * 0.95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/boots.jpg'))),
                  child: Stack(
                    children: [
                      Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: MyThemeClass.primaryColor.withOpacity(0.7)),
                      ),
                      SizedBox(
                        height: height,
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Casual Wear',
                                style: TextStyle(
                                    fontSize: width * 0.08,
                                    color: Colors.white),
                              ),
                              Text(
                                'Casual Wear Black rubber dadson \nShoes Moccasins.',
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewArrival(
                              heading: "Boots",
                            )));
              },
              child: Card(
                elevation: 3,
                color: MyThemeClass.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: height * 0.17,
                  width: width * 0.95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/2nd.jpg'))),
                  child: Stack(
                    children: [
                      Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: MyThemeClass.primaryColor.withOpacity(0.7)),
                      ),
                      SizedBox(
                        height: height,
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Boots',
                                style: TextStyle(
                                    fontSize: width * 0.08,
                                    color: Colors.white),
                              ),
                              Text(
                                'A boot,plural boots,is a type of specific \nfootwear.',
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewArrival(
                              heading: "Sneakers",
                            )));
              },
              child: Card(
                elevation: 3,
                color: MyThemeClass.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: height * 0.17,
                  width: width * 0.95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/snkars.jpg'))),
                  child: Stack(
                    children: [
                      Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: MyThemeClass.primaryColor.withOpacity(0.7)),
                      ),
                      SizedBox(
                        height: height,
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sneakers',
                                style: TextStyle(
                                    fontSize: width * 0.08,
                                    color: Colors.white),
                              ),
                              Text(
                                'Athietic or casual rubber-soled shoes \nare called sneakers.',
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewArrival(
                              heading: "Sandals",
                            )));
              },
              child: Card(
                elevation: 3,
                color: MyThemeClass.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: height * 0.17,
                  width: width * 0.95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/sandals.jpg'))),
                  child: Stack(
                    children: [
                      Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: MyThemeClass.primaryColor.withOpacity(0.7)),
                      ),
                      SizedBox(
                        height: height,
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sandals',
                                style: TextStyle(
                                    fontSize: width * 0.08,
                                    color: Colors.white),
                              ),
                              Text(
                                'A light shoe with either an openwork upper \nor straps attaching the sole to the foot.',
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
                  ],
                ),
               );
              }else if(category[index].toLowerCase()
                                .contains(search!.toLowerCase())){
               return Container(
                child:Column(
                  children: [
                     SizedBox(height: height * 0.01),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewArrival(
                              heading: "Casual Wear",
                            )));
              },
              child: Card(
                elevation: 3,
                color: MyThemeClass.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: height * 0.17,
                  width: width * 0.95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/boots.jpg'))),
                  child: Stack(
                    children: [
                      Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: MyThemeClass.primaryColor.withOpacity(0.7)),
                      ),
                      SizedBox(
                        height: height,
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Casual Wear',
                                style: TextStyle(
                                    fontSize: width * 0.08,
                                    color: Colors.white),
                              ),
                              Text(
                                'Casual Wear Black rubber dadson \nShoes Moccasins.',
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewArrival(
                              heading: "Boots",
                            )));
              },
              child: Card(
                elevation: 3,
                color: MyThemeClass.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: height * 0.17,
                  width: width * 0.95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/2nd.jpg'))),
                  child: Stack(
                    children: [
                      Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: MyThemeClass.primaryColor.withOpacity(0.7)),
                      ),
                      SizedBox(
                        height: height,
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Boots',
                                style: TextStyle(
                                    fontSize: width * 0.08,
                                    color: Colors.white),
                              ),
                              Text(
                                'A boot,plural boots,is a type of specific \nfootwear.',
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewArrival(
                              heading: "Sneakers",
                            )));
              },
              child: Card(
                elevation: 3,
                color: MyThemeClass.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: height * 0.17,
                  width: width * 0.95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/snkars.jpg'))),
                  child: Stack(
                    children: [
                      Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: MyThemeClass.primaryColor.withOpacity(0.7)),
                      ),
                      SizedBox(
                        height: height,
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sneakers',
                                style: TextStyle(
                                    fontSize: width * 0.08,
                                    color: Colors.white),
                              ),
                              Text(
                                'Athietic or casual rubber-soled shoes \nare called sneakers.',
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewArrival(
                              heading: "Sandals",
                            )));
              },
              child: Card(
                elevation: 3,
                color: MyThemeClass.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: height * 0.17,
                  width: width * 0.95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/sandals.jpg'))),
                  child: Stack(
                    children: [
                      Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: MyThemeClass.primaryColor.withOpacity(0.7)),
                      ),
                      SizedBox(
                        height: height,
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sandals',
                                style: TextStyle(
                                    fontSize: width * 0.08,
                                    color: Colors.white),
                              ),
                              Text(
                                'A light shoe with either an openwork upper \nor straps attaching the sole to the foot.',
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
                  ],
                )
               );
              }else{
               return Container();
              }

          })
        )
          ],
        ),
      ),
    );
  }
}
