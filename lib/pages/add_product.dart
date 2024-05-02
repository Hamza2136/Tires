// ignore: file_names
// ignore_for_file: sized_box_for_whitespace, file_names, duplicate_ignore, depend_on_referenced_packages, unused_field

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tires/pages/home.dart';
import 'package:tires/url/url.dart';
import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;

class AddProduct extends StatefulWidget {
  final int userId;
  const AddProduct({super.key, required this.userId});

  @override
  State<StatefulWidget> createState() {
    return AddProductState();
  }
}

class AddProductState extends State<AddProduct> {
  File? _selectedImage;
  int userId = 0;
  @override
  void initState() {
    super.initState();
    userId = widget.userId;
  }

  TextStyle fieldStyle = const TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageUrlCodeController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.9;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Product',
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
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Product Name', // Changed label to labelText
                  labelStyle: fieldStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                style: fieldStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Description', // Changed label to labelText
                  labelStyle: fieldStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                style: fieldStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: 'Product Price', // Changed label to labelText
                  labelStyle: fieldStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                style: fieldStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: categoryController,
                decoration: InputDecoration(
                  labelText: 'Category',
                  labelStyle: fieldStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                style: fieldStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: imageUrlCodeController,
                decoration: InputDecoration(
                  labelText: 'image url', // Changed label to labelText
                  labelStyle: fieldStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                style: fieldStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              DottedBorder(
                color: Colors.black,
                strokeWidth: 1,
                child: SizedBox(
                  height: 50,
                  width: buttonWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      _pickImagefromGallery();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor('#F8F8F8'),
                      foregroundColor: HexColor('#000000'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_a_photo_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Pick Image',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    addNewProduct(
                      context,
                      nameController.text,
                      descriptionController.text,
                      imageUrlCodeController.text,
                      categoryController.text,
                      double.parse(priceController.text),
                      DateTime.now().toString(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor('#1A237E'),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: const Text(
                    'Add Product',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImagefromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;

    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  // Future<void> _saveImageToDirectory() async {
  //   if (_selectedImage == null) return;

  //   // Get the directory for storing product images
  //   Directory directory = await getApplicationDocumentsDirectory();
  //   String productImagesDir = '${directory.path}/ProductImages';
  //   if (!Directory(productImagesDir).existsSync()) {
  //     Directory(productImagesDir).createSync(recursive: true);
  //   }

  //   // Generate a unique filename
  //   String filename =
  //       '${DateTime.now().millisecondsSinceEpoch}_${path.basename(_selectedImage!.path)}';

  //   // Copy the image file to the product images directory
  //   File newImage = await _selectedImage!.copy('$productImagesDir/$filename');

  //   // Print the image path to the terminal
  //   print('Image saved to: ${newImage.path}');
  // }

  Future<void> addNewProduct(
      BuildContext context,
      String name,
      String description,
      String imageUrl,
      String category,
      double price,
      String addedDate) async {
    try {
      var response = await http.post(
        Uri.parse('$url/Products/add'),
        body: jsonEncode({
          'ProductName': name,
          'ProductDescription': description,
          'ImageUrl': imageUrl,
          'ProductCategory': category,
          'ProductPrice': price,
          'AddedDate': addedDate
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        debugPrint('Products Added Successfully');
        setState(
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(
                  userId: userId, // needed to change
                ),
              ),
            );
          },
        );
      } else {
        debugPrint('Failed to Add Product: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('$e');
    }
  }
}
