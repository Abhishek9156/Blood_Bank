import 'package:blood_bank/network/api.dart';
import 'package:blood_bank/widgets/blood_home_text.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/donation_request_model.dart';
import '../../utils/app_color.dart';
import '../../widgets/loadingIndicator.dart';

class DonationRequest extends StatefulWidget {
  const DonationRequest({super.key});

  @override
  State<DonationRequest> createState() => _DonationRequestState();
}

class _DonationRequestState extends State<DonationRequest> {




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 5),
          child: FutureBuilder<DonationRequestModel?>(
            future: Api().getSendDonationRequest(),
            builder: (context, snapShot) {
              if (!snapShot.hasData) {
                return Center(
                  child: loadingIndicator(),
                );
              } else if (snapShot.data!.data.isEmpty) {
                return "No data available!".text.color(Colors.grey).makeCentered();
              } else {
                List<DonationModel> donationModel = snapShot.data!.data;

                return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: snapShot.data!.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(left: 5, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.grey,
                                  blurRadius: 8.0,
                                  offset: Offset(0, 0))
                            ]),
                        child: Column(
                          children: [
                            BloodHomeText(
                              title: "Name",
                              value: donationModel[index].postedBy,
                              fontWeight: FontWeight.bold,
                            ),
                            BloodHomeText(
                                title: "Blood group",
                                value:
                                    donationModel[index].bloodGroup.toString()),
                            BloodHomeText(
                                title: "Phone Number",
                                value: donationModel[index].mobile.toString()),
                            BloodHomeText(
                                title: "Address",
                                value: donationModel[index].state.toString()),
                            BloodHomeText(
                                title: "Posted On",
                                value: donationModel[index].postedOn.toString()),
                            BloodHomeText(
                                title: "Status",
                                value: donationModel[index].active.toString(),
                                color:donationModel[index].active=="false" ? AppColors.mainColor:AppColors.green,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                      );
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}
