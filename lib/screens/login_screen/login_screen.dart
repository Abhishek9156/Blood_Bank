import 'dart:convert';

import 'package:blood_bank/model/login_response_model.dart';
import 'package:blood_bank/network/api.dart';
import 'package:blood_bank/screens/dashboard_screen/dashboard_screen.dart';
import 'package:blood_bank/screens/login_screen/login_controller.dart';
import 'package:blood_bank/screens/signup_screen/signup_screen.dart';
import 'package:blood_bank/utils/app_color.dart';
import 'package:blood_bank/utils/app_string.dart';
import 'package:blood_bank/utils/dimension.dart';
import 'package:blood_bank/utils/image_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/image_circular.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final loginForm = GlobalKey<FormState>();
    var loginController = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: loginForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircularImage(),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: loginController.mobileController,
                  textAlign: TextAlign.start,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: AppStrings.enter_mobile_number,
                    labelStyle: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.mainColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: loginController.passwordController,
                  textAlign: TextAlign.start,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.mainColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: SizedBox(
                        width: 329,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            if (loginForm.currentState!.validate()) {
                              Api().logInApi(
                                  context: context,
                                  mobile: loginController.mobileController.text,
                                  password:
                                      loginController.passwordController.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainColor,
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 2.5,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => SignUpScreen());
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
