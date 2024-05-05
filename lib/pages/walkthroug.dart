// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tires/pages/login.dart';

class WalkThrough extends StatefulWidget {
  const WalkThrough({super.key});

  @override
  State<WalkThrough> createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  final pageController = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
    required double height,
    required double width,
  }) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            urlImage,
            fit: BoxFit.fill,
            height: height,
            width: width,
          ),
          const SizedBox(
            height: 64,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.teal.shade700,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              subtitle,
              style: TextStyle(
                color: Colors.teal.shade700,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 6);
          },
          children: [
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'images/walkthrough/bg1.jpeg',
              title: 'Jeeps',
              subtitle:
                  'We deals in all kinds of parts of jeeps and other vehicle so contact us as soon as possible.',
              height: screenHeight * 0.5,
              width: screenWidth * 0.9,
            ),
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'images/walkthrough/bg2.jpeg',
              title: 'Jeeps',
              subtitle:
                  'We deals in all kinds of parts of jeeps and other vehicle so contact us as soon as possible.',
              height: screenHeight * 0.5,
              width: screenWidth * 0.9,
            ),
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'images/walkthrough/bg3.jpeg',
              title: 'Jeeps',
              subtitle:
                  'We deals in all kinds of parts of jeeps and other vehicle so contact us as soon as possible.',
              height: screenHeight * 0.5,
              width: screenWidth * 0.9,
            ),
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'images/walkthrough/bg4.jpeg',
              title: 'Jeeps',
              subtitle:
                  'We deals in all kinds of parts of jeeps and other vehicle so contact us as soon as possible.',
              height: screenHeight * 0.5,
              width: screenWidth * 0.9,
            ),
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'images/walkthrough/bg5.jpeg',
              title: 'Jeeps',
              subtitle:
                  'We deals in all kinds of parts of jeeps and other vehicle so contact us as soon as possible.',
              height: screenHeight * 0.5,
              width: screenWidth * 0.9,
            ),
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'images/walkthrough/bg6.jpeg',
              title: 'Jeeps',
              subtitle:
                  'We deals in all kinds of parts of jeeps and other vehicle so contact us as soon as possible.',
              height: screenHeight * 0.5,
              width: screenWidth * 0.9,
            ),
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'images/walkthrough/bg7.jpeg',
              title: 'Jeeps',
              subtitle:
                  'We deals in all kinds of parts of jeeps and other vehicle so contact us as soon as possible.',
              height: screenHeight * 0.5,
              width: screenWidth * 0.9,
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                backgroundColor: Colors.teal.shade700,
                minimumSize: const Size.fromHeight(80),
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showLogin', true);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Signin(),
                  ),
                );
              },
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      pageController.jumpToPage(6);
                    },
                    child: const Text('SKIP'),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 7,
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.teal.shade700,
                      ),
                      onDotClicked: (index) => pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text('NEXT'),
                  )
                ],
              ),
            ),
    );
  }
}
