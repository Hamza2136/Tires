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
    decoration: TextDecoration.underline,
    decorationColor: HexColor('#1A237E'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                height: 20,
              ),
              SizedBox(
                width: 320,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint('Button Pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: myColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
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
              GestureDetector(
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
              const SizedBox(
                height: 40,
              ),
              Text(
                'Don\' have an account?',
                textAlign: TextAlign.center,
                style: labelStyle,
              ),
              GestureDetector(
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
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
