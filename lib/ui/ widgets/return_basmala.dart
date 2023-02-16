import 'package:flutter/material.dart';

Widget returnBasmala()=>Stack(children: const [
  Center(
    child: Text(
      'بسم الله الرحمن الرحيم',
      style: TextStyle(fontFamily: 'quran_font_1', fontSize: 30),
      textDirection: TextDirection.rtl,
    ),
  ),
]);
