import 'package:flutter/material.dart';
import 'package:quran_app/constants/styles/string-app.dart';

import '../../ widgets/container_app_bar.dart';
import '../../ widgets/my_card.dart';
import 'hadithe_section_view.dart';

class AliarbaeaynAlnawawia extends StatelessWidget {
  const AliarbaeaynAlnawawia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: TextApp.aliarbaeaynAlnawawia,

      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,

          ),
        ),
        child: Column(
          children: [
            containerAppBar(
              height: height*0.20 ,
                text:
                '''
                الأربعون النووية لحفظ وسماع الاحاديث النبوية
              
              '''
            ),
            MyCard(
              text: "الأحاديث الأربعون",
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HaditheSection()));

              },
              height: height*0.30,

            ),
            MyCard(
              text: "الاستماع للأحاديث",
              onTap: (){},
              height: height*0.30,

            ),
            MyCard(
              text: "الأحاديث المحفوظه",
              onTap: (){},
              height: height*0.30,

            ),
          ],
        ),
      ),


    );
  }
}
