import 'dart:convert';

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/indian_state.dart';
import '../../network/api.dart';
import '../../utils/app_array.dart';
import '../../utils/app_color.dart';
import '../../utils/app_string.dart';

class InsertDonation extends StatefulWidget {
  const InsertDonation({super.key});

  @override
  State<InsertDonation> createState() => _InsertDonationState();
}

class _InsertDonationState extends State<InsertDonation> {
  List<IndianState> indianStates = [];
  String selectedState = "";
  String selectedDistrict = "";

  @override
  void initState() {
    super.initState();
     loadIndianStates();
  }

  Future<void> loadIndianStates() async {
    final String jsonContent = await rootBundle.loadString('assets/country.json');
    final List<dynamic> jsonList = json.decode(jsonContent)['states'];
    indianStates = jsonList.map((json) => IndianState(json['state'],
        List<String>.from(json['districts']))).toList();

    setState(() {
      selectedState = indianStates[0].name;
      selectedDistrict = indianStates[0].districts[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    String? bloodGroup = "";
    final form = GlobalKey<FormState>();
    var mobileController = TextEditingController();
    var bloodQtyController = TextEditingController();
    var nameController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: form,
                child: Column(
                  children: [
                    //name
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
                    10.heightBox,
                    //phone number
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
                    10.heightBox,
                    //blood quantity
                    TextField(
                      controller: bloodQtyController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      maxLength: 1,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        labelText: AppStrings.blood_quantity,
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
                    10.heightBox,
                    //blood group
                    DropdownButtonFormField(
                      icon: Icon(Icons.arrow_drop_down,
                          color: AppColors.mainColor),
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
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor),
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
                        bloodGroup = value?.substring(0, 5).trim();
                      },
                    ),
                    10.heightBox,

                    //State



                    DropdownButtonFormField(
                      icon: Icon(
                          Icons.arrow_drop_down, color: AppColors.mainColor),
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
                        'Select State',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight
                            .bold, color: AppColors.mainColor),
                      ),
                      value: selectedState,
                      items: indianStates.map((state) =>
                         DropdownMenuItem<String>(
                          value: state.name,
                          child: Text(
                            state.name,
                            style: TextStyle(
                                fontSize: 14, color: AppColors.mainColor),
                          ),
                        )
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedState = value!;
                          selectedDistrict = indianStates
                              .firstWhere((state) => state.name == selectedState)
                              .districts[0];
                        });
                      },
                    ),
                    10.heightBox,
                    //district
                    DropdownButtonFormField(
                      icon: Icon(
                          Icons.arrow_drop_down, color: AppColors.mainColor),
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
                        'Select District',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight
                            .bold, color: AppColors.mainColor),
                      ),
                      value: selectedDistrict,
                      items: indianStates
                          .firstWhere((state) => state.name == selectedState)
                          .districts
                          .map((district) {
                        return DropdownMenuItem<String>(
                          value: district,
                          child:  Text(
                            district,
                            style: TextStyle(
                                fontSize: 14, color: AppColors.mainColor),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDistrict = value!;
                        });
                      },
                    ),

                    20.heightBox,
                    //Button
                    Center(
                        child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        width: 329,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            if (form.currentState!.validate()) {
                              Api().insertDonationApi(
                                  context: context,
                                  posted_by: nameController.text,
                                  blood_quantity: bloodQtyController.text,
                                  district: selectedDistrict,
                                  state: selectedState,
                                  bloodGroup: bloodGroup.toString(),
                                  mobile: mobileController.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainColor,
                          ),
                          child: const Text(
                            'Insert',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
