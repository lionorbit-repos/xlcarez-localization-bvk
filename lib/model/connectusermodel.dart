class ConnectSearchModel {
  int? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  int? roleId;
  String? status;
  int? createdBy;
  int? organizationId;
  String? createdDate;
  dynamic updatedBy;
  String? updatedDate;
  String? image;
  String? gender;
  String? dob;
  String? consentName;
  String? height;
  String? weight;
  int? planId;
  int? scansLimit;
  String? scansValidity;
  String? isdCode;
  String? isoCode;

  ConnectSearchModel(
      {this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phone,
      this.roleId,
      this.status,
      this.createdBy,
      this.organizationId,
      this.isdCode,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.image,
      this.gender,
      this.dob,
      this.consentName,
      this.height,
      this.weight,
      this.planId,
      this.scansLimit,
      this.scansValidity});

  ConnectSearchModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    isdCode = json['isdCode'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    roleId = json['roleId'];
    status = json['status'];
    createdBy = json['createdBy'];
    organizationId = json['organizationId'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
    image = json['image'];
    gender = json['gender'];
    dob = json['dob'];
    consentName = json['consentName'];
    height = json['height'];
    weight = json['weight'];
    planId = json['planId'];
    isoCode = json['isoCode'];
    scansLimit = json['scansLimit'];
    scansValidity = json['scansValidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['isoCode'] = isoCode;
    data['isdCode'] = isdCode;
    data['phone'] = phone;
    data['roleId'] = roleId;
    data['status'] = status;
    data['createdBy'] = createdBy;
    data['organizationId'] = organizationId;
    data['createdDate'] = createdDate;
    data['updatedBy'] = updatedBy;
    data['updatedDate'] = updatedDate;
    data['image'] = image;
    data['gender'] = gender;
    data['dob'] = dob;
    data['consentName'] = consentName;
    data['height'] = height;
    data['weight'] = weight;
    data['planId'] = planId;
    data['scansLimit'] = scansLimit;
    data['scansValidity'] = scansValidity;
    return data;
  }
}