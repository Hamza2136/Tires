import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tires/pages/4x4Search.dart';

class HomeSearchAccessories extends StatefulWidget {
  const HomeSearchAccessories({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeSearchAccessoriesState();
  }
}

class HomeSearchAccessoriesState extends State<HomeSearchAccessories> {
  List<String> brandDropdown = [
    'Select Brand',
    'Gladiator',
    'Spectator',
    'Tiger'
  ];
  List<String> modelDropdown = ['Select Model', 'Mojova', 'Rubicorn', 'Sports'];
  List<String> yearDropdown = ['Select Year', '2021', '2022', '2023', '2024'];
  var selectedBrand = 'Select Brand';
  var selectedYear = 'Select Year';
  var selectedModel = 'Select Model';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Find Accessories for your car',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: HexColor('#1A237E'),
                  fontFamily: 'Montserrat',
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
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
                  items: brandDropdown
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
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
                  items: modelDropdown
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
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
                  items: yearDropdown
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
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
        ),
      ),
    );
  }
}
