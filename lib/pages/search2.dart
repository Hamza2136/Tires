// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<StatefulWidget> createState() {
    return SearchState();
  }
}

class SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: HexColor('#1A237E'),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: HexColor('#1A237E'),
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 28,
            right: 28, // Added right constraint
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: HexColor('#1A237E'), width: 1.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 15.0),
                  const Icon(Icons.search),
                  const SizedBox(width: 15.0),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: 'Enter the name of parts...',
                        hintStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 28,
            right: 28,
            child: Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(255, 239, 239, 239)),
                borderRadius: BorderRadius.circular(10.0),
                color: const Color.fromARGB(255, 239, 239, 239),
              ),
              height: 150,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10, bottom: 6),
                    child: Text(
                      'Search 1',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: HexColor('#1A237E'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 6),
                    child: Text(
                      'Search 1',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: HexColor('#1A237E'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 6),
                    child: Text(
                      'Search 1',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: HexColor('#1A237E'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 6),
                    child: Text(
                      'Search 1',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: HexColor('#1A237E'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 270,
            left: 28,
            right: 28,
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(255, 232, 232, 232)),
                borderRadius: BorderRadius.circular(10.0),
                color: const Color.fromARGB(255, 239, 239, 239),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 45,
                    child: Row(
                      children: [
                        const SizedBox(width: 15.0),
                        const Icon(Icons.search),
                        const SizedBox(width: 10.0),
                        Text(
                          'Search 1',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: HexColor('#1A237E'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 45,
                    child: Row(
                      children: [
                        const SizedBox(width: 15.0),
                        const Icon(Icons.search),
                        const SizedBox(width: 10.0),
                        Text(
                          'Search 1',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: HexColor('#1A237E'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 45,
                    child: Row(
                      children: [
                        const SizedBox(width: 15.0),
                        const Icon(Icons.search),
                        const SizedBox(width: 10.0),
                        Text(
                          'Search 1',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: HexColor('#1A237E'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 45,
                    child: Row(
                      children: [
                        const SizedBox(width: 15.0),
                        const Icon(Icons.search),
                        const SizedBox(width: 10.0),
                        Text(
                          'Search 1',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: HexColor('#1A237E'),
                          ),
                        ),
                      ],
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
