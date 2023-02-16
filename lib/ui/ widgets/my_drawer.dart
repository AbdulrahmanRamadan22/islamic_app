import 'package:flutter/material.dart';
import 'package:quran_app/ui/views/home/home_view.dart';
import 'package:quran_app/ui/views/setting/setting_View.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/constant/constant.dart';
import '../../constants/styles/colors.dart';
import '../../constants/styles/string-app.dart';

// ignore: non_constant_identifier_names
Uri LinkedIn = Uri.parse('https://www.linkedin.com/in/abdulrahman-ramadan-5a5700247/');

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    // var width=MediaQuery.of(context).size.width;
    // var height=MediaQuery.of(context).size.height;


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
                  MaterialPageRoute(builder: (context) => const SettingsView()));
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.share,
            ),
            title: TextApp.share,
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
            title: TextApp.account,
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
            title: TextApp.homeView,
            onTap: ()  {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  const HomeView()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.account_box_outlined,
            ),
            title:TextApp.connectUs,
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