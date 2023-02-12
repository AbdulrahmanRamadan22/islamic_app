import 'package:flutter/material.dart';
import 'package:quran_app/shared/styles/colors.dart';
import 'package:quran_app/shared/styles/string-app.dart';

import '../layout/home-screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();

    // after 3 second it will navigate
    Future.delayed(const Duration(seconds:3), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // your code
      body: Container(
        color:ColorApp.primary,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: const [
            Image(
              image: AssetImage('assets/images/islam.png'),
              height: 200,
              width: 200,

            ),
            SizedBox(height: 20,),
            TextApp.primary,
            SizedBox(height: 50),
            CircularProgressIndicator(color: ColorApp.white),

          ],
        ),
      ),

    );
  }
}



