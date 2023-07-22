import 'package:ecommerece/mobile_app/model_classes/order_modelclass.dart';
import 'package:ecommerece/mobile_app/pages/rating_screen.dart';
import 'package:flutter/material.dart';

class AddDetail extends StatefulWidget {
  @override
  _AddDetailState createState() => _AddDetailState();
}

class _AddDetailState extends State<AddDetail> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: height * 0.07,
              width: width,
              color: Color(0xff42382E),
              child: Padding(
                padding: EdgeInsets.only(right: width * 0.06),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: height,
                          width: width * 0.5,
                          color: Color(0xff42382E),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'RIGEL',
                              style: TextStyle(fontSize: 33),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.shopping_bag,
                          size: 40,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                        height: height * 0.05,
                        width: width * 0.05,
                        child: Center(
                          child: Text(
                            '2',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: height * 0.05,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.search),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.7),
                      child: Text('Search'),
                    ),
                    Icon(Icons.mic)
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage('images/shoe.jpg'))),
              height: height * 0.20,
              width: width,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  height: height * 0.04,
                  width: width * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: width * 0.003),
                        // color: Colors.black,
                        shape: BoxShape.circle),
                    height: height * 0.04,
                    width: width * 0.03,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: width * 0.003),
                      // color: Colors.black,
                      shape: BoxShape.circle),
                  height: height * 0.04,
                  width: width * 0.03,
                ),
              ],
            ),
            Container(
              height: height * 0.06,
              width: width,
              // color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Monk Straps',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.favorite)
                ],
              ),
            ),
            Container(
              height: height * 0.06,
              width: width,
              // color: Colors.yellow,
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star_border),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '4.0  (73 reviews)',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.05,
              width: width,
              // color: Colors.pink,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '299 Dollar',
                  style: TextStyle(fontSize: 23),
                ),
              ),
            ),
            Container(
              height: height * 0.05,
              width: width,
              // color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Details',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.02),
              child: Container(
                height: height * 0.06,
                width: width,
                // color: Colors.pink,
                child: Text(
                  'Fell the difference in comfort with our uniquely designed Deep Comfort Tchnology.  More',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Container(
              height: height * 0.05,
              width: width,
              // color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Select Color',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    height: height * 0.06,
                    width: width * 0.1,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xff41382F),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  height: height * 0.06,
                  width: width * 0.1,
                ),
              ],
            ),
            Container(
              height: height * 0.03,
              width: width,
              // color: Colors.pink,
              child: Text(
                'Select Size ( UK Size )',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xff41382F),
                        borderRadius: BorderRadius.circular(8)),
                    height: height * 0.04,
                    width: width * 0.08,
                    child: Center(child: Text('7.5')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: width * 0.001)),
                      height: height * 0.04,
                      width: width * 0.08,
                      child: const Center(child: Text('8')),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(width: width * 0.002)),
                    height: height * 0.04,
                    width: width * 0.08,
                    child: const Center(child: Text('8.5')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: width * 0.001)),
                      height: height * 0.04,
                      width: width * 0.08,
                      child: const Center(child: Text('9')),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(width: width * 0.001)),
                    height: height * 0.04,
                    width: width * 0.08,
                    child: const Center(child: Text('9.5')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: width * 0.001)),
                      height: height * 0.04,
                      width: width * 0.08,
                      child: const Center(child: Text('10')),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(width: width * 0.001)),
                    height: height * 0.04,
                    width: width * 0.08,
                    child: const Center(child: Text('11')),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                ////???????
                OrderModelClas order=OrderModelClas();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RatingScreen(
                      ordermodel: order,
                    )));
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xff41382F),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                height: height * 0.05,
                width: width * 0.6,
                child: const Center(
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
