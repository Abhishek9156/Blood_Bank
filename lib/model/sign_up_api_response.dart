
import 'dart:convert';

SignUpApiResponse signUpApiResponseFromJson(String str) => SignUpApiResponse.fromJson(json.decode(str));

String signUpApiResponseToJson(SignUpApiResponse data) => json.encode(data.toJson());

class SignUpApiResponse {
  bool data;
  bool status;
  String msg;

  SignUpApiResponse({
    required this.data,
    required this.status,
    required this.msg,
  });

  factory SignUpApiResponse.fromJson(Map<String, dynamic> json) => SignUpApiResponse(
    data: json["data"],
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "status": status,
    "msg": msg,
  };
}
