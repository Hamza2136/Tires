// ignore: file_names
// ignore_for_file: sized_box_for_whitespace, file_names, duplicate_ignore, depend_on_referenced_packages, use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/Status/orderStatus.dart';
import 'package:tires/Status/paymentStatus.dart';
import 'package:tires/Stripe/stripe_payment.dart';
import 'package:tires/pages/orderSuccess.dart';
import 'package:http/http.dart' as http;
import 'package:tires/url/url.dart';

class Payment extends StatefulWidget {
  final int userId;
  final String totalAmount;
  final int discountAmount;

  const Payment({
    super.key,
    required this.userId,
    required this.totalAmount,
    required this.discountAmount,
  });

  @override
  State<StatefulWidget> createState() => PaymentState();
}

class PaymentState extends State<Payment> {
  int userId = 0;
  String totalAmount = '';
  int discountAmount = 0;
  String? paymentIntentId = '';
  String? sessionId = '';

  @override
  void initState() {
    super.initState();
    userId = widget.userId;
    totalAmount = widget.totalAmount;
    discountAmount = widget.discountAmount;
  }

  bool isSuccessful = false;
  void goTonextPage(BuildContext context, int userid) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderSuccess(
          userId: userid,
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController postalcodeController = TextEditingController();
  String selectedCurrency = 'PKR';
  List<String> currencyList = <String>[
    'PKR',
    'USD',
    'INR',
    'EUR',
    'JPY',
    'GBP',
    'AED'
  ];
  Future<void> stripeinitPaymentSheet() async {
    try {
      final data = await createStripePaymentIntent(
        amount: (int.parse(totalAmount) * 100).toString(),
        currency: selectedCurrency,
        name: nameController.text,
        address: addressController.text,
        pin: postalcodeController.text,
        city: cityController.text,
        state: stateController.text,
        country: countryController.text,
      );
      print('whole data : $data');
      paymentIntentId = data['id'];
      sessionId = 'Currently its null hahahhahhhahahhahhah';
      print('Session ID: $sessionId');
      print('payment intent : $paymentIntentId');
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Set to true for custom flow
          customFlow: false,
          // Main params
          merchantDisplayName: 'HA Merchant',
          paymentIntentClientSecret: data['client_secret'],
          // Customer keys
          customerEphemeralKeySecret: data['ephemeralKey'],
          customerId: data['id'],
          style: ThemeMode.dark,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      rethrow;
    }
  }

  Future<void> addOrderHeader(
    BuildContext context,
    String name,
    String address,
    String city,
    String state,
    String country,
    int phone,
    String postalCode,
    DateTime dateofOrder,
    // DateTime dateofShipping,
    double orderTotal,
    String orderStatus,
    String paymentStatus,
    DateTime dateofPayment,
    // String trackingNumber,
    // String carrier,
    String sessionId,
    String paymentIntentid,
  ) async {
    try {
      var response = await http.post(
        Uri.parse('$url/orderheader/add'),
        body: jsonEncode(
          {
            'UserId': userId,
            'Name': name,
            'CompleteAddress': address,
            'City': city,
            'State': state,
            'Country': country,
            'PhoneNumber': phone,
            'PostalCode': postalCode,
            'DateOfOrder': dateofOrder.toIso8601String(),
            // 'DateOfShipping':
            //     dateofShipping.toIso8601String(),
            'OrderTotal': orderTotal,
            'OrderStatus': orderStatus,
            'PaymentStatus': paymentStatus,
            // 'TrackingNumber': trackingNumber,
            // 'Carrier': carrier,
            'SessionId': sessionId,
            'PaymentIntentId': paymentIntentid,
            'DateOfPayment': dateofPayment.toIso8601String(),
          },
        ),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        debugPrint('OrderHeader Added Successfully');
        goTonextPage(context, userId);
      } else {
        debugPrint('Failed to Add OrderHeader: ${response.body}');
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> deleteCart(int userId) async {
    try {
      var response =
          await http.delete(Uri.parse('$url/cart/deleteuid/$userId'));
      if (response.statusCode == 204) {
        print('Cart Items deleted Successfully');
      } else {
        print('Failed to Delete item: ${response.statusCode}');
      }
    } catch (e) {
      print('Error Deleting item: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.9;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  validator: (value) => value != null && value.isEmpty
                      ? 'Name is Required'
                      : null,
                  decoration: const InputDecoration(
                    label: Text("Name"),
                    hintText: "Ex. Hamza",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: addressController,
                  validator: (value) => value != null && value.isEmpty
                      ? 'Address is Required'
                      : null,
                  decoration: const InputDecoration(
                    label: Text("Address Line"),
                    hintText: "Ex. 123 Main St",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        validator: (value) => value != null && value.isEmpty
                            ? 'Phone is Required'
                            : null,
                        decoration: const InputDecoration(
                          label: Text("Phone"),
                          hintText: "Ex. 0300-0000000",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 5,
                      child: DropdownMenu<String>(
                        inputDecorationTheme: InputDecorationTheme(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                        initialSelection: currencyList.first,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            selectedCurrency = value!;
                          });
                        },
                        dropdownMenuEntries: currencyList
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        controller: cityController,
                        validator: (value) => value != null && value.isEmpty
                            ? 'City is Required'
                            : null,
                        decoration: const InputDecoration(
                          label: Text("City"),
                          hintText: "Ex. Lahore",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        controller: stateController,
                        validator: (value) => value != null && value.isEmpty
                            ? 'State is Required'
                            : null,
                        decoration: const InputDecoration(
                          label: Text("State"),
                          hintText: "Ex. Punjab",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: TextFormField(
                            controller: countryController,
                            validator: (value) => value != null && value.isEmpty
                                ? 'Country is Required'
                                : null,
                            decoration: const InputDecoration(
                              label: Text('Country'),
                              hintText: 'Ex. Pakistan',
                            ))),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 5,
                        child: TextFormField(
                            controller: postalcodeController,
                            keyboardType: TextInputType.number,
                            validator: (value) => value != null && value.isEmpty
                                ? 'PostalCode is Required'
                                : null,
                            decoration: const InputDecoration(
                              label: Text('Postal/Zip Code'),
                              hintText: 'Ex. 12345',
                            ))),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Discount',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: HexColor('#1A237E'),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      'RS $discountAmount',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: HexColor('#D32F2F'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: HexColor('#1A237E'),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      'RS $totalAmount',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: HexColor('#D32F2F'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: buttonWidth,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await stripeinitPaymentSheet();
                        try {
                          await Stripe.instance.presentPaymentSheet();
                          isSuccessful = true;
                          if (isSuccessful) {
                            addOrderHeader(
                              context,
                              nameController.text,
                              addressController.text,
                              cityController.text,
                              stateController.text,
                              countryController.text,
                              int.parse(phoneController.text),
                              postalcodeController.text,
                              DateTime.now(),
                              double.parse(totalAmount),
                              OrderStatuses().statusPending,
                              PaymentStatuses().statusApproved,
                              DateTime.now(),
                              // 'abcd1234',
                              // 'Leapord',
                              sessionId!,
                              paymentIntentId!,
                            );
                            deleteCart(userId);
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Payment Done",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                        } catch (e) {
                          print("payment sheet failed");
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              "Payment Failed",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.redAccent,
                          ));
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor('#1A237E'),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const Text(
                      'Place Order',
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
      ),
    );
  }
}
