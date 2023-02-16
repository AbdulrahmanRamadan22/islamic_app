
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:quran_app/constants/styles/string-app.dart';
import 'package:quran_app/ui/views/alquran/alquran_view.dart';
import 'package:quran_app/ui/views/azkar/azkar_view.dart';

import '../../ widgets/category.dart';
import '../../ widgets/container_app_bar.dart';
import '../../ widgets/my_drawer.dart';
import '../../../constants/styles/colors.dart';
import '../aliarbaeayn_alnawawia/aliarbaeayn_alnawawia.dart';

class HomeView extends StatelessWidget {

 static const Color background= Color(0xffdebc9b);

  const HomeView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.width;


    return Scaffold(
      // backgroundColor: Colors.green,

      drawer: const MyDrawer(),

      appBar: AppBar(
        backgroundColor: ColorApp.primary,
       elevation: 0.0,
        centerTitle: true,
        title: TextApp.home,
      ),

      body: ListView(

        children: [

          containerAppBar(
            height: height*0.30,
              text:
              '''
              يَا أَيَّتُهَا النَّفْسُ الْمُطْمَئِنَّةُ ارْجِعِي إِلَى رَبِّكِ رَاضِيَةً
               مَرْضِيَّةً فَادْخُلِي فِي عِبَادِي وَادْخُلِي جَنَّتِي

              '''
          ),
          const SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            textDirection: TextDirection.rtl,
            children:
          [


            category(

                text: 'القرآن الكريم',
                icon:'quran.png',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AlQuranView()));

                }
            ),

            category(
                text: 'أذكار المسلم',
                icon:'Azkar.png',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AzkarView()));
                }
            ),



          ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            textDirection: TextDirection.rtl,

            children: [

              category(
                  text: 'الأربعون النووية',
                  icon:'aliarbaeaynalnawawia.png',
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    const AliarbaeaynAlnawawia()));

                  }

              ),



              category(
                  text: 'hhh',
                  icon:'quran.png',
                  onTap: (){}
              ),

            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            textDirection: TextDirection.rtl,

            children: [
              category(
                  text: 'hhh',
                  icon:'quran.png',

                  onTap: (){}
              ),
              category(
                  text: 'hhh',
                  icon:'quran.png',

                  onTap: (){}
              ),

            ],
          ),

        ],
      ),
    );
  }
}