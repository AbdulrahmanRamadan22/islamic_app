

import 'package:flutter/material.dart';
import 'package:quran_app/shared/styles/colors.dart';

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
          color: ColorApp.primary,

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





// ignore: non_constant_identifier_names
Widget ReturnBasmala()=>Stack(children: const [
  Center(
    child: Text(
      'بسم الله الرحمن الرحيم',
      style: TextStyle(fontFamily: 'quran_font_1', fontSize: 30),
      textDirection: TextDirection.rtl,
    ),
  ),
]);



  Widget containerAppbar({
    required String text,
}

      )=> Container(
       margin: const EdgeInsets.only(bottom: 10),
       height: 120,
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





















Widget  buildCategoryItem({
  required String text,
  required Function() onTap,

})=> Expanded(
  child: InkWell(
    onTap: onTap,

    child: Container(
      height: 80,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(right: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(10) ,
        gradient:  const LinearGradient(
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Text(
             text,
            style: const TextStyle(
              color:ColorApp.white,
              fontSize: 24,
              fontWeight:  FontWeight.bold,
              fontFamily: 'Tajawal',
            ),
          ),
          const SizedBox(width: 20,),
          const Image(
            image: AssetImage("assets/images/star.png"),
            height:40,
            width: 40,
          ),

        ],
      ),
    ),
  ),
);



