class SectionDetailModel {
  String? section;
  String? count;
  String? description;
  String? reference;
  String? content;

  SectionDetailModel(this.section, this.count, this.description, this.content,
      this.reference);

  SectionDetailModel.fromJson(Map<String, dynamic> json) {
    section = json["section"];
    count = json["count"];
    description = json["description"];
    reference = json["reference"];
    content = json["content"];
  }
}