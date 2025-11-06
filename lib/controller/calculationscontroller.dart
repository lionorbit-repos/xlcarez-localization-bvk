// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:XLcarez/env/appexports.dart';

class CalculationRiskController extends ChangeNotifier {
  var daibetiesriskscore;
  var cardioriskscore;
  var obesityriskscore;
  var anemiariskscore;
  var depressionriskscore;

  bool loading = false;

  Future<void> calculatediabitiesrisk({dson}) async {
    try {
      loading = true;
      notifyListeners();
      final res = await calpostmethod(endpoint: "Calculations/CalculateDiabetes",body: dson,header: headers);
      if(res!=null){
       // log(res.toString());
        daibetiesriskscore = res;
        notifyListeners();
      }
      loading = false;
      notifyListeners();
    } catch (ex) {
      loading = false;
      notifyListeners();
      daibetiesriskscore = "-";
      notifyListeners();
    }
  }

  Future<void> calculateanemiarisk({dson}) async {
    try {
      loading = true;
      notifyListeners();
      final res = await calpostmethod(endpoint: "Calculations/CalculateAnemia",body: dson,header: headers);
      if(res!=null){
        // log(res.toString());
        anemiariskscore = res;
        notifyListeners();
      }
      loading = false;
      notifyListeners();
    } catch (ex) {
      loading = false;
      notifyListeners();
      anemiariskscore = "-";
      notifyListeners();
    }
  }

  Future<void> calculatecardiorisk({dson}) async {
    try {
      loading = true;
      notifyListeners();
      final res = await calpostmethod(endpoint: "Calculations/CalculateCardio",body: dson,header: headers);
      if(res!=null){
        // log(res.toString());
        cardioriskscore = res;
        notifyListeners();
      }
      loading = false;
      notifyListeners();
    } catch (ex) {
      loading = false;
      notifyListeners();
      cardioriskscore = "-";
      notifyListeners();
    }
  }

  Future<void> calculateobesityrisk({dson}) async {
    try {
      loading = true;
      notifyListeners();
      final res = await calpostmethod(endpoint: "Calculations/CalculateObesity",body: dson,header: headers);
      if(res!=null){
        // log(res.toString());
        obesityriskscore = res;
        notifyListeners();
      }
      loading = false;
      notifyListeners();
    } catch (ex) {
      loading = false;
      notifyListeners();
      obesityriskscore = "-";
      notifyListeners();
    }
  }

  Future<void> calculatedepressionrisk({dson}) async {
    try {
      loading = true;
      notifyListeners();
      final res = await calpostmethod(endpoint: "Calculations/CalculateDepressionValues",body: dson,header: headers);
      //log(dson.toString());
      if(res!=null){
         log(res.toString());
        depressionriskscore = res;
        notifyListeners();
      }
      loading = false;
      notifyListeners();
    } catch (ex) {
      loading = false;
      notifyListeners();
      depressionriskscore = "-";
      notifyListeners();
    }
  }

  void reset() {
    daibetiesriskscore = null;
    cardioriskscore = null;
    obesityriskscore = null;
    anemiariskscore = null;
    depressionriskscore = null;
    notifyListeners();
  }
}
