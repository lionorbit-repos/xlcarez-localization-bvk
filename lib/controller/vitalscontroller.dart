// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:XLcarez/env/appexports.dart';

class Vitalscontroller extends ChangeNotifier {
  bool saveload = false;
  bool risksaveload = false;
  var riskvalue = "Diabetic";
  void chnagerisckscore(val) {
    riskvalue = val;
    notifyListeners();
  }

  var headvalue = "Vitals";
  void chnageheadvalue(val) {
    headvalue = val;
    notifyListeners();
  }
   List<UploadModel> _uploadlist =[];
  List<UploadModel> get uploadlist => _uploadlist;

bool uploadloading = false;
  Future<void> healthme()async{
try {
  uploadloading=true;
  _uploadlist.clear();
  notifyListeners();
  final response = await postmethod(endpoint: "User/GetAllUploadedFiles",body: {});
  if(response!=null){
    List list = response??[];
    _uploadlist =  list.map((e)=>UploadModel.fromJson(e)).toList();
    notifyListeners();
  }
  uploadloading = false;
  notifyListeners();
} catch (e) {
 uploadloading=false;
 notifyListeners(); 
}
  }

  Future<void> savevitals({vjson}) async {
    try {
      saveload = true;
      notifyListeners();
      final res = await postmethod(endpoint: "Vitals/Save", body: vjson);
      if (res != null) {
        //log(res.toString());
      }
      saveload = false;
      notifyListeners();
    } catch (e) {
      saveload = false;
      notifyListeners();
    }
  }

  bool questionsaveload = false;

  Future<void> questionaresave({qjson})async{
    try {
      questionsaveload=true;
      notifyListeners();
      final res = await postmethod(endpoint: "Question/Save",body: qjson);
      if(res!=null){
        log(res.toString());
      }
      questionsaveload=false;
      notifyListeners();
    } catch (e) {
      questionsaveload=true;
      notifyListeners();
    }
  }

  DateTime datetime = DateTime.now();

  List<Vitalmodel> getallvitals = [];
  bool getallvitalsload = false;
  Future<void> getallvitalslist({id}) async {
    try {
      log(id.toString());
      getallvitalsload = true;
      getallvitals.clear();
      notifyListeners();
      final res = await postmethod(endpoint: "Vitals/GetAllVitalsByUserId", body: {"id": id});
      if (res != null) {
        List lis = res;
        getallvitals = lis.map((u) => Vitalmodel.fromJson(u)).toList();
        chnagedate(DateTime.tryParse("${getallvitals[0].createdDate}Z")??DateTime.now());
        //getallvitals = getallvitals.where((e)=>checknull(e.wellnessIndex)&&checknull(e.wellnessLevel)&&checknull(e.stressIndex)&&checknull(e.stressLevel)&&checknull(e.hemoglobinA1C)&&checknull(e.hemoglobin)&&checknull(e.pulseRate)&&checknull(e.pulselevel)&&checknull(e.bloodPressure)&&checknull(e.respirationRate)&&checknull(e.oxygenSaturation)).toList();
        //log(getallvitals.length.toString());
        notifyListeners();
      }
      getallvitalsload = false;
      notifyListeners();
    } catch (e) {
      getallvitalsload = false;
      notifyListeners();
    }
  }

  bool checknull(val){
    //log(val.toString());
    try {
      return val!="null";
    } catch (e) {
      return true;
    }
  }

  Future<void> savevrisk({vjson}) async {
    try {
      risksaveload = true;
      notifyListeners();
      final res = await postmethod(endpoint: "UserRisk/Save", body: vjson);
      //log(vjson.toString());
      if (res != null) {
        // log(res.toString());
      }
      risksaveload = false;
      notifyListeners();
    } catch (e) {
      risksaveload = false;
      notifyListeners();
    }
  }

