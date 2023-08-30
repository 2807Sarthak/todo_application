import 'package:flutter/material.dart';

// ignore: must_be_immutable
class myButtons extends StatelessWidget {

  final String text;
  VoidCallback onPressed;

   myButtons({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: const Color.fromARGB(255, 214, 214, 214),
      child: Text(text),
    );
  }
}
