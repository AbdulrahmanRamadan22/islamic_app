class  AzkarSectionModel {
  String? name;
  AzkarSectionModel( this.name);

  AzkarSectionModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
  }
}




