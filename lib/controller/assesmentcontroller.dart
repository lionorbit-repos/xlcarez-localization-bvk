import 'dart:developer';

import 'package:XLcarez/env/appexports.dart';
import 'package:XLcarez/model/fatiguemodel.dart';
import 'package:XLcarez/model/sleepmodel.dart';

class Assesmentcontroller extends ChangeNotifier {
  List<int> scores = List.filled(12, 0);

  void chnagescore({index, value}) {
    scores[index] = value;
    notifyListeners();
  }

  String getscore(index) {
    return scores[index - 1].toStringAsFixed(2);
  }

  double calculateTotalScore() {
    return scores.reduce((a, b) => a + b) / scores.length;
  }

  double calculateIntegrationScore() {
    List<int> integrationIndices = [0, 1, 2, 3, 4, 5, 6, 9, 10];
    int sum = integrationIndices.map((i) => scores[i]).reduce((a, b) => a + b);
    return sum / integrationIndices.length;
  }

  double calculatePerseveranceScore() {
    List<int> perseveranceIndices = [7, 8, 11];
    int sum = perseveranceIndices.map((i) => scores[i]).reduce((a, b) => a + b);
    return sum / perseveranceIndices.length;
  }

  List answers = const [
    {"label": "Never", "value": 0},
    {"label": "Slight", "value": 1},
    {"label": "Moderate", "value": 2},
    {"label": "High", "value": 3},
    // "Slight",
    // "Moderate",
    // "High"
  ];
  List fatigueanswers = const [
    {"label": "Strongly disagree", "value": 1},
    {"label": "Disagree", "value": 2},
    {"label": "Slightly disagree", "value": 3},
    {"label": "Neither agree or disagree", "value": 4},
    {"label": "Slightly agree", "value": 5},
    {"label": "Agree", "value": 6},
    {"label": "Strongly agree", "value": 7},
  ];
  dynamic fatigue1;
  dynamic fatigue2;
  dynamic fatigue3;
  dynamic fatigue4;
  dynamic fatigue5;
  dynamic fatigue6;
  dynamic fatigue7;
  dynamic fatigue8;
  dynamic fatigue9;

  dynamic fatiquescore = "";

  DateTime sleepdate = DateTime.now();
  DateTime fatiguedate = DateTime.now();
  DateTime adherencedate = DateTime.now();
  void chnagesleepdate(DateTime date) {
    try {
      sleepdate = date;
      notifyListeners();
    } catch (e) {
      sleepdate = DateTime.now();
      notifyListeners();
    }
  }

  void chnageadherncedate(DateTime date) {
    try {
      adherencedate = date;
      notifyListeners();
    } catch (e) {
      adherencedate = DateTime.now();
      notifyListeners();
    }
  }

  void chnagefatiguedate(DateTime date) {
    try {
      fatiguedate = date;
      notifyListeners();
    } catch (e) {
      fatiguedate = DateTime.now();
      notifyListeners();
    }
  }

  void chnagefaigue(val, key) {
    if (key == 0) {
      fatigue1 = val;
    } else if (key == 1) {
      fatigue2 = val;
    } else if (key == 2) {
      fatigue3 = val;
    } else if (key == 3) {
      fatigue4 = val;
    } else if (key == 4) {
      fatigue5 = val;
    } else if (key == 5) {
      fatigue6 = val;
    } else if (key == 6) {
      fatigue7 = val;
    } else if (key == 7) {
      fatigue8 = val;
    } else {
      fatigue9 = val;
    }
    notifyListeners();
    checfatiguescore();
  }

  dynamic fetchfatique(key) {
    if (key == 0) {
      return fatigue1;
    } else if (key == 1) {
      return fatigue2;
    } else if (key == 2) {
      return fatigue3;
    } else if (key == 3) {
      return fatigue4;
    } else if (key == 4) {
      return fatigue5;
    } else if (key == 5) {
      return fatigue6;
    } else if (key == 6) {
      return fatigue7;
    } else if (key == 7) {
      return fatigue8;
    } else {
      return fatigue9;
    }
    //checfatiguescore();
  }

  dynamic sleep1 = 0;
  void changsleep1(context, val) {
    sleep1 = val;
    notifyListeners();
    checkscore(context);
  }

