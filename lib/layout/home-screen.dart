
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:quran_app/shared/styles/colors.dart';

import '../screens/alquran.dart';
import '../screens/azkar/azkar-screen.dart';
import '../screens/drawer.dart';
import '../shared/components/componets.dart';

class HomeScreen extends StatelessWidget {

 static const Color background= Color(0xffdebc9b);

  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,

      drawer: const MyDrawer(),

      appBar: AppBar(
        backgroundColor: ColorApp.primary,
       elevation: 0.0,

        centerTitle: true,
        title: const Text(
          'الرئيسة',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Tajawal',

          ),
        ),


      ),


      body: ListView(

        children: [

          containerAppbar(
              text:
              '''
              يَا أَيَّتُهَا النَّفْسُ الْمُطْمَئِنَّةُ ارْجِعِي إِلَى رَبِّكِ رَاضِيَةً
               مَرْضِيَّةً فَادْخُلِي فِي عِبَادِي وَادْخُلِي جَنَّتِي

              '''
          ),
          const SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
          [

            category(
                text: 'أذكار المسلم',
                icon:'Azkar.png',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Azkar()));
                }
            ),

            category(

                text: 'القرآن الكريم',
                icon:'quran.png',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AlQuranScreen()));

                }
            ),


          ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

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
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

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