  var lastestviatlscore;
  bool latetsetvitalload = false;
  Future<void> getlatesvitalscore({id}) async {
    try {
      lastestviatlscore=null;
      latetsetvitalload = true;
      notifyListeners();
      final res =
          await postmethod(endpoint: "UserRisk/GetLatest", body: {"id": id});
      if (res != null) {
        // log(res.toString());
        lastestviatlscore = res;
        notifyListeners();
      }
      latetsetvitalload = false;
      notifyListeners();
    } catch (e) {
      latetsetvitalload = false;
      notifyListeners();
    }
  }

  dynamic ftechvalue(value) {
    if (value == "Diabetic") {
      return lastestviatlscore?["diabetes"] ?? "0";
    } else if (value == "Obesity") {
      return lastestviatlscore?["obesity"] ?? "0";
    } else {
      return lastestviatlscore?["cardio"] ?? "0";
    }
  }

  void chnagedate(DateTime date){
    try {
      datetime = date;
    notifyListeners();
    } catch (e) {
      datetime = DateTime.now();
      notifyListeners();
    }
  }

  // ftchincator() {
  //   if (riskvalue == "Diabetic") {
  //     return indicator(
  //         val: lastestviatlscore?["diabetesLevel"]??"-",
  //         col: diabitesRiskScoreColor(
  //             score: double.tryParse(ftechvalue(riskvalue)) ?? 0));
  //   } else if (riskvalue == "Cardiac") {
  //     return indicator(
  //         val:checkcardioscore(lastestviatlscore?["cardioLevel"]??"-"),
  //         col: cardioRetunColor(
  //             score: double.tryParse(ftechvalue(riskvalue)) ?? 0));
  //   }
  //   else{
  //   return  indicator(
  //         val:
  //            lastestviatlscore?["obesityLevel"]??"-",
  //         col: obesityRetunColor(
  //             score: double.tryParse(ftechvalue(riskvalue)) ?? 0));
  //   }
  // }

  Widget ftchincator(context) {
    if (riskvalue == "Diabetic") {
      return indicator(
          val: fetchrisklevel(context, lastestviatlscore?["diabetesLevel"]??"-"),
          col: diabitesRiskScoreColor(
              score: double.tryParse(ftechvalue(riskvalue)) ?? 0));
    } else if (riskvalue == "Cardiac") {
      return indicator(
          val:
             fetchrisklevel(context, lastestviatlscore?["cardioLevel"]??"-"),
          col: cardioRetunColor(
              score: double.tryParse(ftechvalue(riskvalue)) ?? 0));
    }
    else{
    return  indicator(
          val:
             fetchrisklevel(context, lastestviatlscore?["obesityLevel"]??"-"),
          col: obesityRetunColor(
              score: double.tryParse(ftechvalue(riskvalue)) ?? 0));
    }
  }

  double fetchmeter(val) {
    if (val == "Diabetic" || val == "Obesity") {
      return 60.0;
    } else {
      return 40.0;
    }
  }
  var _vitalsdata;

  dynamic get vitalsData => _vitalsdata;

  dynamic checkcardioscore(val){
    if(val!="-"){
     return val =="Established Cardiovascular Disease"?"Cardiovascular Disease":val;
    }
    else{
      return "-";
    }
  }

  Future<void> putData({data}) async {
    _vitalsdata = data;
    notifyListeners();
  }

  TextEditingController heightcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  TextEditingController bmicontroller = TextEditingController();
  TextEditingController respirationrate = TextEditingController();
  TextEditingController bloodpressuresystolic = TextEditingController();
  TextEditingController bloodpressurediastolic= TextEditingController();
  TextEditingController pulserate = TextEditingController();
  TextEditingController temprature = TextEditingController();
  TextEditingController cholestral = TextEditingController();
  TextEditingController sugar = TextEditingController();
  TextEditingController spo2 = TextEditingController();
  void clearmanuldata() {
    respirationrate.clear();
    bloodpressurediastolic.clear();
    bloodpressuresystolic.clear();
    pulserate.clear();
    spo2.clear();
    temprature.clear();
    cholestral.clear();
    sugar.clear();
    datetime = DateTime.now();
    notifyListeners();
  }

  void clearData() {
    riskvalue = "Diabetic";
    _vitalsdata = null;
    notifyListeners();
  }
}
