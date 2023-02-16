import 'package:flutter/material.dart';


import '../../../constants/constant/constant.dart';
import '../../../constants/styles/colors.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "الإعدادات",
            style: TextStyle(fontFamily: 'Tajawal',fontSize: 25),
          ),
          backgroundColor: ColorApp.primary,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    textDirection: TextDirection.rtl,

                    'حجم خط وضع الآيات:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Tajawal'
                    ),
                  ),
                  Slider(
                    activeColor: ColorApp.primary,
                    value: arabicFontSize,
                    min: 20,
                    max: 40,
                    onChanged: (value){
                      setState(() {
                        arabicFontSize = value;
                      });
                    },

                  ),

                  Text(
                    "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                    style: TextStyle(
                        fontFamily: 'quran_font_1', fontSize: arabicFontSize),
                    textDirection: TextDirection.rtl,
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(),
                  ),
                  const Text(
                    textDirection: TextDirection.rtl,

                    'حجم خط وضع المصحف:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Tajawal'
                    ),
                  ),
                  Slider(
                    activeColor: ColorApp.primary,
                    value: mushafFontSize,
                    min: 20,
                    max: 50,
                    onChanged: (value){
                      setState(() {
                        mushafFontSize=value;
                      });
                    },
                  ),

                  Text(
                    "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                    style: TextStyle(
                        fontFamily: 'quran_font_1', fontSize: mushafFontSize),
                    textDirection: TextDirection.rtl,
                  ),


                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:  ColorApp.primary,

                            ),

                            onPressed: (){
                              setState(() {
                                arabicFontSize=28;
                                mushafFontSize=40;
                              });
                              saveSetting();
                            },
                            child: const Text(
                              'إعادة ضبط',
                              style: TextStyle(
                                fontSize:20,
                                fontFamily: 'Tajawal',
                              ),

                            ),),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:  ColorApp.primary,

                            ),
                            onPressed: (){
                              saveSetting();
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'حفظ',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily:'Tajawal',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}