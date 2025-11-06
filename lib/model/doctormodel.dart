// ignore_for_file: prefer_collection_literals

import 'package:XLcarez/env/appexports.dart';

class DoctorModel {
  int? userId;
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? phone;
  int? roleId;
  String? status;
  String? image;
  String? roleName;
  String? gender;
  String? createdDate;
  List<SpecialityModel>? specialitylist;
  List<HospitalModel>? hospitalist;

  DoctorModel(
      {this.userId,
      this.firstName,
      this.lastName,
      this.userName,
      this.email,
      this.phone,
      this.roleId,
      this.status,
      this.image,
      this.specialitylist,
      this.hospitalist,
      this.gender,
      this.createdDate,
      this.roleName});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    userName = json['userName'];
    email = json['email'];
    phone = json['phone'];
    roleId = json['roleId'];
    status = json['status'];
    image = json['image'];
    roleName = json['roleName'];
    specialitylist = json["userSpecialities"] == null
        ? []
        : List<SpecialityModel>.from(
            json["userSpecialities"].map((e) => SpecialityModel.fromJson(e)));
    hospitalist = json["userHospitals"] == null
        ? []
        : List<HospitalModel>.from(
            json["userHospitals"].map((e) => HospitalModel.fromJson(e)));
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['userName'] = userName;
    data['email'] = email;
    data['phone'] = phone;
    data['roleId'] = roleId;
    data['status'] = status;
    data['image'] = image;
    data['roleName'] = roleName;
    data['userSpecialities'] = specialitylist?.map((e) => e.toJson()).toList();
    data['userHospitals'] = hospitalist?.map((r) => r.toJson()).toList();
    return data;
  }
}
