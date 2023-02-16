import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/ui/views/home/home_view.dart';
import 'package:quran_app/ui/views/splash/splash-view.dart';

import 'package:device_preview/device_preview.dart';

import 'constants/constant/constant.dart';
import 'constants/styles/colors.dart';

void main() => runApp(
  DevicePreview(
    builder: (context) => const MyApp(), // Wrap your app
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,

    ));

    return MaterialApp(
     routes: {
      "home" :(context) => const HomeView(),

     },
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'Islamic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color:Colors.white),
          backgroundColor: ColorApp.primary,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color:Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,

          ),

        ),

      ),
      home: const SplashView(),
    );
  }
}