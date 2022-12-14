import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final double height;
  int? maxLines;

  SmallText({
    Key? key,
    required this.text,
    this.fontSize = 12,
    this.height = 1.2,
    this.color = const Color(0xFFccc7c5),
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      maxLines: maxLines,
      style: TextStyle(
        fontFamily: "Roboto",
        color: color,
        fontSize: fontSize,
        height: height,
      ),
    );
  }
}
