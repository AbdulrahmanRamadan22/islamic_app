import 'package:flutter/material.dart';

import '../../constants/styles/colors.dart';


Widget category({
  required String text,
  String? icon,
  required Function() onTap,


})=> GestureDetector(

  onTap: onTap,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,

    children: [
      Image.asset(
        'assets/icons/$icon',
        // height: 80,
        width: 80,


      ),
      const SizedBox(height: 10,),
      Container(
        width:160,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        color: ColorApp.primary

        ),

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            text,
            style: const TextStyle(
              color: ColorApp.white,
              fontSize: 20,
              fontFamily: 'Tajawal',


            ),
          ),
        ),
      ),
    ],
  ),
);


