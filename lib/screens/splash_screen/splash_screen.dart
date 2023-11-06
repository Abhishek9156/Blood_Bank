import 'dart:async';

import 'package:blood_bank/screens/dashboard_screen/dashboard_screen.dart';
import 'package:blood_bank/screens/login_screen/login_screen.dart';
import 'package:blood_bank/utils/app_color.dart';
import 'package:blood_bank/utils/dimension.dart';
import 'package:blood_bank/utils/image_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double bottomPosition = 0.0;
  double targetPosition =
      Dimensions.height300; // Adjust this value to set the final position.
  Duration animationDuration = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    // Start the animation automatically after a delay (e.g., 2 seconds).
    Timer(Duration(seconds: 2), () {
      setState(() {
        bottomPosition = targetPosition;
      });
    });
    Future.delayed(Duration(seconds: 6), () async{
      SharedPreferences preferences=await SharedPreferences.getInstance();
      if(preferences.getString("user_id") != null){
        Get.to(() =>  DashboardScreen());
      }else {
        Get.to(() => const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
              top: Dimensions.height250,
              left: 0,
              right: 0,
              child: Container(
                child: Image.asset(
                  Imghelp,
                  width: Dimensions.height150,
                  height: Dimensions.height150,
                ),
              )),
          AnimatedPositioned(
            duration: animationDuration,
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            bottom: bottomPosition,
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'BloodBank',
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: Dimensions.font25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Donate Blood, Save Life',
                      style:
                          TextStyle(color: AppColors.mainColor, fontSize: Dimensions.font20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



