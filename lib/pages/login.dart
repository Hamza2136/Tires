import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/pages/forgot_password.dart';
import 'package:tires/pages/home.dart';
import 'package:tires/pages/signup.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<StatefulWidget> createState() {
    return SigninState();
  }
}

class SigninState extends State<Signin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Color myColor = HexColor('#1A237E');

  TextStyle fieldStyle = const TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  TextStyle labelStyle = TextStyle(
    color: HexColor('#1A237E'),
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 120,
            left: 97,
            child: Image.asset('images/logo.png'),
          ),
          Positioned(
            top: 220,
            left: 28,
            right: 28, // Added right constraint
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-mail', // Changed label to labelText
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
            top: 300,
            left: 28,
            right: 28, // Added right constraint
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password', // Changed label to labelText
                labelStyle: fieldStyle,
                hintText: 'Enter Your Password...',
                hintStyle: fieldStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              style: fieldStyle,
            ),
          ),
          Positioned(
            top: 380,
            left: 28,
            right: 28,
            child: ElevatedButton(
              onPressed: () {
                debugPrint('Button Pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: myColor,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Sign in',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            top: 430,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPass()));
              },
              child: Text(
                'Forgot your password?',
                textAlign: TextAlign.center,
                style: labelStyle,
              ),
            ),
          ),
          Positioned(
            top: 500,
            left: 20,
            right: 20,
            // right: 28,
            child: Text(
              'Don\' have an account?',
              textAlign: TextAlign.center,
              style: labelStyle,
            ),
          ),
          Positioned(
            top: 520,
            left: 50,
            right: 50,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUp()));
                debugPrint('Register Pressed');
              },
              child: const Text(
                'Register >',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            top: 580,
            right: 30,
            // right: 28,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
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
