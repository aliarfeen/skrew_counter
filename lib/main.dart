import 'package:flutter/material.dart';
import 'package:skrew_counter/data/consts/constants.dart';
import 'package:skrew_counter/ui/screens/splash_screen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screw Counter',
      theme: ThemeData(
        fontFamily: 'LBC',
        primaryColor: AppColors.appSecColor,
        colorScheme: const ColorScheme.light(
          primary: AppColors.appSecColor,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
