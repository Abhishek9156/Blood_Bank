import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/image_const.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80),
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(100),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.mainColor,
                blurRadius: 8.0,
                offset: Offset(0, 5)),
            BoxShadow(color:AppColors.mainColor, offset: Offset(-8, -5),blurRadius: 5),

          ],

          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(ImgbloodDonation))),
    );
  }
}
