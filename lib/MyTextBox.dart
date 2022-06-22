import 'package:flutter/material.dart';
class MyTextBox extends StatelessWidget {
  final String text;

  const MyTextBox({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: Colors.cyan,
      child: Center(
        child: Text(text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Lato",
            letterSpacing: 1,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}