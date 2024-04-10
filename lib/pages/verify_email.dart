import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/pages/resend_email.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 130,
              ),
              Image.asset('images/logo.png'),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Enter Code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: HexColor('#1A237E'),
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Enter a verification code we sent on your email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: HexColor('#82222280'),
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Space evenly
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
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 320,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint('Button Pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor('#1A237E'),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
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
              Text(
                'not recieved?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: HexColor('#82222280'),
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResendEmail()));
                },
                child: Text(
                  'Resend Code >',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: HexColor('#D32F2F'),
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
