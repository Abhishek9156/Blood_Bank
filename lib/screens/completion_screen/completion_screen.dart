
import 'package:blood_bank/model/donation_info_model.dart';
import 'package:blood_bank/network/api.dart';
import 'package:blood_bank/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/loadingIndicator.dart';

class CompletionScreen extends StatefulWidget {
  const CompletionScreen({super.key});

  @override
  State<CompletionScreen> createState() => _CompletionScreenState();
}



class _CompletionScreenState extends State<CompletionScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child:

          FutureBuilder<DonationInfoResponseModel?>(
            future: Api().donationInfoApi(),
            builder: (context, snapShot) {
      if (!snapShot.hasData) {
      return Center(
      child: loadingIndicator(),
      );
      }  else {
        ResponseDonation? model=snapShot.data!.data;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Layer 1
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 200,
                height: 65,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: AppColors.grey,
                      blurRadius: 8.0,
                      offset: Offset(0, 5))
                ]),
                child: Center(
                  child: "Next Donation Option"
                      .text
                      .color(AppColors.mainColor)
                      .semiBold
                      .center
                      .make(),
                ),
              ),
            ),
            //Layer 2
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.grey,
                          blurRadius: 8.0,
                          offset: Offset(0, 5))
                    ]),
                child: Center(
                  child:  DateFormat.yMMMMd().format(DateTime.parse(model!.nextDonationDate.toString()))
                      .text
                      .color(AppColors.mainColor)
                      .semiBold
                      .center
                      .make(),
                ),
              ),
            ),
            //Layer 3
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grey,
                              blurRadius: 8.0,
                              offset: Offset(0, 5))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Center(
                            child: "Donated Time"
                                .text
                                .color(AppColors.mainColor)
                                .semiBold
                                .center
                                .make(),
                          ),
                          10.heightBox,
                          Divider(
                            thickness: 2,
                            color: Colors.grey,
                            indent: 10,
                            endIndent: 10,
                          ),
                          10.heightBox,
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.grey,
                                      blurRadius: 8.0,
                                      offset: Offset(0, 5))
                                ]),
                            child: Center(
                              child: "${model!.totalTimeDonation.toString()} times"
                                  .text
                                  .color(AppColors.mainColor)
                                  .semiBold
                                  .center
                                  .make(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grey,
                              blurRadius: 8.0,
                              offset: Offset(0, 5))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Center(
                            child: "Last Donated"
                                .text
                                .color(AppColors.mainColor)
                                .semiBold
                                .center
                                .make(),
                          ),
                          10.heightBox,
                          Divider(
                            thickness: 2,
                            color: Colors.grey,
                            indent: 10,
                            endIndent: 10,
                          ),
                          10.heightBox,
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.grey,
                                      blurRadius: 8.0,
                                      offset: Offset(0, 5))
                                ]),
                            child: Center(
                              child: DateFormat.yMMMMd().format(DateTime.parse(model.lastDonation.toString()))
                                  .text
                                  .color(AppColors.mainColor)
                                  .semiBold
                                  .center
                                  .make(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );

            }
  }
          ),
        ),
      ),
    );
  }


}
