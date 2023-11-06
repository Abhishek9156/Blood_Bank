class LoginResponseModel {
  Data? data;
  bool? status;
  String? msg;

  LoginResponseModel({this.data, this.status, this.msg});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    msg = json['msg'];
  }

}

class Data {
  String? userId;
  String? name;
  String? sex;
  String? email;
  String? mobile;
  String? bloodGroup;
  String? state;
  String? district;
  String? createdAt;
  Null? updatedAt;

  Data(
      {this.userId,
        this.name,
        this.sex,
        this.email,
        this.mobile,
        this.bloodGroup,
        this.state,
        this.district,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    sex = json['sex'];
    email = json['email'];
    mobile = json['mobile'];
    bloodGroup = json['blood_group'];
    state = json['state'];
    district = json['district'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}