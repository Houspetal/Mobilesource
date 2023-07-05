class DiseaseModel {
  String? name;
  String? description;
  String? symtomps;
  String? spread;
  String? warning;

  DiseaseModel({
    this.name,
    this.description,
    this.symtomps,
    this.spread,
    this.warning,
  });

  DiseaseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    description = json['description'] as String?;
    symtomps = json['symtomps'] as String?;
    spread = json['spread'] as String?;
    warning = json['warning'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['description'] = description;
    json['symtomps'] = symtomps;
    json['spread'] = spread;
    json['warning'] = warning;
    return json;
  }
}
