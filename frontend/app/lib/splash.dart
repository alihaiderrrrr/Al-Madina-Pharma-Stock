import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'scrollingmenu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
            duration: 4000,
            splashIconSize: 500,
            splash: 'assets/images/logo.png',
            nextScreen: ScrollMenu(),
            animationDuration: Duration(seconds: 2),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.rightToLeftWithFade,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255)));
  }
}
