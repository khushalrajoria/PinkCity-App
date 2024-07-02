import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './landingScreen.dart';
import '../utils/helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(milliseconds: 3000), () {
      Get.to(const LandingScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                // Helper.getAssetName("splashIcon.png", "virtual"),
                'assets/images/virtual/splashIcon.png',
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                // Helper.getAssetName("MealMonkeyLogo.png", "virtual"),
                'assets/images/virtual/PinkCity.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
