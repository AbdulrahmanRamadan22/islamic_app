import 'package:flutter/material.dart';

import '../../constants/styles/colors.dart';


// ignore: non_constant_identifier_names
Widget  MyCard({
  required String text,
  required Function() onTap,
  double height=80,
  String? image,


})=> InkWell(
  onTap: onTap,

  child: Container(

    height: height,

    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.only(right: 10),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius:BorderRadius.circular(10) ,
      gradient:   const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            ColorApp.darkPrimary,
            ColorApp.teal,
            ColorApp.primary,
          ]),
    ),
    // padding: const EdgeInsets.symmetric(vertical: 10),
    // margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
    child: Row(
      textDirection: TextDirection.rtl,
      children: [

        const Image(
          image: AssetImage("assets/images/star.png"),
          height:40,
          width: 40,
        ),
        const SizedBox(width: 20,),


        Text(
          text,
          style: const TextStyle(
            color:ColorApp.white,
            fontSize: 30,
            fontWeight:  FontWeight.bold,
            fontFamily: 'Tajawal',
          ),
        ),

      ],
    ),
  ),
);



