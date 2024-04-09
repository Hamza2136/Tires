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
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 180,
              child: const Text(
                'In consequat, quam id sodales hendrerit, eros mi molestie leo, nec lacinia risus neque tristique augue.',
                style: TextStyle(
                  fontSize: 14,
                  // color: Colors.grey,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip, // or TextOverflow.ellipsis
              ),
            ),
          ),
          Positioned(
            top: 105,
            left: 30,
            right: 30,
            bottom: 70,
            child: SizedBox(
              child: Image.asset(
                getpath(current),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 40,
            child: Row(
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
                const SizedBox(width: 10),
              ],
            ),
          ),
          Positioned(
            bottom: 45,
            right: 100,
            child: InkWell(
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
          ),
          Positioned(
            bottom: 45,
            right: 50,
            child: InkWell(
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
          ),
          Positioned(
            right: 55,
            bottom: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Signin()));
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
          ),
        ],
      ),
    );
  }
}
