import 'package:flutter/material.dart';
import 'package:quran_app/layout/home-screen.dart';
import 'package:quran_app/screens/setting_screen.dart';
import 'package:quran_app/shared/styles/colors.dart';
import 'package:quran_app/shared/styles/string-app.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/constant/constant.dart';
Uri LinkedIn = Uri.parse('https://www.linkedin.com/in/abdulrahman-ramadan-5a5700247/');

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: ColorApp.primary,
            ),

            child: Expanded(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/islam.png',
                    height: 80,
                  ),
                  const SizedBox(height: 10,),
                  TextApp.primarySmall,

                ],
              ),
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: TextApp.setting,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()));
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.share,
            ),
            title: const Text(
              ' مشاركه التطبيق',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Tajawal',
              ),

            ),
            onTap: () {
              Share.share('''*Quran app*\n
            u can develop it from my github github.com/itAbdulrahmanRamadan ''');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.rate_review,
            ),
            title: const Text(
              'حسابي',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Tajawal',
              ),
            ),
            onTap: () async {
              if (!await launchUrl(quranAppUrl,
                  mode: LaunchMode.externalApplication)) {
                throw 'Could not launch $quranAppUrl';
              }
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.account_balance,
            ),
            title: const Text(
              'الصفحه الرئيسيه',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Tajawal',
              ),
            ),
            onTap: ()  {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  HomeScreen()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.account_box_outlined,
            ),
            title: const Text(
              'تواصل معنا',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Tajawal',
              ),
            ),
            onTap: () async {
              if (!await launchUrl(LinkedIn,
                  mode: LaunchMode.externalApplication)) {
                throw 'Could not launch $LinkedIn';
              }
            },
          ),


        ],
      ),
    );
  }
}