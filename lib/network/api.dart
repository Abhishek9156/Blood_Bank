import 'dart:async';
import 'dart:convert';
import 'package:blood_bank/binding/snackbar.dart';
import 'package:blood_bank/model/donation_info_model.dart';
import 'package:blood_bank/model/donation_request_model.dart';
import 'package:blood_bank/model/home_api_model.dart';
import 'package:blood_bank/model/login_response_model.dart';
import 'package:blood_bank/model/sign_up_api_response.dart';
import 'package:blood_bank/screens/dashboard_screen/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/indian_state.dart';
import '../model/search_donor_model.dart';

class Api {
  static String url =
      "https://renunciatory-resolu.000webhostapp.com/htdocs/bloodbank/";
  late BuildContext context;

  logInApi(
      {required BuildContext context,
      required String mobile,
      required String password}) async {
    var map = <String, dynamic>{};
    map['mobile'] = mobile;
    map['password'] = password;
    final response = await http.post(Uri.parse("${url}login.php"), body: map);

    try {
      if (response.statusCode == 200) {
        LoginResponseModel model =
            LoginResponseModel.fromJson(jsonDecode(response.body));
        if (model.status == true) {
          debugPrint(model.data!.userId.toString());
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("user_id", model.data!.userId.toString());
          await prefs.setString("name", model.data!.name.toString());
          await prefs.setString("sex", model.data!.sex.toString());
          await prefs.setString("email", model.data!.email.toString());
          await prefs.setString("mobile", model.data!.mobile.toString());
          await prefs.setString(
              "blood_group", model.data!.bloodGroup.toString());
          await prefs.setString("state", model.data!.state.toString());
          await prefs.setString("district", model.data!.district.toString());

          Get.to(() => DashboardScreen());
        } else {
          SnackBarError(context: context, message: model.msg.toString());
        }
      } else {
        SnackBarError(context: context, message: "Api status code error");
      }
    } catch (e) {
      print(e);
    }
  }

//Completion
  Future<DonationInfoResponseModel?> donationInfoApi() async {
    String? uids;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString("user_id") != null) {
      uids = preferences.getString("user_id");
    }
    var map = <String, dynamic>{};
    map['user_id'] = uids;
    final response =
        await http.post(Uri.parse("${url}donationinfo.php"), body: map);
    if (response.statusCode == 200) {
      final model1 =
          DonationInfoResponseModel.fromJson(jsonDecode(response.body));
      if (model1.status == true) {
        return model1;
      } else {
        SnackBarError(context: context, message: model1.msg.toString());
      }
    }
  }

//Donor Requesr
  Future<DonationRequestModel?> getSendDonationRequest() async {
    String? uids;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString("user_id") != null) {
      uids = preferences.getString("user_id");
    }
    var map = <String, dynamic>{};
    map['user_id'] = uids;
    final response =
        await http.post(Uri.parse("${url}getadvertisebyuser.php"), body: map);

    if (response.statusCode == 200) {
      DonationRequestModel model =
          DonationRequestModel.fromJson(jsonDecode(response.body));
      if (model.status == true) {
        if (model.data.length > 0) {
          return model;
        } else {
          SnackBarError(context: context, message: "No Data Available");
        }
      } else {
        SnackBarError(context: context, message: model.msg.toString());
      }
    }
  }

  //Home Screen
  Future<HomeApiResponse?> getHomeApi() async {
    String? uids;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString("user_id") != null) {
      uids = preferences.getString("user_id");
    }
    var map = <String, dynamic>{};
    map['user_id'] = uids;
    final response =
        await http.post(Uri.parse("${url}getadvertisebyuser.php"), body: map);

    if (response.statusCode == 200) {
      HomeApiResponse model =
          HomeApiResponse.fromJson(jsonDecode(response.body));
      if (model.status == true) {
        if (model.data.length > 0) {
          return model;
        } else {
          SnackBarError(context: context, message: "No Data Available");
        }
      } else {
        SnackBarError(context: context, message: model.msg.toString());
      }
    }
  }

//Signup screen
  Future<SignUpApiResponse?> SignupApi(
      {required BuildContext context,
      required String name,
      required String sex,
      required String district,
      required String state,
      required String bloodGroup,
      required String email,
      required String mobile,
      required String password}) async {
    try {
      var map = <String, dynamic>{};
      map['mobile'] = mobile;
      map['password'] = password;
      map['name'] = name;
      map['sex'] = sex;
      map['district'] = district;
      map['state'] = state;
      map['blood_group'] = bloodGroup;
      map['email'] = email;
      final response =
          await http.post(Uri.parse("${url}registration.php"), body: map);
      if (response.statusCode == 200) {
        return SignUpApiResponse.fromJson(jsonDecode(response.body));
      } else {
        SnackBarError(context: context, message: "Status Code Error");
      }
    } catch (e) {
      print(e);
    }
  }

//Search Donor Screen

  Future<List<SearchDonorModel>?> searchdonorApi({
    required BuildContext context,
    required String district,
    required String state,
    required String bloodGroup,
  }) async {
    String? uid;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString("user_id") != null) {
      uid = preferences.getString("user_id");
    }

    try {
      var map = <String, dynamic>{};
      map['district'] = district;
    map['state'] = state;
    map['blood_group'] = bloodGroup;
    map['user_id'] = uid;


      final reponse =
              await http.post(Uri.parse("${url}searchblooddonor.php"), body: map);
      if (reponse.statusCode == 200) {
            SearchDonorResponse model =
                SearchDonorResponse.fromJson(jsonDecode(reponse.body));
            if (model.status == true) {
              if (model.data!.length>0) {
                return model.data;
              } else {
                SnackBarError(context: context, message: model.msg.toString());
              }
            } else {
              SnackBarError(context: context, message:model.msg.toString() );
            }
          }else{
        SnackBarError(context: context, message: "Status Code Error");
      }
    } catch (e) {
      print(e);
    }
  }


  //Insert donaiton
Future<SignUpApiResponse?> insertDonationApi({
  required BuildContext context,
    required String posted_by,
    required String blood_quantity,
    required String district,
    required String state,
    required String bloodGroup,
    required String mobile,
  })async{

  String? uid;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  if (preferences.getString("user_id") != null) {
    uid = preferences.getString("user_id");
  }

  try {
    var map = <String, dynamic>{
        'user_id' : uid,
        'district' : district,
        'state' : state,
        'blood_group' : bloodGroup,
        'posted_by' : posted_by,
        'mobile' : mobile,
        'blood_quantity' : blood_quantity,
        'active' : "true",

      };

    final reponse =
      await http.post(Uri.parse("${url}insertadvertise.php"), body: map);
    if(reponse.statusCode==200){
        SignUpApiResponse response=SignUpApiResponse.fromJson(jsonDecode(reponse.body));
        if(response.status==true){
          SnackBarSuccess(context: context, message: response.msg);

        }else{
          SnackBarError(context: context, message: response.msg);

        }
      }else{
        SnackBarError(context: context, message: "Status Code Error");
      }
  } catch (e) {
    print(e);
  }

}


}
