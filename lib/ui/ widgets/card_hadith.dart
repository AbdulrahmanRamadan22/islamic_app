import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/styles/colors.dart';

Widget cardHadith({
  Color colorBorderSid = ColorApp.primary,
  Color colorContainer = ColorApp.white,
  Color colorText = ColorApp.primary,
  required String titleText,
}
    )=>Card(
  shape:  RoundedRectangleBorder(
    side:  BorderSide(
      color: colorBorderSid,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(20.0),

  ),

  child: Container(

    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 2),
    decoration: BoxDecoration(
      color:colorContainer,
      borderRadius: BorderRadius.circular(20),
    ),
    child: ListTile(
      title: Text(
        textAlign: TextAlign.center,
        titleText,
        style:  TextStyle(
          fontSize: 20,
          color: colorText,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w400,

        ),

      ),
    ),



  ),
);