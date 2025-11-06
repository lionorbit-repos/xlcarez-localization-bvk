// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';
import 'dart:developer';
import 'package:XLcarez/env/appexports.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class StepController extends ChangeNotifier {
  DateTime datetime = DateTime.now();
  void chnagedate(DateTime date) {
    try {
      datetime = date;
      notifyListeners();
    } catch (e) {
      datetime = DateTime.now();
      notifyListeners();
    }
  }

  Future<void> saveStepCount({StepCount, weight}) async {
    var box = await Hive.openBox('XLcarezstore');
    final userId = box.get('userId');
    final token = box.get('token');
    // SharedPreferencesAsync sharedPreferences = SharedPreferencesAsync();
    // var userId = await sharedPreferences.getInt("userId");
    // var token = await sharedPreferences.getString("token");
    Uri url = Uri.parse("${baseurl}Pedometer/Save");
    final response = await http.post(url,
        body: jsonEncode({
          "UserId": userId,
          "StepCount": StepCount.toString(),
          "CalorieIntake": caloreies(weight: weight, steps: StepCount),
          "createdDate": DateFormat("yyyy-MM-dd").format(DateTime.now())
        }),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Accept': 'application/json, text/plain, */*',
          "Access-Control-Allow-Origin": "*",
          'Authorization': 'Bearer $token'
        });
    //     print(DateFormat("yyyy-mm-dd").format(DateTime.now()));
    //     print("Calories Burnt ${caloreies(weight: weight,steps: StepCount)}");
    // print(response.body);
    if (response.statusCode == 200) {
      log(response.body.toString());
    }
  }

  double calculateCaloriesFromSteps(int steps, double weightInKg) {
    double stepLengthMeters = 0.762;
    double distanceKilometers =
        steps * stepLengthMeters / 1000; // Convert meters to kilometers
    double metValue = 3.5;
    double caloriesBurnedPerKilometer = metValue * weightInKg * 3.5 / 200 * 60;
    double totalCaloriesBurned =
        caloriesBurnedPerKilometer * distanceKilometers;
    return totalCaloriesBurned / 1000;
  }

  String caloreies({weight, steps}) {
    try {
      return calculateCaloriesFromSteps(steps, double.parse(weight))
          .toStringAsFixed(2);
    } catch (e) {
      return "0.0";
    }
  }

  double _totalSteps = 0;
  double get totalSteps => _totalSteps;
  double _totalcal = 0;
  double get totalcal => _totalcal;
  List<StepCounterModel> _stepList = [];
  List<StepCounterModel> get stepList => [..._stepList];

  bool stepsload = false;

  Future<void> getStepsCount() async {
    try {
      //print("Yalagaka");
      stepsload = true;
      notifyListeners();
      var box = await Hive.openBox('XLcarezstore');
      final userId = box.get('userId');
      final token = box.get('token');
      // SharedPreferencesAsync sharedPreferences = SharedPreferencesAsync();
      // var userId = await sharedPreferences.getInt("userId");
      // var token = await sharedPreferences.getString("token");
      Uri url = Uri.parse("${baseurl}Pedometer/GetAllByUserId");
      final response = await http.post(url,
          body: jsonEncode({
            "id": userId,
          }),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
            'Accept': 'application/json, text/plain, */*',
            "Access-Control-Allow-Origin": "*",
            'Authorization': 'Bearer $token'
          });
      // print(response.body);
      if (response.statusCode == 200) {
        final extractedResponse = await json.decode(response.body);
        final stepData = extractedResponse["data"];
        _stepList = stepData == null
            ? []
            : List<StepCounterModel>.from(
                stepData.map((e) => StepCounterModel.fromJson(e)));
        chnagedate(DateTime.tryParse("${_stepList[0].createdDate}Z") ??
            DateTime.now());
        var stepsday = _stepList
            .where((ele) =>
                DateFormat("dd/MM/yyyy")
                    .format(DateTime.parse("${ele.createdDate}Z")) ==
                DateFormat("dd/MM/yyyy").format(DateTime.now()))
            .toList();

        _totalSteps = stepsday.isEmpty?0:double.parse(stepsday[0].stepCount.toString());  
        _totalcal = stepsday.isEmpty?0:double.parse(stepsday[0].calorieIntake.toString());  
        // _totalSteps = _stepList.map((e) => e.stepCount).fold(0,
        //     (a, b) => double.parse(a.toString()) + double.parse(b.toString()));
        // _totalcal = _stepList.map((e) => e.calorieIntake).fold(0,
        //     (a, b) => double.parse(a.toString()) + double.parse(b.toString()));
      }
      stepsload = false;
      notifyListeners();
    } catch (e) {
      stepsload = false;
      notifyListeners();
    }
  }
}

class StepCounterModel {
  int? id;
  int? userId;
  String? calorieIntake;
  String? stepCount;
  String? createdDate;
  Null updatedDate;

  StepCounterModel(
      {this.id,
      this.userId,
      this.calorieIntake,
      this.stepCount,
      this.createdDate,
      this.updatedDate});

  StepCounterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    calorieIntake = json['calorieIntake'];
    stepCount = json['stepCount'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['calorieIntake'] = calorieIntake;
    data['stepCount'] = stepCount;
    data['createdDate'] = createdDate;
    data['updatedDate'] = updatedDate;
    return data;
  }
}
