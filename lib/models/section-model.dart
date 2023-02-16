class SectionModel {
  String? name;
  SectionModel( this.name);

  SectionModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
  }
}




