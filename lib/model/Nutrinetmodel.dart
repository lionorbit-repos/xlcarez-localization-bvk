// ignore_for_file: file_names, prefer_collection_literals

class NutrientForm {
  dynamic nutrientId;
  String? nutrientName;
  String? nutrientNumber;
  String? unitName;
  String? derivationCode;
  String? derivationDescription;
  dynamic derivationId;
  dynamic value;
  dynamic foodNutrientSourceId;
  String? foodNutrientSourceCode;
  String? foodNutrientSourceDescription;
  dynamic rank;
  dynamic indentLevel;
  dynamic foodNutrientId;
  dynamic percentDailyValue;

  NutrientForm(
      {this.nutrientId,
      this.nutrientName,
      this.nutrientNumber,
      this.unitName,
      this.derivationCode,
      this.derivationDescription,
      this.derivationId,
      this.value,
      this.foodNutrientSourceId,
      this.foodNutrientSourceCode,
      this.foodNutrientSourceDescription,
      this.rank,
      this.indentLevel,
      this.foodNutrientId,
      this.percentDailyValue});

  NutrientForm.fromJson(Map<String, dynamic> json) {
    nutrientId = json['nutrientId'];
    nutrientName = json['nutrientName'];
    nutrientNumber = json['nutrientNumber'];
    unitName = json['unitName'];
    derivationCode = json['derivationCode'];
    derivationDescription = json['derivationDescription'];
    derivationId = json['derivationId'];
    value = json['value'];
    foodNutrientSourceId = json['foodNutrientSourceId'];
    foodNutrientSourceCode = json['foodNutrientSourceCode'];
    foodNutrientSourceDescription = json['foodNutrientSourceDescription'];
    rank = json['rank'];
    indentLevel = json['indentLevel'];
    foodNutrientId = json['foodNutrientId'];
    percentDailyValue = json['percentDailyValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nutrientId'] = nutrientId;
    data['nutrientName'] = nutrientName;
    data['nutrientNumber'] = nutrientNumber;
    data['unitName'] = unitName;
    data['derivationCode'] = derivationCode;
    data['derivationDescription'] = derivationDescription;
    data['derivationId'] = derivationId;
    data['value'] = value;
    data['foodNutrientSourceId'] = foodNutrientSourceId;
    data['foodNutrientSourceCode'] = foodNutrientSourceCode;
    data['foodNutrientSourceDescription'] = foodNutrientSourceDescription;
    data['rank'] = rank;
    data['indentLevel'] = indentLevel;
    data['foodNutrientId'] = foodNutrientId;
    data['percentDailyValue'] = percentDailyValue;
    return data;
  }
}