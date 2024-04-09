import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ResendEmail extends StatefulWidget {
  const ResendEmail({super.key});

  @override
  State<StatefulWidget> createState() {
    return ResendEmailState();
  }
}

class ResendEmailState extends State<ResendEmail> {
  TextEditingController emailController = TextEditingController();
  TextStyle fieldStyle = const TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    fontSize: 14,
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
              'Enter Email',
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
              'Enter email address which recieve a 4 digit verification code',
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
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: fieldStyle,
                hintText: 'Enter Your Email...',
                hintStyle: fieldStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              style: fieldStyle,
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
                'Submit',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
