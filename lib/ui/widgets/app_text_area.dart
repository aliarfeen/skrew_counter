import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  TextEditingController? controller;

  AppTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 60,
        decoration: BoxDecoration(
          color: Color.fromARGB(164, 217, 149, 65),
          borderRadius: BorderRadius.circular(36),
          boxShadow: [
            BoxShadow(
              color: Colors.white10,
              blurRadius: 1,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: TextField(
          cursorColor: Color.fromRGBO(0, 0, 0, 0),
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            border: InputBorder.none,
            hintTextDirection: TextDirection.rtl,
            hintText: 'إسم اللاعب 1',
          ),
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
