import 'package:blood_bank/model/sign_up_api_response.dart';
import 'package:blood_bank/network/api.dart';
import 'package:blood_bank/utils/app_array.dart';
import 'package:blood_bank/utils/app_string.dart';
import 'package:blood_bank/utils/image_const.dart';
import 'package:blood_bank/widgets/image_circular.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/app_color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpForm = GlobalKey<FormState>();
  String selectedGender = "";
  var bloodGroup;
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  String countryValue = "", stateValue = "", cityValue = "";

  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confPasswordController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();

  @override
  void initState() {
    passwordVisible = true;
    confirmPasswordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              child: Column(
                children: [
                  Align(alignment: Alignment.topCenter, child: CircularImage()),
                  SizedBox(height: 20),
                  //Name
                  TextField(
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      labelText: AppStrings.enter_name,
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
                  SizedBox(height: 10),
                  //Phone number
                  TextField(
                    controller: mobileController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
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
                  SizedBox(height: 10),
                  //Email
                  TextField(
                    controller: emailController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      labelText: AppStrings.enterEmail,
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
                  SizedBox(height: 10),
                  //Gender
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.mainColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Gender",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: AppColors.mainColor),
                          ),
                          margin: EdgeInsets.only(left: 10),
                        ),
                        Radio(
                          value: 'Male',
                          groupValue: selectedGender,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => AppColors.mainColor),
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value!;
                            });
                          },
                        ),
                        Text(
                          "Male",
                          style: TextStyle(color: AppColors.mainColor),
                        ),
                        Radio(
                          value: 'Female',
                          groupValue: selectedGender,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => AppColors.mainColor),
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value!;
                            });
                          },
                        ),
                        Text(
                          'Female',
                          style: TextStyle(color: AppColors.mainColor),
                        ),
                        Radio(
                          value: 'Other',
                          groupValue: selectedGender,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => AppColors.mainColor),
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value!;
                            });
                          },
                        ),
                        Text(
                          'Other',
                          style: TextStyle(color: AppColors.mainColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  //Blood group
                  DropdownButtonFormField(
                    icon: Icon(Icons.arrow_drop_down, color: AppColors.mainColor),
                    isExpanded: true,
                    decoration: InputDecoration(
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
                      // Add more decoration..
                    ),
                    hint: Text(
                      'Select Your Blood Group',
                      style: TextStyle(fontSize: 14, color: AppColors.mainColor),
                    ),
                    items: AppArray.array_blood_group
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.mainColor),
                              ),
                            ))
                        .toList(),
                    onChanged: (String? value) {
                      String? aa = value?.substring(0, 5).trim();
                      setState(() {
                        bloodGroup = value?.substring(0, 5).trim();
                      });
                    },
                  ),
                  //Country select
                  10.heightBox,
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, bottom: 3),
                    child: CSCPicker(
                      layout: Layout.vertical,
                      defaultCountry: CscCountry.India,
                      disableCountry: true,
                      dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          border:
                              Border.all(color: AppColors.mainColor, width: 1)),
                      disabledDropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          border:
                              Border.all(color: AppColors.mainColor, width: 1)),
                      selectedItemStyle: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        height: 3,
                      ),
                      onCountryChanged: (country) {
                        setState(() {
                          countryValue != country;
                        });
                      },
                      onStateChanged: (state) {
                        setState(() {
                          stateValue != state;
                        });
                      },
                      onCityChanged: (city) {
                        setState(() {
                          cityValue != city;
                        });
                      },
                    ),
                  ),
                  //Password
                  SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: passwordVisible,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    onTap: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: AppStrings.hint_password,
                      suffixIcon: Icon(
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.mainColor),
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
                  //Confirm password
                  SizedBox(height: 10),
                  TextField(
                    controller: confPasswordController,
                    obscureText: confirmPasswordVisible,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    onTap: () {
                      setState(() {
                        confirmPasswordVisible = !confirmPasswordVisible;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: AppStrings.enter_confirm_password,
                      suffixIcon: Icon(
                          confirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.mainColor),
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
                  30.heightBox,
                  Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        width: 329,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            if (signUpForm.currentState!.validate() &&
                                passwordController.text ==
                                    confPasswordController.text) {
                              SignupApi(
                                  context,
                                  nameController.text,
                                  mobileController.text,
                                  emailController.text,
                                  selectedGender,
                                  bloodGroup,
                                  stateValue,
                                  cityValue,
                                  passwordController.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainColor,
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void SignupApi(
      BuildContext context,
      String name,
      String mobile,
      String email,
      String selectedGender,
      String bloodGroup,
      String stateValue,
      String cityValue,
      String password){
    Api api = Api();

  Future<SignUpApiResponse?> signUpApiResponse;
    signUpApiResponse=  api.SignupApi(
        context: context,
        name: name,
        sex: selectedGender,
        district: cityValue,
        state: stateValue,
        bloodGroup: bloodGroup,
        email: email,
        mobile: mobile,
        password: password);
   // debugPrint(SignUpApiResponse.fromJson())
  }
}
