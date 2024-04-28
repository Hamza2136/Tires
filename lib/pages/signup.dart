// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:tires/pages/login.dart';
import 'package:tires/url/url.dart';

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
  final _formkey = GlobalKey<FormState>();
  bool _obscureText = true;

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
                controller: nameController,
                validator: (value) =>
                    value != null && value.isEmpty ? 'Name is Required' : null,
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
              TextFormField(
                controller: emailController,
                validator: (value) =>
                    value != null && value.isEmpty ? 'Email is Required' : null,
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
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
                height: 30,
              ),
              SizedBox(
                width: 320,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      String name = nameController.text;
                      String email = emailController.text;
                      String password = passwordController.text;
                      signup(context, name, email, password);
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
      ),
    );
  }

  Future<void> signup(
      BuildContext context, String name, String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse('$url/Accounts/create'),
        body: jsonEncode({'Name': name, 'Email': email, 'Password': password}),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        debugPrint('user created successfully');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Signin(),
          ),
        );
      } else {
        debugPrint('Failed to create user: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('$e');
    }
  }
}
