import 'package:flutter/material.dart';


import '../../../constants/styles/colors.dart';
import '../../../constants/styles/string-app.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

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



