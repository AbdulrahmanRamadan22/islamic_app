import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../constants/styles/colors.dart';
import '../../../models/hadithe_section_detail_model.dart';

class HaditheDetailView extends StatefulWidget {
  final String keyName;

  const HaditheDetailView({Key? key,  required this.keyName}) : super(key: key);

  @override
  State<HaditheDetailView> createState() => _HaditheDetailViewState();
}

class _HaditheDetailViewState extends State<HaditheDetailView> {
  List<HadithSectionDetailModel> sectionDetails=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSectionsDetail();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
              itemBuilder:(context, index) => Column(
                children: [
                  Card(
                    shape:  RoundedRectangleBorder(
                      side: const BorderSide(
                        color: ColorApp.primary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20.0),

                    ),

                    child: Container(

                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 10),
                      decoration: BoxDecoration(
                        color:ColorApp.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        title: Text(
                          textAlign: TextAlign.center,
                          "${sectionDetails[index].hadith}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: ColorApp.primary,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                      ),



                    ),
                  ),
                  SizedBox(height: 20,),


                  Card(
                    shape:  RoundedRectangleBorder(
                      side: const BorderSide(
                        color: ColorApp.primary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20.0),

                    ),

                    child: Container(

                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 10),
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        title: Text(
                          textAlign: TextAlign.center,
                          "${sectionDetails[index].description}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: ColorApp.amber,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                      ),



                    ),
                  ),
                ],
              ),
              itemCount: sectionDetails.length,
          ),
        ),
      ),


    );
  }

  // Widget  buildDetailItem({
  //
  // required HadithSectionDetailModel detailModel,
  //
  // }){
  //
  //   return Card(
  //       shape: const RoundedRectangleBorder( //<-- SEE HERE
  //       side: BorderSide(
  //       color: Colors.greenAccent,
  //   ),
  //       ),
  //
  //
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color:ColorApp.white,
  //         borderRadius: BorderRadius.circular(20),
  //
  //
  //       ),
  //
  //
  //
  //     ),
  //   );
  //
  //
  // }


  loadSectionsDetail() async {
      sectionDetails = [];

    DefaultAssetBundle.of(context)
        .loadString("assets/json/hadithe/section_details_db.json")
        .then((data) {
      var response = json.decode(data);

      response.forEach((section) {
        HadithSectionDetailModel sectionDetail =  HadithSectionDetailModel.fromJson(section);


        if(sectionDetail.keyName==widget.keyName){
          sectionDetails.add(sectionDetail);
        }


      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}

