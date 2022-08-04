import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  TextOverflow textOverflow;

  BigText(
      {Key? key,
      required this.text,
      this.fontSize = 20,
      this.color = const Color(0xFF332d2b),
      this.textOverflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
        fontFamily: "Roboto",
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w400
      ),
    );
  }
}
