import 'package:flutter/material.dart';
import 'package:tires/pages/home.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Color myColor = HexColor('#1A237E');

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
            top: 120,
            left: 97,
            child: Image.asset('images/logo.png'),
          ),
          Positioned(
            top: 220,
            left: 28,
            right: 28, // Added right constraint
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name', // Changed label to labelText
                labelStyle: fieldStyle,
                hintText: 'Enter Your Name...',
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
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email', // Changed label to labelText
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
            top: 380,
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
            top: 460,
            left: 28,
            right: 28,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: myColor,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Sign up',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            top: 510,
            left: 20,
            right: 20,
            // right: 28,
            child: GestureDetector(
              onTap: () {
                debugPrint('Terms and Policies');
              },
              child: Text('Terms and Conditions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: myColor,
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
