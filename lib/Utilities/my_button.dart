import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final String text;
  VoidCallback onPressed;

  MyButton({required this.text,required this.onPressed,super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color:Theme.of(context).primaryColor,
        onPressed: onPressed,
      child: Text(text,style:const TextStyle(color: Colors.white)),
    );
  }
}
