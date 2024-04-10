// ignore: file_names
// ignore_for_file: sized_box_for_whitespace, file_names, duplicate_ignore, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddAddressState();
  }
}

class AddAddressState extends State<AddAddress> {
  TextStyle fieldStyle = const TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  TextEditingController nameController = TextEditingController();
  TextEditingController laneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.9;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Address',
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
                  labelText: 'Name', // Changed label to labelText
                  labelStyle: fieldStyle,
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
                controller: laneController,
                decoration: InputDecoration(
                  labelText: 'Address Lane', // Changed label to labelText
                  labelStyle: fieldStyle,
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
                controller: cityController,
                decoration: InputDecoration(
                  labelText: 'City', // Changed label to labelText
                  labelStyle: fieldStyle,
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
                controller: zipCodeController,
                decoration: InputDecoration(
                  labelText: 'Zip/Postal Code', // Changed label to labelText
                  labelStyle: fieldStyle,
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
                controller: phoneNoController,
                decoration: InputDecoration(
                  labelText: 'Phone Number', // Changed label to labelText
                  labelStyle: fieldStyle,
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
                    'Add Address',
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
}
