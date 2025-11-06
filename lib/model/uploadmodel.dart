class UploadModel {
  int? id;
  String? title;
  String? uploadedFileName;
  String? fileExtension;

  UploadModel({this.id, this.title, this.uploadedFileName, this.fileExtension});

  UploadModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    uploadedFileName = json['uploadedFileName'];
    fileExtension = json['fileExtension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['uploadedFileName'] = uploadedFileName;
    data['fileExtension'] = fileExtension;
    return data;
  }
}