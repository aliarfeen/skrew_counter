import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = controller!.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'أكتب حاجة اديك عليها درجة';
    }
    if (text.length > 15) {
      return 'مش هطلعلة بطاقة انا';
    }
    // return null if the text is valid
    return null;
  }

  const AppTextField({Key? key, required this.controller, this.hintText = ''});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 60,
        decoration: BoxDecoration(
          color: const Color.fromARGB(164, 217, 149, 65),
          borderRadius: BorderRadius.circular(36),
          boxShadow: const [
            BoxShadow(
              color: Colors.white10,
              blurRadius: 1,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: TextField(
          cursorColor: const Color.fromRGBO(0, 0, 0, 0),
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            border: InputBorder.none,
            hintTextDirection: TextDirection.rtl,
            hintText: hintText,
            errorText: _errorText,
          ),
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
