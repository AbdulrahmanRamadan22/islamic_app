import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quran_app/ui/views/azkar/section_detail_view.dart';

import '../../ widgets/container_app_bar.dart';
import '../../../constants/styles/colors.dart';
import '../../../models/section-model.dart';


class AzkarView extends StatefulWidget {
  const AzkarView({Key? key}) : super(key: key);

  @override
  State<AzkarView> createState() => _AzkarViewState();
}

class _AzkarViewState extends State<AzkarView> {
  List<SectionModel> sections = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSections();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          "أذكار المسلم",
          style: TextStyle(fontFamily:'Tajawal',),
        ),


      ),


      body: ListView(
        // physics: const BouncingScrollPhysics(),

        children: [

          containerAppBar(text:
          '''
              الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُم بِذِكْرِ اللَّهِ ۗ
              أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ

              '''),

          ListView.builder(

            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,


            itemBuilder:((context, index) =>  buildSectionItem(
                model: sections[index],
            )
            ) ,
            itemCount: sections.length,

            // children: [
            //
            //
            //
            //
            // ],
          ),
        ],
      ),

    );
  }

  Widget  buildSectionItem({

    required SectionModel model,
  })=> Expanded(
    child: InkWell(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => SectionDetailView(name: model.name!,))),


      child: Container(
        height: 80,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(right: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(10) ,
          gradient:   const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                ColorApp.darkPrimary,
                ColorApp.teal,
                ColorApp.primary,
              ]),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Text(
              " ${model.name}",
              style: const TextStyle(
                color:ColorApp.white,
                fontSize: 24,
                fontWeight:  FontWeight.bold,
                fontFamily: 'Tajawal',
              ),
            ),
            const SizedBox(width: 20,),
            const Image(
              image: AssetImage("assets/images/star.png"),
              height:40,
              width: 40,
            ),

          ],
        ),
      ),
    ),
  );

  loadSections() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/json/azkar/sections_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        SectionModel _section = SectionModel.fromJson(section);
        sections.add(_section);
        // print(_section.name);
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }

}