  dynamic sleep2 = 0;
  void changsleep2(context, val) {
    sleep2 = val;
    notifyListeners();
    checkscore(context);
  }

  dynamic sleep3 = 0;
  void changsleep3(context, val) {
    sleep3 = val;
    notifyListeners();
    checkscore(context);
  }

  dynamic sleep4 = 0;
  void changsleep4(context, val) {
    sleep4 = val;
    notifyListeners();
    checkscore(context);
  }

  dynamic sleep5 = 0;
  void changsleep5(context, val) {
    sleep5 = val;
    notifyListeners();
    checkscore(context);
  }

  dynamic sleep6 = 0;
  void changsleep6(context, val) {
    sleep6 = val;
    notifyListeners();
    checkscore(context);
  }

  dynamic sleep7 = 0;
  void changsleep7(context, val) {
    sleep7 = val;
    notifyListeners();
    checkscore(context);
  }

  dynamic sleep8 = 0;
  void changsleep8(context, val) {
    sleep8 = val;
    notifyListeners();
    checkscore(context);
  }

  dynamic sleepscore = 0;
  dynamic risckscore = "Lower Normal";
  void checkscore(context) {
    var sleeplist = [
      sleep1,
      sleep2,
      sleep3,
      sleep4,
      sleep5,
      sleep6,
      sleep7,
      sleep8,
    ];
    sleepscore = sleeplist.reduce((ev, ele) => ev + ele);
    //log("Score $sleepscore");
    checkriskscore(context, sleepscore);
  }

  void checfatiguescore() {
    var fatiquelist = [
      fatigue1,
      fatigue2,
      fatigue3,
      fatigue4,
      fatigue5,
      fatigue6,
      fatigue7,
      fatigue8,
      fatigue9
    ];
    var data = fatiquelist.every((val) => val != null);
    if (data) {
      sleepscore = fatiquelist.reduce((ev, ele) => ev + ele);
      double score = sleepscore / 9;
      fatiquescore = score.toStringAsFixed(1);
      notifyListeners();
      //log(score.toStringAsFixed(1));
      //log("Score $sleepscore");
    }
  }

  bool handlevalue(fatiquescore) {
    try {
      var data = double.parse(fatiquescore);
      var sc = data >= 3.9;
      return sc;
    } catch (e) {
      return false;
    }
  }

  dynamic fetchlable({val, type = ""}) {
    if (type == "reverse") {
      try {
        var data = answers.where((r) => r["lable"] == val).first;
        return data["value"];
      } catch (e) {
        return "";
      }
    } else {
      try {
        var data = answers.where((r) => r["value"] == val).first;
        return data["label"];
      } catch (e) {
        return "";
      }
    }
  }

  String? fetchfatigues(context, val) {
    var data = {
      0: fetchlocale(context).fatigueques1,
      1: fetchlocale(context).fatigueques2,
      2: fetchlocale(context).fatigueques3,
      3: fetchlocale(context).fatigueques4,
      4: fetchlocale(context).fatigueques5,
      5: fetchlocale(context).fatigueques6,
      6: fetchlocale(context).fatigueques7,
      7: fetchlocale(context).fatigueques8,
      8: fetchlocale(context).fatigueques9,
    };
    return data[val];
  }

  dynamic fetchfatiguelabel({val, type = ""}) {
    if (type == "reverse") {
      try {
        var data = fatigueanswers.where((r) => r["lable"] == val).first;
        return data["value"];
      } catch (e) {
        return "";
      }
    } else {
      try {
        var data = fatigueanswers.where((r) => r["value"] == val).first;
        return data["label"];
      } catch (e) {
        return "";
      }
    }
  }

  dynamic checkriskscore(context, sleepscore) {
    if (sleepscore >= 0 && sleepscore < 6) {
      risckscore = "😀 ${fetchlocale(context).checkriskscore_keys1}";
    } else if (sleepscore >= 6 && sleepscore < 11) {
      risckscore = "😀 ${fetchlocale(context).checkriskscore_keys2}";
    } else if (sleepscore >= 11 && sleepscore <= 12) {
      risckscore = "🙁 ${fetchlocale(context).checkriskscore_keys3}";
    } else if (sleepscore >= 13 && sleepscore < 16) {
      risckscore = "😣 ${fetchlocale(context).checkriskscore_keys4}";
    } else if (sleepscore >= 16) {
      risckscore = "😨 ${fetchlocale(context).checkriskscore_keys5}";
    } else {
      risckscore = "-";
    }
    return risckscore;
  }

