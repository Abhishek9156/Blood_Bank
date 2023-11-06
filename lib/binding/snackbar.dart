import 'package:blood_bank/utils/app_color.dart';
import 'package:flutter/material.dart';


  SnackBarError({required BuildContext context,required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        ),

        duration: Duration(seconds: 3), // Specify the duration
      ),
    );
  }



  SnackBarSuccess({required BuildContext context,required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ,style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        ),

        duration: Duration(seconds: 3), // Specify the duration
      ),
    );
  }

    SnackBarWarning({required BuildContext context,required String message}) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message,style:  TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: AppColors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          ),

          duration: Duration(seconds: 3), // Specify the duration
        ),
      );
    }


