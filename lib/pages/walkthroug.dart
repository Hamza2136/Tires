// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/pages/login.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Walkthrough();
  }
}

class _Walkthrough extends State<Walkthrough> {
  Color myColor = HexColor('#1A237E');
  int total = 5;

  int current = 1;
  String path = 'images/background.png';
  String getpath(int num) {
    switch (num) {
      case 1:
        path = 'images/background.png';
        break;
      case 2:
        path = 'images/bg1.png';
        break;
      case 3:
        path = 'images/bg2.webp';
        break;
      case 4:
        path = 'images/bg3.webp';
        break;
      case 5:
        path = 'images/bg4.png';
        break;
      default:
        path = 'images/background.png';
    }
    return path;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double imageHeight = screenHeight * 0.7;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                // width: MediaQuery.of(context).size.width - 180,
                child: Text(
                  'Welcome to our Application. We provide you with every type of car parts and materials you need in terms of demand and supply.',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: imageHeight,
                child: Image.asset(
                  getpath(current),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '$current ',
                    style: TextStyle(
                      fontSize: 32,
                      color: myColor,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '\\ $total',
                    style: TextStyle(
                      fontSize: 18,
                      color: myColor,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(flex: 2),
                  InkWell(
                    onTap: () {
                      setState(() {
                        debugPrint('<');
                        if (current > 1) {
                          current -= 1;
                        } else if (current == 1) {
                          current = 1;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: myColor,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        debugPrint('>');
                        if (current < 5) {
                          current += 1;
                        } else if (current == 5) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Signin()));
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: myColor,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signin()));
                    },
                    child: Text(
                      'Skip >',
                      style: TextStyle(
                        color: myColor,
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
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
