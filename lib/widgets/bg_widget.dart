import 'package:blood_bank/utils/image_const.dart';
import 'package:flutter/material.dart';

Widget bgWidget({Widget? child}) {
  return Container(
    decoration: BoxDecoration(
      image:
      DecorationImage(image: AssetImage(Imgblood), fit: BoxFit.fill),
    ),
    child: child,
  );
}