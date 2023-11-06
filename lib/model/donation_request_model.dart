
import 'dart:convert';
DonationRequestModel donationRequestModelFromJson(String str) => DonationRequestModel.fromJson(json.decode(str));

String donationRequestModelToJson(DonationRequestModel data) => json.encode(data.toJson());

class DonationRequestModel {
  List<DonationModel> data;
  bool status;
  String msg;

  DonationRequestModel({
    required this.data,
    required this.status,
    required this.msg,
  });

  factory DonationRequestModel.fromJson(Map<String, dynamic> json) => DonationRequestModel(
    data: List<DonationModel>.from(json["data"].map((x) => DonationModel.fromJson(x))),
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "msg": msg,
  };
}

class DonationModel {
  String userId;
  String postedBy;
  String bloodGroup;
  String postedOn;
  String state;
  String district;
  String mobile;
  String did;
  String active;

  DonationModel({
    required this.userId,
    required this.postedBy,
    required this.bloodGroup,
    required this.postedOn,
    required this.state,
    required this.district,
    required this.mobile,
    required this.did,
    required this.active,
  });

  factory DonationModel.fromJson(Map<String, dynamic> json) => DonationModel(
    userId: json["user_id"],
    postedBy: json["posted_by"],
    bloodGroup: json["blood_group"],
    postedOn: json["posted_on"],
    state: json["state"],
    district: json["district"],
    mobile: json["mobile"],
    did: json["did"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "posted_by": postedBy,
    "blood_group": bloodGroup,
    "posted_on": postedOn,
    "state": state,
    "district": district,
    "mobile": mobile,
    "did": did,
    "active": active,
  };
}
