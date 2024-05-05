// ignore: file_names
// ignore_for_file: sized_box_for_whitespace, file_names, duplicate_ignore, non_constant_identifier_names, use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/pages/home.dart';
import 'package:http/http.dart' as http;
import 'package:tires/url/url.dart';

class ProductDetails extends StatefulWidget {
  final String path;
  final String title;
  final int price;
  final String description;
  final int productId;
  final int userId;

  const ProductDetails(
      {super.key,
      required this.path,
      required this.title,
      required this.price,
      required this.description,
      required this.productId,
      required this.userId});

  @override
  State<StatefulWidget> createState() {
    return ProductDetailsState();
  }
}

class ProductDetailsState extends State<ProductDetails> {
  String gpath = '';
  String gtitle = '';
  int gprice = 0;
  String gdescription = '';
  int productId = 0;
  int userId = 0;
  var items = [];

  @override
  void initState() {
    super.initState();
    gpath = widget.path;
    gtitle = widget.title;
    gprice = widget.price;
    gdescription = widget.description;
    productId = widget.productId;
    userId = widget.userId;
    fetchAllItems();
  }

  TextEditingController itemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    height: 300,
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      imageUrl: gpath,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.fill),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Text(
                      gtitle,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: HexColor('#1A237E'),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Text(
                      gdescription,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 110, 107, 95),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
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
                  SizedBox(
                    width: screenWidth * 0.20,
                    child: Text(
                      'RS $gprice',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: HexColor('#D32F2F'),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Container(
                    height: 30,
                    width: screenWidth * 0.20,
                    child: TextField(
                      controller: itemController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  SizedBox(
                    width: screenWidth * 0.35,
                    child: ElevatedButton(
                      onPressed: () {
                        if (itemController.text != "") {
                          addToCart(context);
                        }
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
                        'Add to Cart',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> fetchAllItems() async {
    try {
      var response = await http.get(Uri.parse('$url/cart/uid/$userId'));
      if (response.statusCode == 200) {
        setState(() {
          items = jsonDecode(response.body);
        });
      }
    } catch (e) {
      print('Error fetching items: $e');
    }
  }

  Future<void> addToCart(BuildContext context) async {
    try {
      bool itemExistsInCart = false;
      int existingItemCount = 0;
      int cartId = 0;
      for (var item in items) {
        if (item['ProductId'] == productId && item['UserId'] == userId) {
          itemExistsInCart = true;
          existingItemCount = item['Count'];
          cartId = item['CartId'];
        }
      }

      // If the item exists in the cart, update its quantity
      if (itemExistsInCart) {
        var newCount = existingItemCount + int.parse(itemController.text);
        await updateCartItem(context, newCount, cartId);
      } else {
        // If the item doesn't exist, add it to the cart
        await createCartItem(context);
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> createCartItem(BuildContext context) async {
    try {
      var response = await http.post(
        Uri.parse('$url/Cart/add'),
        body: jsonEncode(
          {
            'ProductId': productId,
            'UserId': userId,
            'Count': int.parse(itemController.text),
            'ProductName': gtitle,
            'ProductPrice': gprice,
            'ImageUrl': gpath,
          },
        ),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        debugPrint('item added to cart successfully');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(
              userId: userId,
            ),
          ),
        );
      } else {
        debugPrint('Failed to create user: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> updateCartItem(
      BuildContext context, int newCount, int CartId) async {
    try {
      var response = await http.put(
        Uri.parse('$url/Cart/update/$CartId'),
        body: jsonEncode(
          {
            'CartId': CartId,
            'ProductName': gtitle,
            'ImageUrl': gpath,
            'ProductPrice': gprice,
            'ProductId': productId,
            'UserId': userId,
            'Count': newCount
          },
        ),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 204) {
        debugPrint('item quantity updated successfully');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(
              userId: userId,
            ),
          ),
        );
      } else {
        debugPrint('Failed to update item quantity: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('$e');
    }
  }
}
