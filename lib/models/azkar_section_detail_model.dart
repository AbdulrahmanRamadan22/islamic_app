class  AzkarSectionDetailModel {
  String? section;
  String? count;
  String? description;
  String? reference;
  String? content;

  AzkarSectionDetailModel(this.section, this.count, this.description, this.content,
      this.reference);

  AzkarSectionDetailModel.fromJson(Map<String, dynamic> json) {
    section = json["section"];
    count = json["count"];
    description = json["description"];
    reference = json["reference"];
    content = json["content"];
  }
}