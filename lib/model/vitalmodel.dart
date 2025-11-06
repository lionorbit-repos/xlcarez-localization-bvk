// ignore_for_file: prefer_collection_literals

class Vitalmodel {
  int? vitalsId;
  int? userId;
  String? wellnessIndex;
  String? wellnessLevel;
  String? hemoglobinA1C;
  String? hemoglobin;
  String? pulseRate;
  String? respirationRate;
  String? stressLevel;
  String? stressIndex;
  String? oxygenSaturation;
  String? bloodPressure;
  String? bmi;
  String? weight;
  String? height;
  String? temparature;
  String? sugar;
  String? cholesterol;
  String? recordType;
  int? addedBy;
  String? createdDate;
  String? updatedDate;
  String? country;
  String? bloodpressurelevel;
  String? respirationlevel;
  String? oxygensaturationlevel;
  String? pulselevel;
  String? breatheconfidence;
  String? heartconfidence;
  /*
  "bloodpressurelevel": null,
			"respirationlevel": null,
			"oxygensaturationlevel": null,
			"pulselevel": null
  */

  Vitalmodel(
      {this.vitalsId,
      this.userId,
      this.wellnessIndex,
      this.wellnessLevel,
      this.hemoglobinA1C,
      this.hemoglobin,
      this.pulseRate,
      this.respirationRate,
      this.stressLevel,
      this.stressIndex,
      this.oxygenSaturation,
      this.bloodPressure,
      this.bmi,
      this.weight,
      this.height,
      this.temparature,
      this.sugar,
      this.cholesterol,
      this.recordType,
      this.addedBy,
      this.bloodpressurelevel,
      this.oxygensaturationlevel,
      this.pulselevel,
      this.respirationlevel,
      this.createdDate,
      this.breatheconfidence,
      this.heartconfidence,
      this.updatedDate,
      this.country});

  Vitalmodel.fromJson(Map<String, dynamic> json) {
    vitalsId = json['vitalsId'];
    userId = json['userId'];
    wellnessIndex = json['wellnessIndex'];
    heartconfidence = json["heartconfidence"];
    breatheconfidence = json["breatheconfidence"];
    wellnessLevel = json['wellnessLevel'];
    hemoglobinA1C = json['hemoglobinA1C'];
    hemoglobin = json['hemoglobin'];
    pulseRate = json['pulseRate'];
    respirationRate = json['respirationRate'];
    stressLevel = json['stressLevel'];
    stressIndex = json['stressIndex'];
    oxygenSaturation = json['oxygenSaturation'];
    bloodPressure = json['bloodPressure'];
    bmi = json['bmi'];
    weight = json['weight'];
    height = json['height'];
    temparature = json['temparature'];
    sugar = json['sugar'];
    cholesterol = json['cholesterol'];
    recordType = json['recordType'];
    addedBy = json['addedBy'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    country = json['country'];
    bloodpressurelevel=json["bloodpressurelevel"];
    respirationlevel = json["respirationlevel"];
    oxygensaturationlevel =json["oxygensaturationlevel"];
    pulselevel = json["pulselevel"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['vitalsId'] = vitalsId;
    data['userId'] = userId;
    data['wellnessIndex'] = wellnessIndex;
    data["breatheconfidence"] = breatheconfidence;
    data["heartconfidence"] = heartconfidence;
    data['wellnessLevel'] = wellnessLevel;
    data['hemoglobinA1C'] = hemoglobinA1C;
    data['hemoglobin'] = hemoglobin;
    data['pulseRate'] = pulseRate;
    data['respirationRate'] = respirationRate;
    data['stressLevel'] = stressLevel;
    data['stressIndex'] = stressIndex;
    data['oxygenSaturation'] = oxygenSaturation;
    data['bloodPressure'] = bloodPressure;
    data['bmi'] = bmi;
    data['weight'] = weight;
    data['height'] = height;
    data['temparature'] = temparature;
    data['sugar'] = sugar;
    data['cholesterol'] = cholesterol;
    data['recordType'] = recordType;
    data['addedBy'] = addedBy;
    data['createdDate'] = createdDate;
    data['updatedDate'] = updatedDate;
    data['country'] = country;
    return data;
  }
}