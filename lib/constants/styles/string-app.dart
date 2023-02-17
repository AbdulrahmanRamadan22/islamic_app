import 'package:flutter/material.dart';

import 'colors.dart';


abstract class TextApp {

  static const Text primary =  Text(
    "إسلامي",
    style: TextStyle(
      color: ColorApp.white,
      fontSize: 60,
      fontWeight: FontWeight.bold,
      fontFamily: 'Tajawal',
    ),
  );
  static const Text primarySmall=Text(
  'إسلامي',
  style: TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontFamily: 'Tajawal',
  ),
);

  static const Text  setting=Text(
    'الإعدادات',
    style: TextStyle(
      fontSize: 20,
      fontFamily: 'Tajawal',
    ),
  );

  static const Text   share=Text(
    'مشاركه التطبيق',
    style: TextStyle(
      fontSize: 20,
      fontFamily: 'Tajawal',
    ),
  );
  static const Text  account=Text(
    'حسابي',
    style: TextStyle(
      fontSize: 20,
      fontFamily: 'Tajawal',
    ),
  );
  static const Text  homeView=Text(
    'الصفحه الرئيسيه',
    style: TextStyle(
      fontSize: 20,
      fontFamily: 'Tajawal',
    ),
  );
  static const Text   connectUs=Text(
    'تواصل معنا',
    style: TextStyle(
      fontSize: 20,
      fontFamily: 'Tajawal',
    ),
  );


  static const Text home=  Text(
    'الرئيسة',
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Tajawal',

    ),
  );

  static const aliarbaeaynAlnawawia =  Text(
    'الأربعون النوويه',
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Tajawal',

    ),
  );


  static const aliarbaeaynHadithe =  Text(
    'الأحاديث الاربعون',
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Tajawal',

    ),
  );














}


