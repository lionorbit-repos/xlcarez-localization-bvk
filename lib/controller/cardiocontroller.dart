// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';

class ScoreManagementController extends ChangeNotifier{
  var cardio1 = "No";
  void updateCardio1({value}){
    cardio1 = value;
    notifyListeners();
  }

  var cardio2 = "No";
  void updateCardio2({value}){
    cardio2 = value;
    notifyListeners();
  }

  var cardio3;
  void updateCardio3({value}){
    cardio3 = value;
    // if(value=="Yes"){
    //   print(SmokingStatus.smoker.name);
    // }
    // else if(value=="No"){
    //   print(SmokingStatus.nonSmoker.name);
    // }else{
    //   print(SmokingStatus.unspecified.name);
    // }
    notifyListeners();
  }

  var cardio4 = "No";
  void updateCardio4({value}){
    cardio4 = value;
    notifyListeners();
  }

  var cardio5 = "No";
  void updateCardio5({value}){
    cardio5 = value;
    notifyListeners();
  }


  var qus1;
  void updatequs1({value}){
    qus1 = value;
    notifyListeners();
  }

  var qus2;
  void updatequs2({value}){
    qus2 = value;
    notifyListeners();
  }

  var qus3;
  void updatequs3({value}){
    qus3 = value;
    notifyListeners();
  }

  var qus4;
  void updatequs4({value}){
    qus4 = value;
    notifyListeners();
  }

  var qus5;
  void updatequs5({value}){
    qus5 = value;
    notifyListeners();
  }

  var qus6;
  void updatequs6({value}){
    qus6 = value;
    notifyListeners();
  }

  var qus7;
  void updatequs7({value}){
    qus7 = value;
    notifyListeners();
  }

  var qus8;
  void updatequs8({value}){
    qus8 = value;
    notifyListeners();
  }

  var qus9;
  void updatequs9({value}){
    qus9 = value;
    notifyListeners();
  }

  void clearData(){
    cardio1="No";
    cardio2="No";
    cardio3=null;
    cardio4="No";
    cardio5="No";
    qus1=null;
    qus2=null;
    qus3=null;
    qus4=null;
    qus5=null;
    qus6=null;
    qus7=null;
    qus8=null;
    qus9=null;
    notifyListeners();
  }

}