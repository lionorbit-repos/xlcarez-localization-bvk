// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';

class DiabitiesController extends ChangeNotifier{


  var diabities3 = "Other ethnic group";
  void updateDiabities3({value}){
    diabities3 = value;
    notifyListeners();
  }

  var diabities4;
  void updateDiabities4({value}){
    diabities4 = value;
    notifyListeners();
  }

  var diabities5;
  void updateDiabities5({value}){
    diabities5 = value;
    notifyListeners();
  }


  var diabities7;
  void updateDiabities7({value}){
    diabities7 = value;
    notifyListeners();
  }

  void clearDiabities(){
    diabities3="Other ethnic group";
    diabities4=null;
    diabities5=null;
    diabities7=null;
    notifyListeners();
  }
}