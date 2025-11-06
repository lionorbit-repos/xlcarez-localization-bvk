class Appointmentmodel {
  int? appointmentId;
  String? startTime;
  String? endTime;
  int? patientId;
  int? clinicianId;
  int? specialityId;
  String? status;
  int? addedBy;
  String? teleConsultation;
  String? preferedGender;
  String? preferredDate;
  String? transactionId;
  String? clinicianName;
  String? patientName;
  String? specialityName;
  String? paymentStatus;
  dynamic paymentAmount;
  String? preferredTime;
  dynamic hospitalId;
  String? clinicianImage;
  String? patientImage;

  /*
  "clinicianName": "Eswar banoth",
			"patientName": "eswar b",
			"specialityName": "Geriatrics"
  "teleConsultation": "yes",
		"preferedGender": "Male",
		"preferredDate": "2023-12-03T09:14:51.770Z",
		"transactionId": "1",
		"paymentStatus": "Pending",
		"paymentType": null,
		"paymentAmount": 0.00,
		"preferredTime": "04:56"
  */

  Appointmentmodel(
      {this.appointmentId,
      this.startTime,
      this.specialityName,
      this.clinicianName,
      this.patientName,
      this.endTime,
      this.patientId,
      this.clinicianId,
      this.specialityId,
      this.status,
      this.addedBy,
      this.teleConsultation,
      this.preferedGender,
      this.preferredDate,
      this.transactionId,
      this.paymentStatus,
      this.paymentAmount,
      this.hospitalId,
      this.preferredTime,
      this.clinicianImage,
      this.patientImage});

  Appointmentmodel.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointmentId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    patientId = json['patientId'];
    clinicianId = json['clinicianId'];
    specialityId = json['specialityId'];
    status = json['status'];
    addedBy = json['addedBy'];
    teleConsultation = json['teleConsultation'];
    preferedGender = json['preferedGender'];
    preferredDate = json['preferredDate'];
    transactionId = json['transactionId'];
    paymentStatus = json['paymentStatus'];
    paymentAmount = json['paymentAmount'];
    preferredTime = json['preferredTime'];
    patientName = json["patientName"];
    hospitalId = json['hospitalId'];
    clinicianName = json["clinicianName"];
    specialityName = json["specialityName"];
    clinicianImage = json["clinicianImage"];
    patientImage = json["patientImage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appointmentId'] = appointmentId;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['patientId'] = patientId;
    data['clinicianId'] = clinicianId;
    data['specialityId'] = specialityId;
    data['status'] = status;
    data['addedBy'] = addedBy;
    data['teleConsultation'] = teleConsultation;
    data['preferedGender'] = preferedGender;
    data['preferredDate'] = preferredDate;
    data['transactionId'] = transactionId;
    data['paymentStatus'] = paymentStatus;
    data['paymentAmount'] = paymentAmount;
    data['preferredTime'] = preferredTime;
    data["clinicianImage"] = clinicianImage;
    data["patientImage"] = patientImage;
    return data;
  }
}
