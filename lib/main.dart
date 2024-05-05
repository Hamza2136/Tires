// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tires/pages/login.dart';
import 'package:tires/pages/splashScreen.dart';
import 'package:tires/pages/walkthroug.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe initialization
  await dotenv.load(fileName: ".env");
  Stripe.publishableKey = dotenv.env["STRIPE_PUBLISH_KEY"]!;
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
  final prefs = await SharedPreferences.getInstance();
  final showLogin = prefs.getBool('showLogin') ?? false;
  runApp(MyApp(showLogin: showLogin));
}

class MyApp extends StatelessWidget {
  final bool showLogin;
  const MyApp({
    super.key,
    required this.showLogin,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Shop',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      //home: showLogin ? Signin() : WalkThrough(),

      home: const SplashScreenPage(),
      routes: {
        '/main': (context) => showLogin ? const Signin() : const WalkThrough(),
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
