import 'package:flutter/material.dart';

class MyNumberButton extends StatelessWidget {
  MyNumberButton({super.key,
  required this.text, required this.color, required this.textColor, required this.ontap});
  
  final color;
  final String text;
  final textColor;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: ontap,
          child: Container(
            color: color,
            child: Center(
              child: Text(text,
              style: TextStyle(
                color: textColor,
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
