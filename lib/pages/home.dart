// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/pages/SideBar/register_business.dart';
import 'package:tires/pages/SideBar/setting.dart';
import 'package:tires/pages/featured_products.dart';
import 'package:tires/pages/home_search_accessories.dart';
import 'package:tires/pages/home_search_fourXfour.dart';
import 'package:tires/pages/SideBar/my_orders.dart';
import 'package:tires/pages/search2.dart';
import 'package:tires/pages/shopping_cart.dart';
import 'package:tires/pages/show_notification.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardsWidth = screenWidth * 0.85;
    return Scaffold(
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        width: screenWidth * 0.6,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterBusiness(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: HexColor('#404F68'),
                ),
              ),
              leading: const Icon(Icons.home_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Cart(),
                  ),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyOrders(),
                  ),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShowSettings(),
                  ),
                );
              },
            ),
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
              Icons.notifications_active_rounded,
              color: HexColor('#1A237E'),
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShowNotification(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: HexColor('#1A237E'),
              size: 30,
            ),
            onPressed: () {},
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Search()));
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(color: HexColor('#1A237E'), width: 1.0),
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
                          fontSize: 14,
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeSearchFourXFour()));
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: HexColor('#1A237E'),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeSearchAccessories()));
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: HexColor('#1A237E'),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FeaturedProducts()));
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
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 100,
                        width: 150,
                        child: Image.asset('images/home/f1.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 100,
                        width: 150,
                        child: Image.asset('images/home/f2.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 100,
                        width: 150,
                        child: Image.asset('images/home/f1.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 100,
                        width: 150,
                        child: Image.asset('images/home/f2.png'),
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
                    onTap: () {},
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
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 100,
                        width: 140,
                        child: Image.asset('images/home/l1.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 100,
                        width: 140,
                        child: Image.asset('images/home/l2.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 100,
                        width: 140,
                        child: Image.asset('images/home/l1.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 100,
                        width: 140,
                        child: Image.asset('images/home/l2.png'),
                      ),
                    ),
                  ],
                ),
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
