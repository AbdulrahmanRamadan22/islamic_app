import 'package:flutter/material.dart';

import '../../constants/styles/colors.dart';

Widget containerAppBar({
  required String text,
  double height =120,
}

    )=> Container(
     margin: const EdgeInsets.only(bottom: 10),
     height: height,
     width: double.infinity,

  decoration: const BoxDecoration(
    color: ColorApp.primary,
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(30),
      bottomLeft: Radius.circular(30),
    ),
  ),


  child:   Center(
    child: Text(
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      text,
      style: const TextStyle(
        color: ColorApp.white,
        fontFamily: 'quran_font_2',
        fontSize: 20,

      ),

    ),
  ),

);



