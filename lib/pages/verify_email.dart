import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<StatefulWidget> createState() {
    return VerifyEmailState();
  }
}

class VerifyEmailState extends State<VerifyEmail> {
  TextStyle numStyle = TextStyle(
    color: HexColor('#82222280'),
    fontFamily: 'Montserrat',
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 140,
            left: 20,
            right: 20,
            child: Image.asset('images/logo.png'),
          ),
          Positioned(
            top: 250,
            left: 20,
            right: 20,
            // right: 28,
            child: Text(
              'Enter Code',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: HexColor('#1A237E'),
                fontFamily: 'Montserrat',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: 285,
            left: 20,
            right: 20,
            // right: 28,
            child: Text(
              'Enter a verification code we sent on your email',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: HexColor('#82222280'),
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: 360,
            left: 28,
            right: 28,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Space evenly
              children: [
                Container(
                  color: HexColor('#e6e2ff'),
                  width: 50.0,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      '5',
                      style: numStyle,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  color: HexColor('#e6e2ff'),
                  width: 50.0,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      '5',
                      style: numStyle,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  color: HexColor('#e6e2ff'),
                  width: 50.0,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      '5',
                      style: numStyle,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  color: HexColor('#e6e2ff'),
                  width: 50.0,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      '5',
                      style: numStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 440,
            left: 28,
            right: 28,
            child: ElevatedButton(
              onPressed: () {
                debugPrint('Button Pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor('#1A237E'),
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Verify',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            top: 500,
            left: 20,
            right: 20,
            // right: 28,
            child: Text(
              'not recieved?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: HexColor('#82222280'),
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: 540,
            right: 30,
            left: 30,
            child: GestureDetector(
              onTap: () {
                debugPrint('Hahahah');
              },
              child: Text(
                'Resend Code >',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: HexColor('#1A237E'),
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
