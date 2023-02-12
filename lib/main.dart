import 'package:flutter/material.dart';
import 'package:quran_app/layout/home-screen.dart';
import 'package:quran_app/screens/azkar/azkar-screen.dart';
import 'package:quran_app/screens/splash-screen.dart';
import 'package:quran_app/shared/styles/colors.dart';

import 'shared/constant/constant.dart';
import 'screens/alquran.dart';

import 'package:device_preview/device_preview.dart';
void main() => runApp(
  DevicePreview(
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding
        .instance
        .addPostFrameCallback(

            (_) async{
          await readJson();
          await getSetting();
        }



    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     routes: {
      "home" :(context) => const HomeScreen(),

     },
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'Islamic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color:Colors.white),

          backgroundColor: ColorApp.primary,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color:Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,

          ),

        ),

      ),
      home: SplashScreen(),
    );
  }
}