// ignore_for_file: prefer_collection_literals

class FoodLogModel {
  int? id;
  int? userId;
  String? foodImage;
  String? itemName;
  String? nutritionInfo;
  int? addedBy;
  String? createdDate;
  String? calorie;

  FoodLogModel(
      {this.id, this.userId, this.itemName, this.nutritionInfo, this.addedBy,this.calorie,this.createdDate});

  FoodLogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdDate = json['createdDate'];
    foodImage = json['foodImage'];
    userId = json['userId'];
    itemName = json['itemName'];
    nutritionInfo = json['nutritionInfo'];
    addedBy = json['addedBy'];
    calorie = json['calorie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['foodImage'] = foodImage;
    data['userId'] = userId;
    data['itemName'] = itemName;
    data['nutritionInfo'] = nutritionInfo;
    data['addedBy'] = addedBy;
    data['calorie'] = calorie;
    return data;
  }
}