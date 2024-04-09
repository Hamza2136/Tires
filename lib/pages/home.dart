// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/pages/featured_products.dart';
import 'package:tires/pages/home_search.dart';
import 'package:tires/pages/search2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  Widget tempColumn(BuildContext context) {
    return Column(
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
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeSearch()));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: HexColor('#1A237E'),
            backgroundColor: Colors.white,
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu_sharp,
            color: HexColor('#1A237E'),
            size: 30,
          ),
          onPressed: () {},
        ),
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
            onPressed: () {},
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
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Search()));
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: HexColor('#1A237E'), width: 1.0),
                  borderRadius: BorderRadius.circular(5.0), // Customize border
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
          ),
          Positioned(
            top: 60,
            left: 5,
            right: 5,
            child: Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#1A237E'), width: 1.0),
                        borderRadius:
                            BorderRadius.circular(5.0), // Customize border
                        color: HexColor('#1A237E'),
                      ),
                      height: 150,
                      width: 320,
                      child: tempColumn(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#D32F2F'), width: 1.0),
                        borderRadius:
                            BorderRadius.circular(5.0), // Customize border
                        color: HexColor('#D32F2F'),
                      ),
                      height: 150,
                      width: 300,
                      child: tempColumn(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#049BDE'), width: 1.0),
                        borderRadius:
                            BorderRadius.circular(5.0), // Customize border
                        color: HexColor('#049BDE'),
                      ),
                      height: 150,
                      width: 300,
                      child: tempColumn(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#000000'), width: 1.0),
                        borderRadius:
                            BorderRadius.circular(5.0), // Customize border
                        color: HexColor('#000000'),
                      ),
                      height: 150,
                      width: 300,
                      child: tempColumn(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 210,
            left: 20,
            child: Text(
              'Featured Products',
              style: TextStyle(
                color: HexColor('#1A237E'),
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
              top: 210,
              right: 20,
              child: GestureDetector(
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
              )),
          Positioned(
            top: 238,
            left: 5,
            right: 5,
            child: Container(
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
          ),
          Positioned(
            top: 370,
            left: 20,
            child: Text(
              'Latest Products',
              style: TextStyle(
                color: HexColor('#1A237E'),
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: 370,
            right: 20,
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
          Positioned(
            top: 395,
            left: 5,
            right: 5,
            bottom: 10,
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
