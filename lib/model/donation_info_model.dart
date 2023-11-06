class DonationInfoResponseModel {
  ResponseDonation? data;
  bool? status;
  String? msg;

  DonationInfoResponseModel({this.data, this.status, this.msg});

  DonationInfoResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ResponseDonation.fromJson(json['data']) : null;
    status = json['status'];
    msg = json['msg'];
  }


}

class ResponseDonation {
  String? lastDonation;
  String? nextDonationDate;
  String? totalTimeDonation;

  ResponseDonation({this.lastDonation, this.nextDonationDate, this.totalTimeDonation});

  ResponseDonation.fromJson(Map<String, dynamic> json) {
    lastDonation = json['last_donation'];
    nextDonationDate = json['next_donation_date'];
    totalTimeDonation = json['total_time_donation'];
  }


}