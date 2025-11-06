class Symptoms {
  List<Data>? data;

  Symptoms({this.data});

  Symptoms.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? indicators;

  Data({this.id, this.indicators});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    indicators = json['indicators'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['indicators'] = indicators;
    return data;
  }
}