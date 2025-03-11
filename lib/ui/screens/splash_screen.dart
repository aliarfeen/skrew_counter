import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:skrew_counter/ui/screens/add_players.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
      splashIconSize: 300,
      splash: 'assets/images/splash.png',
      backgroundColor: Color(0xff463259),
      duration: 3000,
      nextScreen: PlayersNumber(),
    );
  }
}
