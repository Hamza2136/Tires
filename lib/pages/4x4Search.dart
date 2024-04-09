// ignore: file_names
// ignore_for_file: sized_box_for_whitespace, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/pages/tiresAndwheels.dart';

class FourXFourSearch extends StatefulWidget {
  const FourXFourSearch({super.key});

  @override
  State<StatefulWidget> createState() {
    return FourXFourSearchState();
  }
}

class FourXFourSearchState extends State<FourXFourSearch> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'images/fourXfour/bg1.png',
              fit: BoxFit.cover,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
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
                '4X4 Catalog',
                textAlign: TextAlign.start,
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
            top: 20,
            left: 10,
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: HexColor('#1A237E'), width: 1.0),
                borderRadius: BorderRadius.circular(20.0), // Customize border
              ),
              child: Row(
                children: [
                  const SizedBox(width: 20.0),
                  Text(
                    'Gladiator Mojova 2020',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: HexColor('#1A237E'),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  GestureDetector(
                    onTap: () {
                      debugPrint('hahah');
                    },
                    child: const Icon(Icons.close),
                  ),
                  const SizedBox(width: 20.0),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: GestureDetector(
              child: Icon(
                Icons.filter_alt_sharp,
                color: HexColor('1A237E'),
                size: 30,
              ),
            ),
          ),
          Positioned(
            top: 70,
            right: 20,
            left: 20,
            bottom: 20,
            child: SingleChildScrollView(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            debugPrint('Hahah');
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 133,
                                child: Image.asset('images/fourXfour/1.png'),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 210,
                                child: Text(
                                  'Engine Parts',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: HexColor('#1A237E'),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              tempPrice(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            debugPrint('Hahah');
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 133,
                                child: Image.asset('images/fourXfour/2.png'),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 210,
                                child: Text(
                                  'Lights',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: HexColor('#1A237E'),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              tempPrice(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TireWheels()));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 133,
                                child: Image.asset('images/fourXfour/3.png'),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 210,
                                child: Text(
                                  'Tires and Wheels',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: HexColor('#1A237E'),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              tempPrice(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            debugPrint('Hahah');
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 133,
                                child: Image.asset('images/fourXfour/4.png'),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 210,
                                child: Text(
                                  'Brake System',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: HexColor('#1A237E'),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              tempPrice(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            debugPrint('Hahah');
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 133,
                                child: Image.asset('images/fourXfour/5.png'),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 210,
                                child: Text(
                                  'Service Parts',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: HexColor('#1A237E'),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              tempPrice(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            debugPrint('Hahah');
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 133,
                                child: Image.asset('images/fourXfour/6.png'),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 210,
                                child: Text(
                                  'Filters',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: HexColor('#1A237E'),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              tempPrice(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
