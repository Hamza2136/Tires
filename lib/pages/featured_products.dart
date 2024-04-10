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
        'RS 34000',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 237, 237),
                      width: 1.0),
                  borderRadius: BorderRadius.circular(8.0), // Customize border
                  color: const Color.fromARGB(255, 255, 237, 237),
                ),
                padding: const EdgeInsets.all(16.0), // Add padding for spacing
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Column(
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
                                  builder: (context) => const ProductDetails(
                                      path: 'images/tiresandwheels/1.png',
                                      title: 'Jeep BF Goodrich Tires',
                                      price: 'RS 34000'),
                                ),
                              );
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Image.asset('images/tiresandwheels/1.png'),
                            ),
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 170,
                                  child: Text(
                                    'Jeep BF Goodrich Tires',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: HexColor('#1A237E'),
                                      fontFamily: 'Montserrat',
                                      overflow: TextOverflow.clip,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProductDetails(
                                      path: 'images/tiresandwheels/2.png',
                                      title:
                                          'RT Off-Road Jeep Accessories & Parts',
                                      price: 'RS 34000'),
                                ),
                              );
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Image.asset('images/tiresandwheels/2.png'),
                            ),
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 170,
                                  child: Text(
                                    'RT Off-Road Jeep Accessories & Parts',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: HexColor('#1A237E'),
                                      fontFamily: 'Montserrat',
                                      overflow: TextOverflow.clip,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProductDetails(
                                      path: 'images/tiresandwheels/3.png',
                                      title:
                                          'Jeep Rubicon Express Suspension Parts & Accessories',
                                      price: 'RS 34000'),
                                ),
                              );
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Image.asset('images/tiresandwheels/3.png'),
                            ),
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 170,
                                  child: Text(
                                    'Jeep Rubicon Express Suspension Parts & Accessories',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: HexColor('#1A237E'),
                                      fontFamily: 'Montserrat',
                                      overflow: TextOverflow.clip,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
