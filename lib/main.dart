import 'package:flutter/material.dart';
import 'package:skrew_counter/data/consts/constants.dart';
import 'package:skrew_counter/data/routing/app_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  MyApp({super.key});

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
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
      initialRoute: '/onboarding',
    );
  }
}
