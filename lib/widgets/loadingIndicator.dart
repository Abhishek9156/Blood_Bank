import 'package:blood_bank/utils/app_color.dart';
import 'package:flutter/material.dart';

Widget loadingIndicator(){
  return  CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(AppColors.mainColor),
  );
}