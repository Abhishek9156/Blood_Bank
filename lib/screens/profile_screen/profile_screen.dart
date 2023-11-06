import 'package:blood_bank/screens/login_screen/login_screen.dart';
import 'package:blood_bank/utils/image_const.dart';
import 'package:blood_bank/widgets/profile_widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/bg_widget.dart';
import '../../widgets/detail_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;
  String? mobile;
  String? email;
  String? gender;
  String? district;
  String? bloodGroup;
  String? state;




  @override
  void initState(){
    getvalue();

  }
  Future<void> getvalue() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString('name');
      gender = prefs.getString('sex');
      mobile = prefs.getString('mobile');
      email = prefs.getString('email');
      district = prefs.getString('district');
      state = prefs.getString('state');
      bloodGroup= prefs.getString('blood_group');
    });
  }
  @override
  Widget build(BuildContext context) {

    return bgWidget(
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(

                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                  //Edit profile button
                  const Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.edit,
                        color: Colors.black,
                      )).onTap(() {
                  }),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Image.asset(ImgProfile, width: 100, fit: BoxFit.cover)
                            .box
                            .roundedFull
                            .clip(Clip.antiAlias)
                            .make(),
                        10.widthBox,
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                name.toString().text.black.make(),

                                "Blood Group:$bloodGroup".text.color(Colors.red).bold.make(),
                              ],
                            )),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color: Colors.black54,
                                )),
                            onPressed: () async{


                              SharedPreferences pref=await SharedPreferences.getInstance();
                              pref.clear();
                              Get.to(()=>LoginScreen());
                            },
                            child: "logout".text.black.make())
                      ],
                    ),
                  ),
                  10.heightBox,
                  "Personal Information".text.semiBold.size(20).make(),
                  10.heightBox,
                  ProfileWidgetText(img: Imgname, title: "Name", name: name.toString()),
                  Divider(thickness: 1,color: Colors.grey,endIndent: 15,indent: 15),
                  ProfileWidgetText(img: Imgmobile, title: "Mobile", name: mobile.toString()),
                  Divider(thickness: 1,color: Colors.grey,endIndent: 15,indent: 15),
                  ProfileWidgetText(img: Imgemail, title: "Email", name: email.toString()),
                  Divider(thickness: 1,color: Colors.grey,endIndent: 15,indent: 15),
                  ProfileWidgetText(img: Imgaddress, title: "Address", name:district.toString()+" "+state.toString()),
                  Divider(thickness: 1,color: Colors.grey,endIndent: 15,indent: 15),
                  ProfileWidgetText(img: Imggender, title: "Gender", name: gender.toString()),
                  Divider(thickness: 1,color: Colors.grey,endIndent: 15,indent: 15),

                ]),
              ),
            ),
          ),
        ));
  }
  }
