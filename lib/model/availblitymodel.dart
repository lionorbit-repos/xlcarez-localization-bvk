class Avaliblity {
  int? id;
  String? startActivity;
  String? endActivity;
  int? hospitalId;
  String? activity;
  int? userId;

  Avaliblity(
      {this.id,
      this.startActivity,
      this.endActivity,
      this.hospitalId,
      this.activity,
      this.userId});

  Avaliblity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startActivity = json['startActivity'];
    endActivity = json['endActivity'];
    hospitalId = json['hospitalId'];
    activity = json['activity'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['startActivity'] = startActivity;
    data['endActivity'] = endActivity;
    data['hospitalId'] = hospitalId;
    data['activity'] = activity;
    data['userId'] = userId;
    return data;
  }
}