
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText(
      {super.key,
        this.color=const Color(0xFF332d2d),
        required this.text,
        this.overflow = TextOverflow.ellipsis,
        this.size = 0});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(color: color,
          fontSize:size==0 ? 15:size,
          fontWeight: FontWeight.bold),
    );
  }
}
