import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skrew_counter/data/consts/constants.dart';
import 'package:skrew_counter/data/routing/routes.dart';
import 'package:skrew_counter/data/routing/routing_helper.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false; // Prevent back navigation
      },
      child: Scaffold(
          body: Container(
        width: MediaQuery.of(context).size.width * 1,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            tileMode: TileMode.mirror,
            colors: [
              Color(0xFF2F2D3A),
              Color(0xFF463259),
              Color(0xFF592735),
              Color(0xFF592735),
              Color(0xFF463259),
              Color(0xFF2F2D3A),
            ],
          ),
        ),
        child: Center(
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),

              // Clip it cleanly.
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
                child: Container(
                  color: Colors.black12,
                  height: MediaQuery.of(context).size.height * 0.6,
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 80,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'مرحبا بك في سكرو كونتر',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'هذا السكرو كونتر عبارة عن أداة بسيطة لاحتساب النقاط فقط، ولا يُمثل اللعبة الأصلية أو يحاكيها بأي صورة. \nجميع الحقوق الفكرية والعلامات التجارية الخاصة باللعبة محفوظة لمالكيها الأصليين. ',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.appSecColor,
                          ),
                        ),
                        const SizedBox(height: 40),
                        TextButton(
                            style: TextButton.styleFrom(
                              elevation: 5,
                              backgroundColor: AppColors.appSecColor,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 32),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                            onPressed: () {
                              context.pushReplacementNamed(
                                Routes.playersNumber,
                                arguments: 0,
                              );
                            },
                            child: const Text(
                              'ابدأ !',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.appMainColor,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
