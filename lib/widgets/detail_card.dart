import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget detailCard ({width, String?title, String? count}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.color(Colors.green).size(16).make(),
      5.heightBox,
      title!.text.color(Colors.grey).make(),
    ],
  )
      .box
      .white
      .roundedSM
      .shadowSm
      .width(width)
      .padding(EdgeInsets.all(4))
      .height(70)
      .make();
}