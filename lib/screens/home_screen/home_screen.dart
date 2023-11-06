import 'package:blood_bank/model/home_api_model.dart';
import 'package:blood_bank/network/api.dart';
import 'package:blood_bank/utils/app_color.dart';
import 'package:blood_bank/utils/image_const.dart';
import 'package:blood_bank/widgets/big_text.dart';
import 'package:blood_bank/widgets/blood_home_text.dart';
import 'package:blood_bank/widgets/loadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(2),
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Search Anything...",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  filled: true,
                  suffixIcon: Icon(Icons.search_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.mainColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<HomeApiResponse?>(
                  future: Api().getHomeApi(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: loadingIndicator(),
                      );
                    } else if (snapshot.data!.data.isEmpty) {
                      return "No data available!"
                          .text
                          .color(Colors.grey)
                          .makeCentered();
                    } else {
                      final List<HomeModel> model = snapshot.data!.data;

                      final filteredItems = model!
                          .where((item) =>
                              item.postedBy
                                  .toLowerCase()
                                  .contains(query.toString().toLowerCase()) ||
                              item.district
                                  .toLowerCase()
                                  .contains(query.toLowerCase()) ||
                              item.state
                                  .toLowerCase()
                                  .contains(query.toLowerCase()) ||
                              item.bloodGroup
                                  .toLowerCase()
                                  .contains(query.toLowerCase()))
                          .toList();

                      return ListView.builder(
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 20, bottom: 10, right: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white38,
                                          boxShadow: [],
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(Imgblood))),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BigText(
                                            text:
                                                "Need ${filteredItems[index].bloodGroup} Blood Donor"),
                                        InkWell(
                                            onTap: () {
                                              callNumber(
                                                  filteredItems[index].mobile);
                                            },
                                            child: BloodHomeText(
                                                title: "Phone number",
                                                value:
                                                    filteredItems[index].mobile,
                                                color: AppColors.mainColor)),
                                        BloodHomeText(
                                            title: "Posted By",
                                            value:
                                                filteredItems[index].postedBy),
                                        BloodHomeText(
                                            title: "Address",
                                            value:
                                                "${filteredItems[index].district} ${filteredItems[index].state.toString()}"),
                                        BloodHomeText(
                                            title: "Posted On",
                                            value:
                                                filteredItems[index].postedOn ==
                                                        ""
                                                    ? "null"
                                                    : DateFormat.yMMMMd()
                                                        .format(DateTime.parse(
                                                            filteredItems[index]
                                                                .postedOn
                                                                .toString()))),
                                      ],
                                    )
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          );
                        },);
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  void callNumber(String s) async {
    await FlutterPhoneDirectCaller.callNumber(s);
  }
}
