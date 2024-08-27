// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay of 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the Home page after the delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox.expand(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'images/assessSpash.jfif',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              color: Colors.black.withOpacity(0.2),
            ),

            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 70),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,   //the column take up only space of its children
                  children: [
                    Text(
                        'Welcome to',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    SizedBox(height: 20), // Space between the two texts
                    Text(
                      'SPEEDY CHOW', // Replace with your desired text
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
