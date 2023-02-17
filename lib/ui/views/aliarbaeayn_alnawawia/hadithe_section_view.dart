import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quran_app/constants/styles/string-app.dart';

import '../../../constants/styles/colors.dart';
import '../../../models/hadithe_section_model.dart';
import 'hadithe_detail_view.dart';

class HaditheSection extends StatefulWidget {

  const HaditheSection({Key? key}) : super(key: key);

  @override
  State<HaditheSection> createState() => _HaditheSectionState();
}

class _HaditheSectionState extends State<HaditheSection> {
  // ignore: non_constant_identifier_names
  List<HaditheSectionModel> sections=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSections();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title:TextApp.aliarbaeaynHadithe,
        // elevation: 0.0,
      ),

      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder:(context, index) =>  buildSectionItem(model: sections[index]) ,
            itemCount: sections.length,

          ),
        ),
      )


    );
  }

Widget buildSectionItem(
      {
  required HaditheSectionModel model,
}
    ){

    return InkWell(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  HaditheDetailView(keyName:model.keyName! ,))),

      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient:   const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                ColorApp.darkPrimary,
                ColorApp.teal,
                ColorApp.primary,
              ]),

        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40,),
            Text(
              textAlign: TextAlign.center,
              "${model.keyName}",
              style: const TextStyle(
                color: ColorApp.amber,
                fontFamily: "Tajawal",
                fontWeight: FontWeight.w400,
                fontSize: 24,
              ),

            ),
            const SizedBox(height: 10,),
            Text(
              textAlign: TextAlign.center,
              "${model.nameHadith}",
              style: const TextStyle(
                color: ColorApp.white,
                fontFamily: "Tajawal",
                // fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),



          ],
        ),
      ),
    );
}

  loadSections() async {

    DefaultAssetBundle.of(context)
        .loadString("assets/json/hadithe/sections_db.json")
        .then((data) {
      var response = json.decode(data);

      print(response);
      response.forEach((section) {
        HaditheSectionModel _section =  HaditheSectionModel.fromJson(section);
        sections.add(_section);

      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }

}
