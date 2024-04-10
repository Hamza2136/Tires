import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/pages/home.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<StatefulWidget> createState() {
    return ResetPasswordState();
  }
}

class ResetPasswordState extends State<ResetPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  TextStyle fieldStyle = const TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    fontSize: 14,
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
                'Reset Password',
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
                'Enter a new Password',
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
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Enter-Password',
                  labelStyle: fieldStyle,
                  hintText: 'Enter a new Password...',
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
                controller: cpasswordController,
                decoration: InputDecoration(
                  labelText: 'Re-Enter Password',
                  labelStyle: fieldStyle,
                  hintText: 'Enter new Password again...',
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
                    setState(() {
                      if (passwordController.text == cpasswordController.text) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                        showSnackbar(context, 'Password Change Successfully');
                      } else {
                        showSnackbar(context, 'Password does not match');
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor('#1A237E'),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: const Text(
                    'Change Password',
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
        ),
      ),
    );
  }

  void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
