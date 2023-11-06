import 'package:blood_bank/screens/activities_screen/donation_request.dart';
import 'package:blood_bank/screens/activities_screen/insert_donation.dart';
import 'package:blood_bank/utils/app_color.dart';
import 'package:flutter/material.dart';


class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(

            preferredSize: Size.fromHeight(80),

            child: AppBar(
              bottom: TabBar(
                indicatorColor: AppColors.mainColor,
                labelColor: AppColors.mainColor,
                tabs: [
                  Tab(
                      icon: Icon(Icons.insert_drive_file_outlined),
                      text: "Insert Donation"),
                  Tab(
                      icon: Icon(Icons.volunteer_activism_outlined),
                      text: "Donation Request")
                ],

              ),
            ),
          ),
          body: TabBarView(
            children: [
              //StateList(),
              InsertDonation(),
              DonationRequest(),
            ],
          ),
        ),
      ),
    );
  }
}
