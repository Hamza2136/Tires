import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/pages/walkthroug.dart';

// ignore: must_be_immutable
class SelectLanguage extends StatelessWidget {
  SelectLanguage({super.key});
  Color myColor = HexColor('#1A237E');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 150,
            left: 111.57,
            right: 111.57,
            child: SizedBox(
              child: Image.asset('images/logo.png'),
            ),
          ),
          Positioned(
            top: 230.03,
            left: 15,
            child: SizedBox(
              width: 65.64,
              height: 64.61,
              child: Image.asset('images/Icon@2x.png'),
            ),
          ),
          const Positioned(
            top: 300,
            left: 15,
            right: 15,
            child: Text(
              'Choose Your Preferred Langugage',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          const Positioned(
            top: 325,
            left: 15,
            right: 15,
            child: Text(
              'Please Select Your Langugae',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          Positioned(
            top: 380,
            left: 15,
            child: Row(
              children: [
                Image.asset('images/english_flag@2x.png'),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  'English',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 380,
            right: 30,
            child: InkWell(
              onTap: () {
                debugPrint('English');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Walkthrough()));
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
            top: 460,
            left: 15,
            child: Row(
              children: [
                Image.asset('images/arabic_flag@2x.png'),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  'عربي',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 460,
            right: 30,
            child: InkWell(
              onTap: () {
                debugPrint('Arabic');
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
        ],
      ),
    );
  }
}
