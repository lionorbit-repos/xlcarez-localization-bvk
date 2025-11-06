class FatigueModel {
  int? fatigueId;
  int? userId;
  String? motivationfatigue;
  String? exercisefatigue;
  String? easilyfatigued;
  String? physicalfunctioningfatigue;
  String? causesfatigue;
  String? myfatigueprevents;
  String? fatiguedutiesandresponsibilities;
  String? fatiguesymtoms;
  String? fatiguesocial;
  String? fatiguescore;
  int? createdBy;
  String? createdDate;

  FatigueModel(
      {this.fatigueId,
      this.userId,
      this.motivationfatigue,
      this.exercisefatigue,
      this.easilyfatigued,
      this.physicalfunctioningfatigue,
      this.causesfatigue,
      this.myfatigueprevents,
      this.fatiguedutiesandresponsibilities,
      this.fatiguesymtoms,
      this.fatiguesocial,
      this.fatiguescore,
      this.createdBy,
      this.createdDate});

  FatigueModel.fromJson(Map<String, dynamic> json) {
    fatigueId = json['fatigueId'];
    userId = json['userId'];
    motivationfatigue = json['motivationfatigue'];
    exercisefatigue = json['exercisefatigue'];
    easilyfatigued = json['easilyfatigued'];
    physicalfunctioningfatigue = json['physicalfunctioningfatigue'];
    causesfatigue = json['causesfatigue'];
    myfatigueprevents = json['myfatigueprevents'];
    fatiguedutiesandresponsibilities = json['fatiguedutiesandresponsibilities'];
    fatiguesymtoms = json['fatiguesymtoms'];
    fatiguesocial = json['fatiguesocial'];
    fatiguescore = json['fatiguescore'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fatigueId'] = fatigueId;
    data['userId'] = userId;
    data['motivationfatigue'] = motivationfatigue;
    data['exercisefatigue'] = exercisefatigue;
    data['easilyfatigued'] = easilyfatigued;
    data['physicalfunctioningfatigue'] = physicalfunctioningfatigue;
    data['causesfatigue'] = causesfatigue;
    data['myfatigueprevents'] = myfatigueprevents;
    data['fatiguedutiesandresponsibilities'] =
        fatiguedutiesandresponsibilities;
    data['fatiguesymtoms'] = fatiguesymtoms;
    data['fatiguesocial'] = fatiguesocial;
    data['fatiguescore'] = fatiguescore;
    data['createdBy'] = createdBy;
    data['createdDate'] = createdDate;
    return data;
  }
}