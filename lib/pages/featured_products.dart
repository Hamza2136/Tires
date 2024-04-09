// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/pages/feature_product_details.dart';

class FeaturedProducts extends StatefulWidget {
  const FeaturedProducts({super.key});

  @override
  State<StatefulWidget> createState() {
    return FeaturedProductsState();
  }
}

class FeaturedProductsState extends State<FeaturedProducts> {
  Widget tempPrice() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 210,
      child: Text(
        'Rs 34000',
        textAlign: TextAlign.start,
        style: TextStyle(
          color: HexColor('#D32F2F'),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }

  String path = 'images/tiresandwheels/1.png';
  String title = 'Jeep BF Goodrich Tires';
  String price = 'RS 34000';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'images/featuredproducts/bg1.png',
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Featured Products',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 255, 237, 237),
                    width: 1.0),
                borderRadius: BorderRadius.circular(8.0), // Customize border
                color: const Color.fromARGB(255, 255, 237, 237),
              ),
              padding: const EdgeInsets.all(16.0), // Add padding for spacing
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Space evenly between the text widgets
                children: [
                  Text(
                    'Honda',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: HexColor('#D32F2F'),
                      decorationThickness: 3,
                      fontSize: 16.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: HexColor('#1A237E'),
                    ),
                  ),
                  Text(
                    'Audi',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: HexColor('#1A237E'),
                    ),
                  ),
                  Text(
                    'Mercedez',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: HexColor('#1A237E'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 70,
            right: 10,
            left: 10,
            bottom: 10,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                          path: path,
                                          title: title,
                                          price: price)));
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Image.asset('images/tiresandwheels/1.png'),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                          path: path,
                                          title: title,
                                          price: price)));
                            },
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Jeep BF Goodrich Tires',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: HexColor('#1A237E'),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  tempPrice(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Image.asset('images/tiresandwheels/2.png'),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jeep Power Stop Brakes',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: HexColor('#1A237E'),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                tempPrice(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Image.asset('images/tiresandwheels/3.png'),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'RT Off-Road Jeep Accessories & Parts',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: HexColor('#1A237E'),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                tempPrice(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Image.asset('images/tiresandwheels/4.png'),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jeep Rubicon Express Suspension Parts & Accessories',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: HexColor('#1A237E'),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                tempPrice(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
