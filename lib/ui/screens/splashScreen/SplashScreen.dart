import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/authentication/loginScreen/LoginScreen.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/homeScreen/HomeScreen.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/onBoardScreen/onBoardScreen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash screen';
  SplashScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff5078F2), Color(0xffEFE9F4)],
        ),
      ),
      child: AnimatedSplashScreen(
        splash: Lottie.asset('assets/images/splash.json'),
        backgroundColor: Colors.transparent,
        nextScreen: OnBoardingScreen(),
        splashIconSize: 400,
        duration: 5000,
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: const Duration(seconds: 1),
      ),
    );
  }

}
