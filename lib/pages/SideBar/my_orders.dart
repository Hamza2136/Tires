// ignore: file_names
// ignore_for_file: sized_box_for_whitespace, file_names, duplicate_ignore, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/pages/shopping_cart.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyOrdersState();
  }
}

class MyOrdersState extends State<MyOrders> {
  TextEditingController couponController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Orders',
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
                  Text(
                    'Active Orders',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: HexColor('#1A237E'),
                      decoration: TextDecoration.underline,
                      decorationColor: HexColor('#D32F2F'),
                      decorationThickness: 2,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    'Past Orders',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: HexColor('#1A237E'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Cart(),
                        ),
                      );
                    },
                    child: Card(
                      color: const Color.fromARGB(255, 205, 204, 202),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.asset('images/tiresandwheels/1.png'),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Text(
                                    '#123454',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: HexColor('#1A237E'),
                                      fontFamily: 'Montserrat',
                                      overflow: TextOverflow.clip,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 180,
                                  child: Text(
                                    'Jeep BF Goodrich Tires',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: HexColor('#1A237E'),
                                      fontFamily: 'Montserrat',
                                      overflow: TextOverflow.clip,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'RS 34000',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: HexColor('#D32F2F'),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
