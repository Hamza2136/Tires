// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:tires/pages/language.dart';
import 'package:tires/pages/splashScreen.dart';

void main() {
  // Stripe.publishableKey =
  //     'pk_test_51OGFN1SAZsydKziUe64jUPojsqbLrq8HIDUWSCbd8As9KQobLz0LGPBDVskSYHJooo3xUV7oBnqg4UcS4KLZWbfd00eE6NNsR7';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Shop',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home:
          const SplashScreenPage(), // Set the initial route to your splash screen
      routes: {
        '/main': (context) => SelectLanguage(), // Define routes for navigation
      },
    );
  }
}

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  void _navigateToMainScreen() async {
    await Future.delayed(
        const Duration(seconds: 2)); // Adjust the duration as needed
    Navigator.pushReplacementNamed(
        context, '/main'); // Navigate to the main screen
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen(); // Display your splash screen widget
  }
}
