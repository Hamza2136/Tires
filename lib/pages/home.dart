// ignore_for_file: sized_box_for_whitespace, avoid_print, use_build_context_synchronously
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tires/pages/SideBar/register_business.dart';
import 'package:tires/pages/SideBar/setting.dart';
import 'package:tires/pages/add_product.dart';
import 'package:tires/pages/latest_product.dart';
import 'package:tires/pages/login.dart';
import 'package:tires/pages/product_details.dart';
import 'package:tires/pages/featured_products.dart';
import 'package:tires/pages/home_search_accessories.dart';
import 'package:tires/pages/home_search_fourXfour.dart';
import 'package:tires/pages/SideBar/my_orders.dart';
import 'package:tires/pages/search2.dart';
import 'package:tires/pages/shopping_cart.dart';
import 'package:tires/pages/walkthroug.dart';
import 'package:tires/url/url.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatefulWidget {
  final int userId;
  const Home({super.key, required this.userId});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int userId = 0;
  @override
  void initState() {
    fetchProducts();
    super.initState();
    userId = widget.userId;
  }

  final bool isAdmin = true;
  List<dynamic> products = [];
  Future<void> fetchProducts() async {
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

  void goToPage(BuildContext context, pageName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pageName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardsWidth = screenWidth * 0.85;
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        drawer: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          width: screenWidth * 0.65,
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset('images/logo.png'),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'Register Business',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: HexColor('#404F68'),
                  ),
                ),
                leading: const Icon(Icons.category_outlined),
                onTap: () {
                  goToPage(context, const RegisterBusiness());
                },
              ),
              ListTile(
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: HexColor('#404F68'),
                  ),
                ),
                leading: const Icon(Icons.person_2_outlined),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'My Cart',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: HexColor('#404F68'),
                  ),
                ),
                leading: const Icon(Icons.shopping_bag_outlined),
                onTap: () {
                  goToPage(context, Cart(UserId: userId));
                },
              ),
              ListTile(
                title: Text(
                  'Favourites',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: HexColor('#404F68'),
                  ),
                ),
                leading: const Icon(Icons.bookmark_border),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'My Orders',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: HexColor('#404F68'),
                  ),
                ),
                leading: const Icon(Icons.fact_check_outlined),
                onTap: () {
                  goToPage(context, const MyOrders());
                },
              ),
              ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: HexColor('#404F68'),
                  ),
                ),
                leading: const Icon(Icons.settings),
                onTap: () {
                  goToPage(context, const ShowSettings());
                },
              ),
              ListTile(
                title: Text(
                  'Get Started',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: HexColor('#404F68'),
                  ),
                ),
                leading: const Icon(Icons.start),
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showLogin', false);
                  goToPage(context, const WalkThrough());
                },
              ),
              if (isAdmin)
                ListTile(
                  title: Text(
                    'Add Product',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: HexColor('#404F68'),
                    ),
                  ),
                  leading: const Icon(Icons.add_circle),
                  onTap: () {
                    goToPage(context, AddProduct(userId: userId));
                  },
                ),
              Text(userId.toString()),
            ],
          ),
        ),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu_sharp,
                color: HexColor('#1A237E'),
                size: 30,
              ),
              onPressed: () {
                build(context);
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: HexColor('#1A237E'),
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: HexColor('#1A237E'),
                size: 30,
              ),
              onPressed: () {
                goToPage(context, Cart(UserId: userId));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.logout,
                color: HexColor('#1A237E'),
                size: 30,
              ),
              onPressed: () async {
                goToPage(context, const Signin());
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    goToPage(context, const Search());
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: HexColor('#1A237E'), width: 1.0),
                      borderRadius:
                          BorderRadius.circular(5.0), // Customize border
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 15.0),
                        Icon(Icons.search),
                        SizedBox(width: 15.0),
                        Text(
                          'Search name or chasis number',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: HexColor('#1A237E'), width: 1.0),
                            borderRadius:
                                BorderRadius.circular(5.0), // Customize border
                            color: HexColor('#1A237E'),
                          ),
                          height: 150,
                          width: cardsWidth,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Search for',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                '4X4 Parts',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 140,
                                child: ElevatedButton(
                                  onPressed: () {
                                    goToPage(
                                        context, const HomeSearchFourXFour());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: HexColor('#1A237E'),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                  child: Text(
                                    'Search',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: HexColor('#1A237E'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: HexColor('#D32F2F'), width: 1.0),
                            borderRadius:
                                BorderRadius.circular(5.0), // Customize border
                            color: HexColor('#D32F2F'),
                          ),
                          height: 150,
                          width: cardsWidth,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Search for',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                'Accessories',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 140,
                                child: ElevatedButton(
                                  onPressed: () {
                                    goToPage(
                                        context, const HomeSearchAccessories());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: HexColor('#1A237E'),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                  child: Text(
                                    'Search',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: HexColor('#D32F2F'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Featured Products',
                      style: TextStyle(
                        color: HexColor('#1A237E'),
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        goToPage(context, FeaturedProducts(userId: userId));
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(
                          color: HexColor('#1A237E'),
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            goToPage(
                                context,
                                ProductDetails(
                                  path: products[index]['ImageUrl'],
                                  title: products[index]['ProductName'],
                                  price: products[index]['ProductPrice'],
                                  description: products[index]
                                      ['ProductDescription'],
                                  productId: products[index]['ProductId'],
                                  userId: userId,
                                ));
                          },
                          child: Container(
                            height: 200,
                            width: 200,
                            child: CachedNetworkImage(
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              imageUrl: products[index]['ImageUrl'],
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill)),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Latest Products',
                      style: TextStyle(
                        color: HexColor('#1A237E'),
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        goToPage(context, LatestProducts(userId: userId));
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(
                          color: HexColor('#1A237E'),
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            goToPage(
                              context,
                              ProductDetails(
                                path: products[index]['ImageUrl'],
                                title: products[index]['ProductName'],
                                price: products[index]['ProductPrice'],
                                description: products[index]
                                    ['ProductDescription'],
                                productId: products[index]['ProductId'],
                                userId: userId,
                              ),
                            );
                          },
                          child: Container(
                            height: 200,
                            width: 200,
                            child: CachedNetworkImage(
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              imageUrl: products[index]['ImageUrl'],
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill)),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
