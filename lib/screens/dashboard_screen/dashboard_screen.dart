
import 'package:blood_bank/screens/activities_screen/activity_screen.dart';
import 'package:blood_bank/screens/completion_screen/completion_screen.dart';
import 'package:blood_bank/screens/dashboard_screen/dashboard_controller.dart';
import 'package:blood_bank/screens/home_screen/home_screen.dart';
import 'package:blood_bank/screens/profile_screen/profile_screen.dart';
import 'package:blood_bank/screens/search_donor_screen/search_donor_screen.dart';
import 'package:blood_bank/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_navigation/side_navigation.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DashboardController());
    var navBody = [
      const HomeScreen(),
      const SearchDonorScreen(),
      const ActivityScreen(),
      const CompletionScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(


      body: Column(
        children: [
          Obx(() => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value)))
        ],
      ),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          items: navbarItem,
          currentIndex: controller.currentNavIndex.value,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.mainColor,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }

  var navbarItem = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined), label: "Home"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.search_outlined), label: "Search Donor"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.local_activity_outlined), label: "Activity"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.cloud_done_outlined), label: "Completion"),

    const BottomNavigationBarItem(
        icon: Icon(Icons.person_2_outlined), label: "Profile"),
  ];

  var sidebarItem = [
    SideNavigationBarItem(icon: Icons.home_outlined,
        label: "Home"),
    SideNavigationBarItem(icon: Icons.search_outlined,
        label: "Search Donor"),
    SideNavigationBarItem(icon: Icons.cloud_done_outlined,
        label: "Completion"),
    SideNavigationBarItem(icon: Icons.logout_outlined,
        label: "Logout"),
  ];
}
