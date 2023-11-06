// To parse this JSON data, do
//
//     final searchDonorResponse = searchDonorResponseFromJson(jsonString);

import 'dart:convert';

SearchDonorResponse searchDonorResponseFromJson(String str) => SearchDonorResponse.fromJson(json.decode(str));

String searchDonorResponseToJson(SearchDonorResponse data) => json.encode(data.toJson());

class SearchDonorResponse {
  List<SearchDonorModel> data;
  bool status;
  String msg;

  SearchDonorResponse({
    required this.data,
    required this.status,
    required this.msg,
  });

  factory SearchDonorResponse.fromJson(Map<String, dynamic> json) => SearchDonorResponse(
    data: List<SearchDonorModel>.from(json["data"].map((x) => SearchDonorModel.fromJson(x))),
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "msg": msg,
  };
}

class SearchDonorModel {
  String userId;
  String postedBy;
  String mobile;
  String bloodGroup;
  String state;
  String district;
  DateTime lastDonation;
  DateTime nextDonationDate;
  String totalTimeDonation;
  DateTime postedOn;

  SearchDonorModel({
    required this.userId,
    required this.postedBy,
    required this.mobile,
    required this.bloodGroup,
    required this.state,
    required this.district,
    required this.lastDonation,
    required this.nextDonationDate,
    required this.totalTimeDonation,
    required this.postedOn,
  });

  factory SearchDonorModel.fromJson(Map<String, dynamic> json) => SearchDonorModel(
    userId: json["user_id"],
    postedBy: json["posted_by"],
    mobile: json["mobile"],
    bloodGroup: json["blood_group"],
    state: json["state"],
    district: json["district"],
    lastDonation: DateTime.parse(json["last_donation"]),
    nextDonationDate: DateTime.parse(json["next_donation_date"]),
    totalTimeDonation: json["total_time_donation"],
    postedOn: DateTime.parse(json["posted_on"]),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "posted_by": postedBy,
    "mobile": mobile,
    "blood_group": bloodGroup,
    "state": state,
    "district": district,
    "last_donation": "${lastDonation.year.toString().padLeft(4, '0')}-${lastDonation.month.toString().padLeft(2, '0')}-${lastDonation.day.toString().padLeft(2, '0')}",
    "next_donation_date": "${nextDonationDate.year.toString().padLeft(4, '0')}-${nextDonationDate.month.toString().padLeft(2, '0')}-${nextDonationDate.day.toString().padLeft(2, '0')}",
    "total_time_donation": totalTimeDonation,
    "posted_on": postedOn.toIso8601String(),
  };
}
