import 'package:flutter/material.dart';

class ScffoldWithBackground extends StatelessWidget {
  final Widget child;
  final bool? resizeToAvoidBottomInset;
  const ScffoldWithBackground(
      {super.key, required this.child, this.resizeToAvoidBottomInset});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
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
                child: child,
              ))),
    );
  }
}
