// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/pages/forgot_password.dart';
import 'package:tires/pages/home.dart';
import 'package:tires/pages/signup.dart';
import 'package:http/http.dart' as http;
import 'package:tires/url/url.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<StatefulWidget> createState() {
    return SigninState();
  }
}

class SigninState extends State<Signin> {
  void goToPage(BuildContext context, pageName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pageName,
      ),
    );
  }

  int userid = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Color myColor = HexColor('#1A237E');
  bool _obscureText = true;
  final _formkey = GlobalKey<FormState>();
  String? userNotFoundError;
  String? incorrectPasswordError;

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
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 130,
                ),
                Image.asset('images/logo.png'),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) => value != null && value.isEmpty
                      ? 'Email is Required'
                      : null,
                  decoration: InputDecoration(
                    labelText: 'E-mail', // Changed label to labelText
                    labelStyle: fieldStyle,
                    hintText: 'Enter Your Email...',
                    hintStyle: fieldStyle,
                    errorText: userNotFoundError,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  style: fieldStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (value) => value != null && value.isEmpty
                      ? 'Password is Required'
                      : null,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: fieldStyle,
                    hintText: 'Enter Your Password...',
                    hintStyle: fieldStyle,
                    errorText: incorrectPasswordError,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
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
                      if (_formkey.currentState!.validate()) {
                        String email = emailController.text;
                        String password = passwordController.text;
                        login(context, email, password);
                      }
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
                    goToPage(context, const ForgotPass());
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
                    goToPage(context, const SignUp());
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    userNotFoundError = null;
    incorrectPasswordError = null;
    try {
      var response = await http.get(
        Uri.parse('$url/Accounts/email/$email'),
      );
      if (response.statusCode == 200) {
        var userData = jsonDecode(response.body);
        userid = userData['UserId'];
        if (userData['Password'] == password) {
          goToPage(context, Home(userId: userid));
        } else {
          setState(() {
            incorrectPasswordError = "Password is incorrect";
          });
        }
      } else {
        setState(() {
          userNotFoundError = "User not found Please Register";
        });
      }
    } catch (e) {
      debugPrint('$e');
    }
  }
}