  Color checkcolur() {
    if (sleepscore >= 0 && sleepscore < 6) {
      return const Color(0XFF417504);
    } else if (sleepscore >= 6 && sleepscore < 11) {
      return const Color(0XFF98D357);
    } else if (sleepscore >= 11 && sleepscore <= 12) {
      return const Color(0XFFF6EA51);
    } else if (sleepscore >= 13 && sleepscore < 16) {
      return const Color(0XFFF2B040);
    } else if (sleepscore >= 16) {
      return const Color(0XFFCA051F);
    } else {
      risckscore = "-";
      notifyListeners();
      return const Color(0XFF000000);
      
    }
    
  }

  void resethiv() {
    scores = List.filled(12, 0);
    notifyListeners();
  }

  void resetsleep() {
    sleep1 = 0;
    sleep2 = 0;
    sleep3 = 0;
    sleep4 = 0;
    sleep5 = 0;
    sleep6 = 0;
    sleep7 = 0;
    sleep8 = 0;
    sleepscore = 0;
    risckscore = "Lower Normal";
    sleepdate = DateTime.now();
    notifyListeners();
  }

  void resetfatique() {
    fatigue1 = null;
    fatigue2 = null;
    fatigue3 = null;
    fatigue4 = null;
    fatigue5 = null;
    fatigue6 = null;
    fatigue7 = null;
    fatigue8 = null;
    fatigue9 = null;
    fatiquescore = "";
    fatiguedate = DateTime.now();
    notifyListeners();
  }

  List<FatigueModel> _modellist = [];
  List<FatigueModel> get fatiguelist => _modellist;
  List<SleepModel> _list = [];
  List<SleepModel> get sleeplist => _list;

  List<AdherenceModel> _adherlist = [];
  List<AdherenceModel> get adherlist => _adherlist;

  bool listloading = false;
  Future<void> fetchdata({id, endpoint}) async {
    try {
      listloading = true;
      endpoint == "Question/SleepGetAll" ? _list.clear() : _modellist.clear();
      notifyListeners();
      final res = await postmethod(endpoint: endpoint, body: {"id": id});
      if (res != null) {
        List result = res ?? [];
        if (endpoint == "Question/SleepGetAll") {
          _list = result.map((r) => SleepModel.fromJson(r)).toList();
          chnagesleepdate(
              DateTime.tryParse("${_list[0].createdDate}Z") ?? DateTime.now());
          notifyListeners();
        } else if (endpoint == "Question/HivGetAll") {
          _adherlist = result.map((e) => AdherenceModel.fromJson(e)).toList();
          chnageadherncedate(
              DateTime.tryParse("${_adherlist[0].createdDate}Z") ?? DateTime.now());
          notifyListeners();
        } else {
          _modellist = result.map((t) => FatigueModel.fromJson(t)).toList();
          chnagefatiguedate(
              DateTime.tryParse("${_modellist[0].createdDate}Z") ??
                  DateTime.now());
          notifyListeners();
        }
      }
      listloading = false;
      notifyListeners();
    } catch (e) {
      listloading = false;
      notifyListeners();
    }
  }

  bool saveloading = false;
  Future<void> savedata(context, {payload, endpoint}) async {
    try {
      saveloading = true;
      notifyListeners();
      final res =
          await postmethod(endpoint: endpoint, body: payload, totalres: true);
      // log(payload.toString());
      //log(payload["userId"].toString());
      if (res["status"]) {
        if (endpoint == "Question/SaveSleep") {
          fetchdata(
              id: payload["userId"].toString(),
              endpoint: "Question/SleepGetAll");
          resetsleep();
          Navigator.pop(context);
        } else if (endpoint == "Question/SaveHiv") {
          fetchdata(
              id: payload["userId"].toString(),
              endpoint: "Question/HivGetAll");
          resethiv();
          Navigator.pop(context);
        } else {
          fetchdata(
              id: payload["userId"].toString(),
              endpoint: "Question/FatigueGetAll");
          resetfatique();
          Navigator.pop(context);
        }
      }
      saveloading = false;
      notifyListeners();
    } catch (e) {
      log(e.toString());
      saveloading = false;
      notifyListeners();
    }
  }
}
