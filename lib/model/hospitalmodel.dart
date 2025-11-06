// ignore_for_file: prefer_collection_literals

class HospitalModel {
  int? hospitalId;
  String? hospitalName;

  HospitalModel({this.hospitalId, this.hospitalName});

  HospitalModel.fromJson(Map<String, dynamic> json) {
    hospitalId = json['hospitalId'];
    hospitalName = json['hospitalName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['hospitalId'] = hospitalId;
    data['hospitalName'] = hospitalName;
    return data;
  }
}