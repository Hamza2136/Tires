// ignore: file_names
// ignore_for_file: sized_box_for_whitespace, file_names, duplicate_ignore, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:tires/pages/add_address.dart';
import 'package:tires/pages/payment.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddressState();
  }
}

class AddressState extends State<Address> {
  String selectedAddress = 'address1';
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.9;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Address',
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
              Column(
                children: [
                  Card(
                    child: RadioListTile(
                      activeColor: HexColor('#1A237E'),
                      value: 'address1',
                      groupValue: selectedAddress,
                      title: const Text(
                        'Hamza Abid',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text(
                        '03317541395\nChak No 3/Gajiyani Tehsil Chishtian District Bahawalnagar',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedAddress = value.toString();
                        });
                      },
                    ),
                  ),
                  Card(
                    child: RadioListTile(
                      activeColor: HexColor('#1A237E'),
                      value: 'address2',
                      groupValue: selectedAddress,
                      title: const Text(
                        'Ahmer Abid',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text(
                        '03437172680\nChak No 13/Gajiyani Tehsil Chishtian District Bahawalnagar',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedAddress = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              DottedBorder(
                color: Colors.black,
                strokeWidth: 2,
                child: SizedBox(
                  height: 50,
                  width: buttonWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddAddress(),
                        ),
                      );
                    },
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
                        Icon(Icons.add),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Add Address',
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
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Payment()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor('#1A237E'),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          0), // Set border radius to 0 for a square button
                    ),
                  ),
                  child: const Text(
                    'Continue to Payment',
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
