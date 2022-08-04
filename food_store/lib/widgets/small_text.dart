import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final double height;

  SmallText({
    Key? key,
    required this.text,
    this.fontSize = 12,
    this.height = 1.2,
    this.color = const Color(0xFFccc7c5),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: "Roboto",
          color: color,
          fontSize: fontSize,
          height: height),
    );
  }
}
