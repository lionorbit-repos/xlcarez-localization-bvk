class SpecialityModel {
  int? specialityId;
  String? specialityName;
  int? addedBy;
  String? createdDate;
  String? updatedDate;
  String? status;
  int? userId;
  String? doctorName;
  String? image;

  SpecialityModel(
      {this.specialityId,
      this.specialityName,
      this.addedBy,
      this.createdDate,
      this.updatedDate,
      this.status,
      this.userId,
      this.doctorName,
      this.image});

  SpecialityModel.fromJson(Map<String, dynamic> json) {
    specialityId = json['specialityId'];
    specialityName = json['specialityName'];
    addedBy = json['addedBy'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    status = json['status'];
    userId = json['userId'];
    doctorName = json['doctorName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['specialityId'] = specialityId;
    data['specialityName'] = specialityName;
    data['addedBy'] = addedBy;
    data['createdDate'] = createdDate;
    data['updatedDate'] = updatedDate;
    data['status'] = status;
    data['userId'] = userId;
    data['doctorName'] = doctorName;
    data['image'] = image;
    return data;
  }
}