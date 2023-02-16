import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../models/section_detail_model.dart';

class SectionDetailView extends StatefulWidget {
  final String name;
  const SectionDetailView({Key? key, required this.name}) : super(key: key);

  @override
  State<SectionDetailView> createState() => _SectionDetailViewState();
}


class _SectionDetailViewState extends State<SectionDetailView> {
  List<SectionDetailModel> sectionDetails = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSectionsDetail();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),

      body: ListView.separated(
          itemBuilder:(context, index) => ListTile(
            title: Text(
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,

              '${sectionDetails[index].reference}',
            ),
            subtitle: Text(
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              "${sectionDetails[index].content}",
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: sectionDetails.length
      ),
    );
  }

  loadSectionsDetail() async {
    sectionDetails = [];
    DefaultAssetBundle.of(context)
        .loadString("assets/json/azkar/section_details_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        SectionDetailModel sectionDetail = SectionDetailModel.fromJson(section);

        if(sectionDetail.section==widget.name){
          sectionDetails.add(sectionDetail);
        }


      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
