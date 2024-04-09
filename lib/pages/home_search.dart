import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/pages/4x4Search.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeSearchState();
  }
}

class HomeSearchState extends State<HomeSearch> {
  List<String> brandDropdown = ['Gladiator', 'Spectator', 'Tiger'];
  List<String> modelDropdown = ['Mojova', 'Rubicorn', 'Sports'];
  List<String> yearDropdown = ['2020', '2021', '2022', '2023', '2024'];
  var selectedBrand = 'Gladiator';
  var selectedYear = '2024';
  var selectedModel = 'Mojova';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            top: 25,
            left: 30,
            right: 30,
            child: Text(
              'Find parts for 4x4 and adventures',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: HexColor('#1A237E'),
                fontFamily: 'Montserrat',
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 28,
            right: 28, // Added right constraint
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: HexColor('#1A237E'),
              ),
              value: selectedBrand, // Current value in the dropdown menu
              icon: Icon(
                Icons.arrow_drop_down,
                color: HexColor('#1A237E'),
              ), // Down arrow icon
              iconSize: 25,
              // style: TextStyle(color: Colors.black),
              onChanged: (value) {
                setState(() {
                  selectedBrand = value.toString();
                });
              },
              items:
                  brandDropdown.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: 230,
            left: 28,
            right: 28, // Added right constraint
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: HexColor('#1A237E'),
              ),
              value: selectedModel, // Current value in the dropdown menu
              icon: Icon(
                Icons.arrow_drop_down,
                color: HexColor('#1A237E'),
              ), // Down arrow icon
              iconSize: 25,
              // style: TextStyle(color: Colors.black),
              onChanged: (value) {
                setState(() {
                  selectedModel = value.toString();
                });
              },
              items:
                  modelDropdown.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: 310,
            left: 28,
            right: 28, // Added right constraint
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: HexColor('#1A237E'),
              ),
              value: selectedYear, // Current value in the dropdown menu
              icon: Icon(
                Icons.arrow_drop_down_outlined,
                color: HexColor('#1A237E'),
              ), // Down arrow icon
              iconSize: 25,
              onChanged: (value) {
                setState(() {
                  selectedYear = value.toString();
                });
              },
              items: yearDropdown.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: 390,
            left: 28,
            right: 28,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FourXFourSearch()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor('#1A237E'),
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Search',
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
    );
  }
}
