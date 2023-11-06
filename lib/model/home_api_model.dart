// To parse this JSON data, do
//
//     final homeApiResponse = homeApiResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HomeApiResponse homeApiResponseFromJson(String str) => HomeApiResponse.fromJson(json.decode(str));

String homeApiResponseToJson(HomeApiResponse data) => json.encode(data.toJson());

class HomeApiResponse {
  List<HomeModel> data;
  bool status;
  String msg;

  HomeApiResponse({
    required this.data,
    required this.status,
    required this.msg,
  });

  factory HomeApiResponse.fromJson(Map<String, dynamic> json) => HomeApiResponse(
    data: List<HomeModel>.from(json["data"].map((x) => HomeModel.fromJson(x))),
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "msg": msg,
  };
}

class HomeModel {
  String userId;
  String mobile;
  String postedBy;
  String bloodGroup;
  String postedOn;
  String state;
  String district;
  String did;
  String active;

  HomeModel({
    required this.userId,
    required this.mobile,
    required this.postedBy,
    required this.bloodGroup,
    required this.postedOn,
    required this.state,
    required this.district,
    required this.did,
    required this.active,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    userId: json["user_id"],
    mobile: json["mobile"],
    postedBy: json["posted_by"],
    bloodGroup: json["blood_group"],
    postedOn: json["posted_on"],
    state: json["state"],
    district: json["district"],
    did: json["did"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "mobile": mobile,
    "posted_by": postedBy,
    "blood_group": bloodGroup,
    "posted_on": postedOn,
    "state": state,
    "district": district,
    "did": did,
    "active": active,
  };
}
