import 'dart:async';
import 'dart:convert';

import 'package:blood_bank/model/search_donor_model.dart';
import 'package:blood_bank/network/api.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:csc_picker/model/select_status_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/indian_state.dart';
import '../../utils/app_array.dart';
import '../../utils/app_color.dart';
import '../../utils/image_const.dart';
import '../../widgets/big_text.dart';
import '../../widgets/blood_home_text.dart';
import '../../widgets/loadingIndicator.dart';

class SearchDonorScreen extends StatefulWidget {
  const SearchDonorScreen({super.key});

  @override
  State<SearchDonorScreen> createState() => _SearchDonorScreenState();
}

class _SearchDonorScreenState extends State<SearchDonorScreen> {
  late Future<List<SearchDonorModel>?> model;
 // List<IndianState> indianStates = [];
  String selectedState = "";
  String contrye = "";

  String selectedDistrict = "";
  String? bloodGroup;

  //final StreamController<SearchDonorModel<>> _controller = StreamController<List<SearchDonorModel>>();
//  List<MyItem> itemList = [];

  @override
  void initState() {
    super.initState();
   // loadIndianStates();
   model= Api().searchdonorApi(
        context: context,
        district: "",
        state: "",
        bloodGroup: "");
  }

  // Future<void> loadIndianStates() async {
  //   final String jsonContent =
  //       await rootBundle.loadString('assets/country.json');
  //   final List<dynamic> jsonList = json.decode(jsonContent)['states'];
  //   indianStates = jsonList
  //       .map((json) =>
  //           IndianState(json['state'], List<String>.from(json['districts'])))
  //       .toList();
  //
  //   setState(() {
  //     selectedState = indianStates[0].name;
  //     selectedDistrict = indianStates[0].districts[0];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
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
                CSCPicker(layout: Layout.vertical,
                defaultCountry: CscCountry.India,
                disableCountry: true,
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border:
                      Border.all(color: AppColors.mainColor , width: 1)),

                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border:
                      Border.all(color: AppColors.mainColor, width: 1)),

                  dropdownHeadingStyle: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),

                  ///DropdownDialog Item style [OPTIONAL PARAMETER]
                  dropdownItemStyle: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 14,
                  ),

                  selectedItemStyle: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),

                onCountryChanged: (value){
                  setState(() {
                    contrye!=value;
                  });
                },
                onStateChanged: (value){
                  setState(() {
                    selectedState!=value;
                  });
                },
                onCityChanged: (value){
                  setState(() {
                    selectedDistrict!=value;
                  });
                },)
                //state
                // DropdownButtonFormField(
                //   icon: Icon(Icons.arrow_drop_down, color: AppColors.mainColor),
                //   isExpanded: true,
                //   decoration: InputDecoration(
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //       borderSide: BorderSide(
                //         width: 1,
                //         color: AppColors.mainColor,
                //       ),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //       borderSide: BorderSide(
                //         width: 1,
                //         color: AppColors.mainColor,
                //       ),
                //     ),
                //     // Add more decoration..
                //   ),
                //   hint: Text(
                //     'Select State',
                //     style: TextStyle(
                //         fontSize: 14,
                //         fontWeight: FontWeight.bold,
                //         color: AppColors.mainColor),
                //   ),
                //   value: selectedState,
                //   items: indianStates
                //       .map((state) => DropdownMenuItem<String>(
                //             value: state.name,
                //             child: Text(
                //               state.name,
                //               style: TextStyle(
                //                   fontSize: 14, color: AppColors.mainColor),
                //             ),
                //           ))
                //       .toList(),
                //   onChanged: (value) {
                //     setState(() {
                //       selectedState = value!;
                //       selectedDistrict = indianStates
                //           .firstWhere((state) => state.name == selectedState)
                //           .districts[0];
                //     });
                //   },
                // ),
                // 10.heightBox,
                // //district
                // DropdownButtonFormField(
                //   icon: Icon(Icons.arrow_drop_down, color: AppColors.mainColor),
                //   isExpanded: true,
                //   decoration: InputDecoration(
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //       borderSide: BorderSide(
                //         width: 1,
                //         color: AppColors.mainColor,
                //       ),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //       borderSide: BorderSide(
                //         width: 1,
                //         color: AppColors.mainColor,
                //       ),
                //     ),
                //     // Add more decoration..
                //   ),
                //   hint: Text(
                //     'Select District',
                //     style: TextStyle(
                //         fontSize: 14,
                //         fontWeight: FontWeight.bold,
                //         color: AppColors.mainColor),
                //   ),
                //   value: selectedDistrict,
                //   items: indianStates
                //       .firstWhere((state) => state.name == selectedState)
                //       .districts
                //       .map((district) {
                //     return DropdownMenuItem<String>(
                //       value: district,
                //       child: Text(
                //         district,
                //         style:
                //             TextStyle(fontSize: 14, color: AppColors.mainColor),
                //       ),
                //     );
                //   }).toList(),
                //   onChanged: (value) {
                //     setState(() {
                //       selectedDistrict = value!;
                //     });
                //   },
                // ),
                ,
                20.heightBox,
                Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: SizedBox(
                      width: 329,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          debugPrint(selectedState.toString());
                          setState(() {
                         model=  Api()
                             .searchdonorApi(
                             context: context,
                             state: selectedState.toString(),
                             district: selectedDistrict.toString(),
                             bloodGroup: bloodGroup.toString());

                       });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainColor,
                        ),
                        child: const Text(
                          'Search',
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
                10.heightBox,

                FutureBuilder<List<SearchDonorModel>?>(
                    future:model,
                    builder: (BuildContext context,
                       snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While data is being fetched, display a loading indicator
                        return Center(child: loadingIndicator());
                      } else if (!snapshot.hasData) {
                        return Center(
                          child: "No data available"
                              .text
                              .color(AppColors.mainColor)
                              .make(),
                        );
                      } else {
                       final item=snapshot!.data;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: item!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  left: 20, bottom: 10, right: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white38,
                                            boxShadow: [],
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(Imgblood))),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BigText(
                                              text:
                                                  "Need ${item[index].bloodGroup} Blood Donor"),
                                          InkWell(
                                              onTap: () {
                                                callNumber(item![index]
                                                    .mobile
                                                    .toString());
                                              },
                                              child: BloodHomeText(
                                                  title: "Phone number",
                                                  value: item![index]
                                                      .mobile
                                                      .toString(),
                                                  color: AppColors.mainColor)),
                                          BloodHomeText(
                                              title: "Posted By",
                                              value: item![index]
                                                  .postedBy
                                                  .toString()),
                                          BloodHomeText(
                                              title: "Address",
                                              value:
                                                  "${item![index].district} ${item![index].state.toString()}"),
                                          BloodHomeText(
                                              title: "Posted On",
                                              value: item![index].postedOn ==
                                                      ""
                                                  ? "null"
                                                  : DateFormat.yMMMMd().format(
                                                      DateTime.parse(
                                                          item![index]
                                                              .postedOn
                                                              .toString()))),
                                          BloodHomeText(
                                              title: "Last Donated",
                                              value: item![index].postedOn ==
                                                      ""
                                                  ? "null"
                                                  : DateFormat.yMMMMd().format(
                                                      DateTime.parse(
                                                          item![index]
                                                              .postedOn
                                                              .toString()))),
                                          BloodHomeText(
                                              title: "Next Donation Date",
                                              value: item![index]
                                                          .nextDonationDate ==
                                                      ""
                                                  ? "null"
                                                  : DateFormat.yMMMMd().format(
                                                      DateTime.parse(
                                                          item![index]
                                                              .postedOn
                                                              .toString()))),
                                          BloodHomeText(
                                              title: "Total Time Donation",
                                              value: item![index]
                                                  .totalTimeDonation
                                                  .toString()),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void callNumber(String s) async {
    await FlutterPhoneDirectCaller.callNumber(s);
  }
}
