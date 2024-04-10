// ignore: file_names
// ignore_for_file: sized_box_for_whitespace, file_names, duplicate_ignore, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:dotted_border/dotted_border.dart';

class RegisterBusiness extends StatefulWidget {
  const RegisterBusiness({super.key});

  @override
  State<StatefulWidget> createState() {
    return RegisterBusinessState();
  }
}

class RegisterBusinessState extends State<RegisterBusiness> {
  TextStyle fieldStyle = const TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController liscenseNoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.9;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register Business',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: HexColor('#1A237E'),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: HexColor('#1A237E'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Business Name', // Changed label to labelText
                  labelStyle: fieldStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                style: fieldStyle,
              ),
              const SizedBox(
                height: 13,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: fieldStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                style: fieldStyle,
              ),
              const SizedBox(
                height: 13,
              ),
              TextField(
                controller: locationController,
                decoration: InputDecoration(
                  labelText: 'Location', // Changed label to labelText
                  labelStyle: fieldStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                style: fieldStyle,
              ),
              const SizedBox(
                height: 13,
              ),
              TextField(
                controller: phoneNoController,
                decoration: InputDecoration(
                  labelText: 'Phone', // Changed label to labelText
                  labelStyle: fieldStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                style: fieldStyle,
              ),
              const SizedBox(
                height: 13,
              ),
              TextField(
                controller: liscenseNoController,
                decoration: InputDecoration(
                  labelText: 'Liscense Number', // Changed label to labelText
                  labelStyle: fieldStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                style: fieldStyle,
              ),
              const SizedBox(
                height: 13,
              ),
              DottedBorder(
                color: Colors.black,
                strokeWidth: 2,
                child: SizedBox(
                  height: 50,
                  width: buttonWidth,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor('#F8F8F8'),
                      foregroundColor: HexColor('#000000'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_upload_rounded),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Upload License',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              SizedBox(
                height: 50,
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor('#1A237E'),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          0), // Set border radius to 0 for a square button
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
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
                      color: HexColor('#1A237E'),
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
}
