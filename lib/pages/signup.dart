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
      body: Padding(
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
            TextField(
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
            const SizedBox(
              height: 20,
            ),
            TextField(
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
            const SizedBox(
              height: 20,
            ),
            TextField(
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
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 320,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: myColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
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
            GestureDetector(
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
          ],
        ),
      ),
    );
  }
}
