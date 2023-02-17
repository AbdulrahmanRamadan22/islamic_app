class HadithSectionDetailModel {
  String? keyName;
  String? nameHadith;
  String? hadith;
  String? description;
  String? audioHadith;

  HadithSectionDetailModel(
      {this.keyName,
      this.nameHadith,

     this.hadith,
    this.description,
     this.audioHadith});

  factory HadithSectionDetailModel.fromJson(Map<String, dynamic> json) {
    return HadithSectionDetailModel(
      keyName: json["keyName"],
      nameHadith: json["nameHadith"],
      hadith: json["hadith"],
      description: json["description"],
      audioHadith: json["audioHadith"],
    );
  }
//
}