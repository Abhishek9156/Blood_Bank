import 'package:flutter/cupertino.dart';

class BloodHomeText extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;
  double size;
  final FontWeight? fontWeight;

  BloodHomeText(
      {super.key,
      this.size = 0,
      this.color = const Color(0xFF332d2d),
      required this.title,
      this.fontWeight,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title + " : ",
          style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: size == 0 ? 15 : size,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: size == 0 ? 15 : size,
          ),
        ),
      ],
    );
  }
}
