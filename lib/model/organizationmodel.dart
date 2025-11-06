import 'package:XLcarez/env/appexports.dart';

class Organisationmodel {
  int? organizationId;
  TextEditingController? organizationName;
  int? addedBy;
  TextEditingController? scanLimit;
  String? createdDate;
  String? updatedDate;
  String? orgCode;
  TextEditingController? orgTotalScans;
  TextEditingController? shortName;

  Organisationmodel(
      {this.organizationId,
      this.organizationName,
      this.addedBy,
      this.orgCode,
      this.scanLimit,
      this.createdDate,
      this.updatedDate,
      this.shortName});

  Organisationmodel.fromJson(Map<String, dynamic> json) {
    organizationId = json['organizationId'];
    scanLimit = TextEditingController.fromValue(TextEditingValue(text: json['scanLimit']==null?"0":json["scanLimit"].toString()));
    organizationName = TextEditingController.fromValue(TextEditingValue(text: json['organizationName']??""));
    orgCode = json["orgCode"];
    orgTotalScans = TextEditingController.fromValue(TextEditingValue(text: json["orgTotalScans"]==null?"1":"${json["orgTotalScans"]}"));
    addedBy = json['addedBy'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    shortName = TextEditingController.fromValue(TextEditingValue(text: json['shortName']??""));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['organizationId'] = organizationId??0;
    data['organizationName'] = organizationName?.text;
    data['scanLimit'] = scanLimit?.text;
    data['shortName'] = shortName?.text;
    data["orgTotalScans"] = orgTotalScans?.text;
    data["orgCode"] = orgCode;
    return data;
  }
}