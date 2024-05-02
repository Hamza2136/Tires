// ignore: file_names
// ignore_for_file: sized_box_for_whitespace, file_names, duplicate_ignore, depend_on_referenced_packages, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:tires/pages/address.dart';
import 'package:tires/url/url.dart';

class AddAddress extends StatefulWidget {
  final int userId;
  const AddAddress({super.key, required this.userId});

  @override
  State<StatefulWidget> createState() {
    return AddAddressState();
  }
}

class AddAddressState extends State<AddAddress> {
  int userId = 0;
  @override
  void initState() {
    super.initState();
    userId = widget.userId;
  }

  TextStyle fieldStyle = const TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController areaController = TextEditingController();
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
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
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
                controller: areaController,
                decoration: InputDecoration(
                  labelText: 'Area', // Changed label to labelText
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
                  onPressed: () {
                    addnewAddress(
                      context,
                      nameController.text,
                      addressController.text,
                      areaController.text,
                      int.parse(zipCodeController.text),
                      int.parse(phoneNoController.text),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor('#1A237E'),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
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

  Future<void> addnewAddress(BuildContext context, String name, String address,
      String Area, int zipCode, int phoneNumber) async {
    try {
      var response = await http.post(
        Uri.parse('$url/Address/add'),
        body: jsonEncode({
          'Name': name,
          'UserId': userId,
          'CompleteAddress': address,
          'Area': Area,
          'PostalCode': zipCode,
          'PhoneNumber': phoneNumber,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        debugPrint('Address Added Successfully');
        setState(
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Address(
                  userId: userId,
                ),
              ),
            );
          },
        );
      } else {
        debugPrint('Failed to Add Address: ${response.body}');
      }
    } catch (e) {
      debugPrint('$e');
    }
  }
}
