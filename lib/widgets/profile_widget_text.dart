import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileWidgetText extends StatelessWidget {
  final String img;
  final String title;
  final String name;

   ProfileWidgetText(
      {super.key, required this.img, required this.title, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          width: 50,
          height: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(img))
        ),
          ),
      title: title.text.black.bold.make(),
      subtitle: name.text.make(),
    );
  }
}

// Widget ProfileWidgetText(Image img,String title,String name){
//   return ListTile(
//   leading: img,
//     title: title.text.bold.black.make(),
//     subtitle: name.text.make(),
//   );
// }
