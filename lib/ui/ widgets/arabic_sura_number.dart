import 'package:flutter/material.dart';
import 'package:quran_app/constants/constant/arbic_converter.dart';

Widget arabicSuraNumber({
  required final int i,
})=>Text("\uFD3E${(i+1).toString().toArabicNumbers}\uFD3F" ,
  style: const TextStyle(
    color: Color.fromARGB(250, 0, 0, 0),
    fontFamily: 'quran_font_2',
    fontSize: 25,
    shadows:
    [
      Shadow(
        offset: Offset(.5,.5),
        blurRadius: 1,
        color: Colors.green,
      ),
    ],
  ),);