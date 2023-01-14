import 'package:flutter/material.dart';
import 'package:project1/Widgets/color.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton({
    super.key,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height.round();
    var w = MediaQuery.of(context).size.width.round();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w * 0.9,
        height: h * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(h * 0.01),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              MyAppColour.mainColor,
              MyAppColour.darkColor,
            ],
          ),
        ),
        child: Center(
          child: RichText(
            text: TextSpan(
              text: text,
              style: TextStyle(
                fontSize: h * 0.02,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
