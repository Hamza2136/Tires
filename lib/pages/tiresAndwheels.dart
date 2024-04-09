// ignore: file_names
// ignore_for_file: sized_box_for_whitespace, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TireWheels extends StatefulWidget {
  const TireWheels({super.key});

  @override
  State<StatefulWidget> createState() {
    return TireWheelsState();
  }
}

class TireWheelsState extends State<TireWheels> {
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
              'images/tiresandwheels/bg1.png',
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
                'Tires and Wheels',
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
            top: 20,
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
                                child:
                                    Image.asset('images/tiresandwheels/1.png'),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 210,
                                child: Text(
                                  'Jeep BF Goodrich Tires',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: HexColor('#1A237E'),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
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
                                child:
                                    Image.asset('images/tiresandwheels/2.png'),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 210,
                                child: Text(
                                  'Jeep Power Stop Brakes',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: HexColor('#1A237E'),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
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
                            debugPrint('hahhaah');
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 133,
                                child:
                                    Image.asset('images/tiresandwheels/3.png'),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 210,
                                child: Text(
                                  'RT Off-Road Jeep Accessories & Parts',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: HexColor('#1A237E'),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
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
                                child:
                                    Image.asset('images/tiresandwheels/4.png'),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 210,
                                child: Text(
                                  'Jeep Rubicon Express Suspension Parts & Accessories',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: HexColor('#1A237E'),
                                    fontFamily: 'Montserrat',
                                    overflow: TextOverflow.clip,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
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
