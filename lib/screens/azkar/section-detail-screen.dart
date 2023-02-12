import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quran_app/shared/models/section_detail_model.dart';

class SectionDetailScreen extends StatefulWidget {
  final String name;
  const SectionDetailScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<SectionDetailScreen> createState() => _SectionDetailScreenState();
}


class _SectionDetailScreenState extends State<SectionDetailScreen> {
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
        title: Text('${widget.name}'),
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
        SectionDetailModel _sectionDetail = SectionDetailModel.fromJson(section);

        if(_sectionDetail.section==widget.name){
          sectionDetails.add(_sectionDetail);
        }


      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
