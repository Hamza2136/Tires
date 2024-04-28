// ignore_for_file: sized_box_for_whitespace, avoid_print
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/pages/product_details.dart';
import 'package:http/http.dart' as http;
import 'package:tires/url/url.dart';

class LatestProducts extends StatefulWidget {
  final int userId;
  const LatestProducts({super.key, required this.userId});
  @override
  State<StatefulWidget> createState() {
    return LatestProductState();
  }
}

class LatestProductState extends State<LatestProducts> {
  int userId = 0;
  @override
  void initState() {
    fetchLatestProduct();
    super.initState();
    userId = widget.userId;
  }

  List<dynamic> products = [];
  Future<void> fetchLatestProduct() async {
    try {
      var response = await http.get(Uri.parse('$url/Products/all'));
      if (response.statusCode == 200) {
        setState(() {
          products = jsonDecode(response.body);
        });
      } else {
        print('Failed to load Products: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching Products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'images/fourXfour/6.png',
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Latest Products',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(
                              path: products[index]['ImageUrl'],
                              title: products[index]['ProductName'],
                              price: products[index]['ProductPrice'],
                              description: products[index]
                                  ['ProductDescription'],
                              productId: products[index]['ProductId'],
                              userId: userId,
                            ),
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        imageUrl: products[index]['ImageUrl'],
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.fill),
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 170,
                            child: Text(
                              '${products[index]['ProductName']}',
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
                          const SizedBox(height: 20.0),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 210,
                            child: Text(
                              'RS ${products[index]['ProductPrice']}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: HexColor('#D32F2F'),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
