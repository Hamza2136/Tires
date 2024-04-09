// ignore: file_names
// ignore_for_file: sized_box_for_whitespace, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductDetails extends StatefulWidget {
  final String path;
  final String title;
  final String price;

  const ProductDetails({
    super.key,
    required this.path,
    required this.title,
    required this.price,
  });

  @override
  State<StatefulWidget> createState() {
    return ProductDetailsState();
  }
}

class ProductDetailsState extends State<ProductDetails> {
  String gpath = '';
  String gtitle = '';
  String gprice = '';

  @override
  void initState() {
    super.initState();
    // Access data directly from the constructor arguments
    gpath = widget.path;
    gtitle = widget.title;
    gprice = widget.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     height: 330,
          //     child: Image.asset(
          //       gpath,
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          Positioned(
            top: 0,
            right: 10,
            left: 10,
            bottom: 70,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  height: 330,
                  child: Image.asset(
                    gpath,
                    fit: BoxFit.cover,
                  ),
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
                  child: Text(
                    'Etiam convallis elementum sapien, a aliquam turpis aliquam vitae. Praesent sollicitudin felis vel mi facilisis posuere. Nulla ultrices facilisis justo, non varius nisl semper vel. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus at ante mattis, condimentum velit et, dignissim nunc. Integer quis tincidunt purus. Duis dignissim mauris vel elit commodo, eu hendrerit leo ultrices. Nulla vehicula vestibulum purus at rutrum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur dignissim massa nec libero scelerisque rutrum. Curabitur ac purus id elit hendrerit lacinia. Nullam sit amet sem efficitur, porta diam in, convallis tortor.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color.fromARGB(255, 110, 107, 95),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  child: Text(
                    'Size: 315/70R17 Side Wall: White letters on one side – Black side wall on the other side Overall Diameter: 34.41" Load Range: E Max Load: 3195 lbs Tread Depth: 15/32 Speed Rating: S Tread Type: All Terrain',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color.fromARGB(255, 110, 107, 95),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            )),
          ),
          Positioned(
            bottom: 15,
            left: 20,
            child: Text(
              gprice,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: HexColor('#D32F2F'),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 20,
            child: Container(
              height: 50,
              width: 180,
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
                  'Buy Now',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
