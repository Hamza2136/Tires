// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final bool isAdmin;

  const HomePage({super.key, required this.isAdmin});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAdmin = false;
  @override
  void initState() {
    super.initState();
    isAdmin = widget.isAdmin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the App!'),
            if (isAdmin) // Conditionally show UI based on isAdmin
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add Product'),
              ),
            if (isAdmin)
              ElevatedButton(
                onPressed: () {},
                child: const Text('Delete Product'),
              ),
          ],
        ),
      ),
    );
  }
}
