class SleepModel {
  int? sleepId;
  int? userId;
  String? sittingandreading;
  String? watchingtv;
  String? sittinginactiveinpublicplace;
  String? passengerinacar;
  String? lyingdown;
  String? sittingandtalkingtosomeone;
  String? sittingquietlyafterlunch;
  String? inacarwhenstoppedintraffic;
  String? sleepscore;
  int? createdBy;
  String? createdDate;

  SleepModel(
      {this.sleepId,
      this.userId,
      this.sittingandreading,
      this.watchingtv,
      this.sittinginactiveinpublicplace,
      this.passengerinacar,
      this.lyingdown,
      this.sittingandtalkingtosomeone,
      this.sittingquietlyafterlunch,
      this.inacarwhenstoppedintraffic,
      this.sleepscore,
      this.createdBy,
      this.createdDate});

  SleepModel.fromJson(Map<String, dynamic> json) {
    sleepId = json['sleepId'];
    userId = json['userId'];
    sittingandreading = json['sittingandreading'];
    watchingtv = json['watchingtv'];
    sittinginactiveinpublicplace = json['sittinginactiveinpublicplace'];
    passengerinacar = json['passengerinacar'];
    lyingdown = json['lyingdown'];
    sittingandtalkingtosomeone = json['sittingandtalkingtosomeone'];
    sittingquietlyafterlunch = json['sittingquietlyafterlunch'];
    inacarwhenstoppedintraffic = json['inacarwhenstoppedintraffic'];
    sleepscore = json['sleepscore'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sleepId'] = sleepId;
    data['userId'] = userId;
    data['sittingandreading'] = sittingandreading;
    data['watchingtv'] = watchingtv;
    data['sittinginactiveinpublicplace'] = sittinginactiveinpublicplace;
    data['passengerinacar'] = passengerinacar;
    data['lyingdown'] = lyingdown;
    data['sittingandtalkingtosomeone'] = sittingandtalkingtosomeone;
    data['sittingquietlyafterlunch'] = sittingquietlyafterlunch;
    data['inacarwhenstoppedintraffic'] = inacarwhenstoppedintraffic;
    data['sleepscore'] = sleepscore;
    data['createdBy'] = createdBy;
    data['createdDate'] = createdDate;
    return data;
  }
}