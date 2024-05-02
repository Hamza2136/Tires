// ignore: file_names
// ignore_for_file: sized_box_for_whitespace, file_names, duplicate_ignore, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/pages/successpayment.dart';
import 'package:http/http.dart' as http;

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PaymentState();
}

class PaymentState extends State<Payment> {
  // Future<Map<String, dynamic>>? paymentIntent;

  // Future<Map<String, dynamic>> createPaymentIntent() async {
  //   try {
  //     Map<String, dynamic> body = {"amount": "10000", "currency": "USD"};
  //     http.Response response = await http.post(
  //       Uri.parse('https://api.stripe.com/v1/payment_intents'),
  //       body: body,
  //       headers: {
  //         'Authorization':
  //             'Bearer sk_test_51OGFN1SAZsydKziU5fD5gqnlwkdxwSvP8HpLdJNdSXdhaxG7lgDiSnPT79ngDpyDChhESgCPUzyqTtCE7YG9LUss00osWz0fWt',
  //         'Content-type': 'application/x-www-form-urlencoded',
  //       },
  //     );
  //     return json.decode(response.body);
  //   } catch (e) {
  //     print(e.toString());
  //     return {};
  //   }
  // }

  // void makePayment() async {
  //   try {
  //     paymentIntent = createPaymentIntent();
  //     var gpay = const PaymentSheetGooglePay(
  //       merchantCountryCode: "US",
  //       currencyCode: "USD",
  //       testEnv: true,
  //     );
  //     await Stripe.instance.initPaymentSheet(
  //       paymentSheetParameters: SetupPaymentSheetParameters(
  //         paymentIntentClientSecret: (await paymentIntent)!["client_secret"],
  //         style: ThemeMode.dark,
  //         merchantDisplayName: "Hamza",
  //         googlePay: gpay,
  //       ),
  //     );
  //     displayPaymentSheet();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // displayPaymentSheet() async {
  //   try {
  //     await Stripe.instance.presentPaymentSheet();
  //     print('Done');
  //   } catch (e) {
  //     print('Failed');
  //   }
  // }

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
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    print('hahhhahahha');
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
                      Icon(Icons.payment_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Payment With Stripe',
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
              const SizedBox(
                height: 20,
              ),
              SizedBox(
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
                      Icon(Icons.payment_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Payment With EasyPaisa',
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
              const SizedBox(
                height: 20,
              ),
              SizedBox(
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
                      Icon(Icons.payment_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Payment With Jazz Cash',
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
                    'RS 200',
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
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'SubTotal',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: HexColor('#1A237E'),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    'RS 34000',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
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
                    'RS 33800',
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderSuccess(),
                      ),
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
    );
  }
}
