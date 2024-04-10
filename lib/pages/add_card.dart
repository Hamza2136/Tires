// ignore: file_names
// ignore_for_file: sized_box_for_whitespace, file_names, duplicate_ignore, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddCardState();
  }
}

class AddCardState extends State<AddCard> {
  TextStyle fieldStyle = const TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController securityCodeController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.9;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Card',
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
              Row(
                children: [
                  Image.asset('images/payment/visa.png'),
                  const Spacer(
                    flex: 2,
                  ),
                  Image.asset('images/payment/master.png'),
                  const Spacer(
                    flex: 2,
                  ),
                  Image.asset('images/payment/american.png'),
                  const Spacer(
                    flex: 2,
                  ),
                  Image.asset('images/payment/discover.png'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor('#D32F2F'),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Scan Card',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name on Card', // Changed label to labelText
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
              Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(5.0), // Customize border
                ),
                child: Row(
                  children: [
                    Container(
                      width: screenWidth * 0.6,
                      child: TextField(
                        controller: cardNumberController,
                        decoration: InputDecoration(
                          labelText:
                              'Card Number', // Changed label to labelText
                          labelStyle: fieldStyle,
                          border: InputBorder.none,
                        ),
                        style: fieldStyle,
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Container(
                        width: screenWidth * 0.2,
                        child: Image.asset('images/payment/visa.png')),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: screenWidth * 0.4,
                    child: TextField(
                      controller: expiryDateController,
                      decoration: InputDecoration(
                        labelText: 'Expiry Date',
                        labelStyle: fieldStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      style: fieldStyle,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Container(
                    width: screenWidth * 0.4,
                    child: TextField(
                      controller: securityCodeController,
                      decoration: InputDecoration(
                        labelText:
                            'Security Code', // Changed label to labelText
                        labelStyle: fieldStyle,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      style: fieldStyle,
                    ),
                  ),
                ],
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
                controller: nickNameController,
                decoration: InputDecoration(
                  labelText: 'Nick Name', // Changed label to labelText
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
                    'Add Card',
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
