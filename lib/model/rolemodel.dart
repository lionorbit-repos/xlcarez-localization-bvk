class Rolemodel {
  int? roleId;
  String? roleName;
  int? addedBy;
  String? createdDate;
  String? updatedDate;

  Rolemodel(
      {this.roleId,
      this.roleName,
      this.addedBy,
      this.createdDate,
      this.updatedDate});

  Rolemodel.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    roleName = json['roleName'];
    addedBy = json['addedBy'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roleId'] = roleId;
    data['roleName'] = roleName;
    data['addedBy'] = addedBy;
    data['createdDate'] = createdDate;
    data['updatedDate'] = updatedDate;
    return data;
  }
}