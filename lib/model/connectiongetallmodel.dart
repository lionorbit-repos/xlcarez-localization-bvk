// ignore_for_file: file_names, prefer_collection_literals

class ConnectionGetAllModel {
  int? id;
  int? fromUserId;
  int? toUserId;
  String? status;
  String? createdDate;
  String? updatedDate;
  String? fromUserName;
  String? fromUserRole;
  String? toUserName;
  String? toUserRole;
  String? fromUserImage;
  String? toUserImage;
  String? fromUserSpeciality;
  String? toUserSpeciality;


  ConnectionGetAllModel(
      {this.id,
        this.fromUserId,
        this.toUserId,
        this.status,
        this.createdDate,
        this.updatedDate,
        this.fromUserName,
        this.fromUserRole,
        this.toUserName,
        this.toUserRole,
        this.fromUserImage,
        this.toUserImage,
        this.fromUserSpeciality,
        this.toUserSpeciality,
      });

  ConnectionGetAllModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fromUserId = json['fromUserId'];
    toUserId = json['toUserId'];
    status = json['status'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    fromUserName = json['fromUserName'];
    fromUserRole = json['fromUserRole'];
    toUserName = json['toUserName'];
    toUserRole = json['toUserRole'];
    fromUserImage = json["fromUserImage"];
    toUserImage = json["toUserImage"];
    fromUserSpeciality = json["fromUserSpeciality"];
    toUserSpeciality = json["toUserSpeciality"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['fromUserId'] = fromUserId;
    data['toUserId'] = toUserId;
    data['status'] = status;
    data['createdDate'] = createdDate;
    data['updatedDate'] = updatedDate;
    data['fromUserName'] = fromUserName;
    data['fromUserRole'] = fromUserRole;
    data['toUserName'] = toUserName;
    data['toUserRole'] = toUserRole;
    data['fromUserImage'] = fromUserImage;
    data['toUserImage'] = toUserImage;
    data['fromUserSpeciality'] = fromUserSpeciality;
    data['toUserSpeciality'] = toUserSpeciality;
    return data;
  }
}
