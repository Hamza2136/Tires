// ignore: file_names
// ignore_for_file: sized_box_for_whitespace, file_names, duplicate_ignore, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/pages/home.dart';
import 'package:tires/pages/payment.dart';
import 'package:tires/url/url.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  final int UserId;

  const Cart({
    super.key,
    required this.UserId,
  });

  @override
  State<StatefulWidget> createState() {
    return CartState();
  }
}

class CartState extends State<Cart> {
  var item_Count = 0;
  int userId = 0;
  int discountAmount = 0;
  var items = [];
  int totalAmount = 0;
  bool discountApplied = false;
  int withoutDiscount = 0;
  @override
  void initState() {
    super.initState();
    userId = widget.UserId;
    fetchItems();
  }

  Future<void> fetchItems() async {
    try {
      var response = await http.get(Uri.parse('$url/cart/uid/$userId'));
      if (response.statusCode == 200) {
        setState(() {
          items = jsonDecode(response.body);
          item_Count = items.length;
          calculateTotalAmount();
        });
      } else {
        print('No items Found');
      }
    } catch (e) {
      print('Error fetching items: $e');
    }
  }

  Future<void> incrementItem(int cartId) async {
    try {
      var response = await http.put(Uri.parse('$url/cart/increment/$cartId'));
      if (response.statusCode == 200) {
        setState(() {
          fetchItems();
          calculateTotalAmount();
        });
      } else {
        print('Failed to Increment item: ${response.statusCode}');
      }
    } catch (e) {
      print('Error Incrementing item: $e');
    }
  }

  Future<void> decrementItem(int cartId) async {
    try {
      var response = await http.put(Uri.parse('$url/cart/decrement/$cartId'));
      if (response.statusCode == 200) {
        setState(() {
          fetchItems();
          calculateTotalAmount();
        });
      } else {
        print('Failed to Decrement item: ${response.statusCode}');
      }
    } catch (e) {
      print('Error Decrementing item: $e');
    }
  }

  Future<void> deleteItem(int cartId) async {
    try {
      var response = await http.delete(Uri.parse('$url/cart/delete/$cartId'));
      if (response.statusCode == 204) {
        setState(() {
          fetchItems();
          calculateTotalAmount();
        });
      } else {
        print('Failed to Delete item: ${response.statusCode}');
      }
    } catch (e) {
      print('Error Deleting item: $e');
    }
  }

  void calculateTotalAmount() {
    totalAmount = 0;
    for (var item in items) {
      totalAmount += item['Count'] * item['ProductPrice'] as int;
    }
    withoutDiscount = totalAmount;
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  TextEditingController couponController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double buttonWidth = screenWidth * 0.3;
    double fieldWidth = screenWidth * 0.5;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
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
                    'Products',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: HexColor('#1A237E'),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    '$item_Count items',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: HexColor('#1A237E'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    height: screenHeight * 0.45,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    imageUrl: items[index]['ImageUrl'],
                                    imageBuilder: (context, imageProvider) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.fill)),
                                      );
                                    },
                                  ),
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          220,
                                      child: Text(
                                        items[index]['ProductName'],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: HexColor('#1A237E'),
                                          fontFamily: 'Montserrat',
                                          overflow: TextOverflow.clip,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Each: ${items[index]['ProductPrice']}',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: HexColor('#D32F2F'),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      'Total: ${items[index]['Count'] * items[index]['ProductPrice']}',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: HexColor('#D32F2F'),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          deleteItem(items[index]['CartId']);
                                          if (items.length <= 1) {
                                            _showSnackBar(
                                                context, 'No item in Cart');
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Home(userId: userId),
                                              ),
                                            );
                                          }
                                        });
                                      },
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: HexColor('#1A237E'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          incrementItem(items[index]['CartId']);
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: HexColor('#1A237E'),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Icon(
                                            Icons.keyboard_arrow_up,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${items[index]['Count']}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: HexColor('#1A237E'),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          decrementItem(items[index]['CartId']);
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: HexColor('#1A237E'),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: fieldWidth,
                    child: TextField(
                      controller: couponController,
                      decoration: InputDecoration(
                        hintText: 'Coupon Number',
                        hintStyle: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  SizedBox(
                    height: 50,
                    width: buttonWidth,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (couponController.text.isNotEmpty &&
                              !discountApplied &&
                              totalAmount > 0) {
                            if (int.parse(couponController.text) == 4000) {
                              discountAmount = 1000;
                              withoutDiscount = totalAmount;
                              totalAmount = totalAmount - discountAmount;
                              discountApplied = true;
                            } else {
                              discountAmount = 0;
                            }
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
                        'Apply',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
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
                    'Total Without Discount',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: HexColor('#1A237E'),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    'RS $withoutDiscount',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
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
                    'Discount',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17,
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
                      fontSize: 17,
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
                      fontSize: 20,
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
                      fontSize: 20,
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
                width: screenWidth * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    if (totalAmount > 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Payment(
                            userId: userId,
                            totalAmount: totalAmount.toString(),
                            discountAmount: discountAmount,
                          ),
                        ),
                      );
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
                    'CheckOut',
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
