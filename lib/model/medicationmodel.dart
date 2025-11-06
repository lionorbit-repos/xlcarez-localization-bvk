import 'package:XLcarez/env/appexports.dart';

class Medication {
  int? medicationId;
  int? userId;
  int? appointmentId;
  TextEditingController? medicineName;
  String? days;
  String? dosage;
  int? addedBy;
  String? createdDate;

  Medication(
      {this.medicationId,
      this.userId,
      this.appointmentId,
      this.medicineName,
      this.days,
      this.dosage,
      this.addedBy,
      this.createdDate});

  Medication.fromJson(Map<String, dynamic> json) {
    medicationId = json['medicationId'];
    userId = json['userId'];
    appointmentId = json['appointmentId'];
    medicineName = TextEditingController.fromValue(TextEditingValue(text: json["medicineName"]??""));
    days = json['days'];
    dosage = json['dosage'];
    addedBy = json['addedBy'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medicationId'] = medicationId;
    data['appointmentId'] = appointmentId;
    data['userId'] = userId;
    data['medicineName'] = medicineName?.text;
    data['days'] = days;
    data['dosage'] = dosage;
    data['addedBy'] = addedBy;
    return data;
  }
}