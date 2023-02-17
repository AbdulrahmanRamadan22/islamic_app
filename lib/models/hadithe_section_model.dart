class  HaditheSectionModel {
  String? keyName;
  String?nameHadith;

  HaditheSectionModel({this.keyName, this.nameHadith});

  HaditheSectionModel.fromJson(Map<String, dynamic> json) {
    keyName = json["keyName"];
    nameHadith= json["nameHadith"];
  }



  }
//

