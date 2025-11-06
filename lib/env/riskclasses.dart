
import 'package:XLcarez/env/appexports.dart';

class RiskScorevalues {
  static String calculatehba1c({val}) {
    try {
      var value = double.parse(val);
      if (value < 5.6) {
        return "Normal";
      } else if (value >= 5.6 && value <= 6.4) {
        return "Predaibetesrisk";
      } else if (value > 6.5) {
        return "Daibetesrisk";
      } else {
        return "-";
      }
    } catch (e) {
      return "-";
    }
  }

  static String calculatebp({val}) {
   // print("Bp $val");
    try {
      var value = double.parse(val);
      if (value <= 100) {
        return "Low";
      } else if (value > 100 && value < 130) {
        return "Normal";
      } else if (value >= 130) {
        return "High";
      } else {
        return "-";
      }
    } catch (e) {
      return "-";
    }
  }

  static String calculatebrathingrate({val}) {
    try {
      var value = double.parse(val);
      if (value < 12) {
        return "Low";
      } else if (value >= 12 && value <= 20) {
        return "Normal";
      } else if (value > 20) {
        return "High";
      } else {
        return "-";
      }
    } catch (e) {
      return "-";
    }
  }

  static String calculateheartrate({val}) {
    try {
      var value = double.parse(val);
      if (value < 60) {
        return "Low";
      } else if (value >= 60 && value <= 100) {
        return "Normal";
      } else if (value > 100) {
        return "High";
      } else {
        return "-";
      }
    } catch (e) {
      return "-";
    }
  }

  static String calculatespo2({val}) {
    try {
      var value = double.parse(val);
      if (value < 95) {
        return "Low";
      } else if (value >= 95 && value <= 100) {
        return "Normal";
      } else if (value > 100) {
        return "High";
      } else {
        return "-";
      }
    } catch (e) {
      return "-";
    }
  }

  static String calculateSugar({val}) {
    try {
      var value = double.parse(val);
      if (value < 70) {
        return "Low";
      } else if (value >= 70 && value <= 99) {
        return "Normal";
      } else if (value >= 100 && value <= 125) {
        return "Pre-diabetes";
      } else if (value >= 126) {
        return "Diabetes";
      } else {
        return "-"; // Default background color
      }
    } catch (e) {
      return "-"; // Default background color in case of error
    }
  }

  static String calculateTemperature({val}) {
    try {
      var value = double.parse(val);
      if (value < 95) {
        return "Hypothermia";
      } else if (value >= 95 && value <= 99) {
        return "Normal";
      } else if (value >= 100) {
        return "Fever";
      } else {
        return "-"; // Default background color
      }
    } catch (e) {
      return "-"; // Default background color in case of error
    }
  }

  static String calculateCholesterol({val}) {
    try {
      var value = double.parse(val);
      if (value < 200) {
        return "Low";
      } else if (value >= 200 && value <= 239) {
        return "Medium";
      } else if (value >= 240) {
        return "High";
      } else {
        return "-";
      }
    } catch (e) {
      return "-"; // Default background color in case of error
    }
  }
}

// class Risckscorecolours{
//    static calculatehba1c({val}) {
//    try {
//       var value = double.parse(val);
//     if (value < 5.6) {
//       return Colors.green;
//     } else if (value >= 5.6 && value <= 6.4) {
//       return Colors.orange;
//     } else if(value>6.5) {
//       return Colors.red;
//     }
//     else{
//       return bgClr1;
//     }
//    } catch (e) {
//      return bgClr1;
//    }
//   }
//   static calculateCholesterol({val}) {
//   try {
//     var value = double.parse(val);
//     if (value < 200) {
//       return Colors.green; // Normal cholesterol
//     } else if (value >= 200 && value <= 239) {
//       return Colors.orange; // Borderline high cholesterol
//     } else if (value >= 240) {
//       return Colors.red; // High cholesterol
//     } else {
//       return bgClr1; // Default background color
//     }
//   } catch (e) {
//     return bgClr1; // Default background color in case of error
//   }
// }
//   static calculateTemperature({val}) {
//   try {
//     var value = double.parse(val);
//     if (value < 95) {
//       return Colors.red; // Hypothermia
//     } else if (value >= 95 && value <= 99) {
//       return Colors.orange; // Normal temperature
//     } else if (value >= 100.4) {
//       return Colors.red; // Fever
//     } else {
//       return bgClr1; // Default background color
//     }
//   } catch (e) {
//     return bgClr1; // Default background color in case of error
//   }
// }
//   static calculateSugar({val}) {
//   try {
//     var value = double.parse(val);
//     if (value < 70) {
//       return Colors.green; // Low blood sugar
//     } else if (value >= 70 && value <= 99) {
//       return Colors.orange; // Normal range
//     } else if (value >= 100 && value <= 125) {
//       return Colors.red; // Pre-diabetes range
//     } else if (value >= 126) {
//       return Colors.red; // Diabetes range
//     } else {
//       return bgClr1; // Default background color
//     }
//   } catch (e) {
//     return bgClr1; // Default background color in case of error
//   }
// }
//  static calculatebp({val}){
//    try {
//       var value = double.parse(val);
//     if(value<=100){
//       return Colors.red;
//     }
//     else if(value>100&&value<=130){
//       return Colors.green;
//     }
//     else if(value>130){
//       return Colors.red;
//     }
//     else{
//       return bgClr1;
//     }
//    } catch (e) {
//      return bgClr1;
//    }
//   }
//  static calculatebrathingrate({val}){
//    try {
//       var value = double.parse(val);
//     if(value<12){
//       return Colors.orange;
//     }
//     else if(value>=12&&value<=20){
//       return Colors.green;
//     }
//     else if(value>20){
//       return Colors.red;
//     }
//     else{
//       return bgClr1;
//     }
//    } catch (e) {
//      return bgClr1;
//    }
//   }
//  static calculateheartrate({val}){
//    try {
//       var value = double.parse(val);
//     if(value<60){
//       return Colors.green;
//     }
//     else if(value>=60&&value<=100){
//       return Colors.orangeAccent;
//     }
//     else if(value>100){
//       return Colors.red;
//     }
//     else{
//       return bgClr1;
//     }
//    } catch (e) {
//      return bgClr1;
//    }
//   }
// static   calculatespo2({val}){
//    try {
//       var value = double.parse(val);
//     if(value<95){
//       return Colors.orange;
//     }
//     else if(value>=95&&value<=100){
//       return Colors.green;
//     }
//     else if(value>100){
//       return Colors.red;
//     }
//     else{
//       return bgClr1;
//     }
//    } catch (e) {
//      return bgClr1;
//    }
//   }
//  static rsiccolwellness({val}){
// if(val=="low"){
//   return Colors.red;
// }
// else if(val=="medium"){
//   return Colors.orange;
// }
// else{
//   return Colors.green;
// }
//   }
//   static rsiccolstress({val}){
// if(val=="low"){
//   return Colors.green;
// }
// else if(val=="normal"){
//   return Colors.orange;
// }
// else if(val=="mild"){
//   return Colors.amber;
// }
// else if(val=="high"){
//   return Colors.deepOrange;
// }
// else{
//   return Colors.red;
// }
//   }
// }

///After got input from testing team
class Risckscorecolours {
  static Color calculatehba1c({val}) {
    try {
      var value = double.parse(val);
      if (value < 5.6) {
        return Colors.green; // Low risk (Healthy range)
      } else if (value >= 5.6 && value <= 6.4) {
        return Colors.orange; // Medium risk (Pre-diabetes)
      } else if (value > 6.5) {
        return Colors.red; // High risk (Diabetes)
      } else {
        return bgClr1;
      }
    } catch (e) {
      return bgClr1;
    }
  }

  static Color calculateCholesterol({val}) {
    try {
      var value = double.parse(val);
      if (value < 200) {
        return Colors.green; // Low risk (Healthy cholesterol levels)
      } else if (value >= 200 && value <= 239) {
        return Colors.orange; // Medium risk (Borderline high)
      } else if (value >= 240) {
        return Colors.red; // High risk (High cholesterol)
      } else {
        return bgClr1; // Default background color
      }
    } catch (e) {
      return bgClr1;
    }
  }

  static Color calculateTemperature({val}) {
    try {
      var value = double.parse(val);
      if (value < 95) {
        return Colors.red; // Hypothermia
      } else if (value >= 95 && value <= 99) {
        return Colors.green; // Normal temperature
      } else if (value >= 100 && value < 103) {
        return Colors.orange; // Mild fever
      } else if (value > 103) {
        return Colors.red; // Severe fever
      } else {
        return bgClr1;
      }
    } catch (e) {
      return bgClr1;
    }
  }

  static Color calculateSugar({val}) {
    try {
      var value = double.parse(val);
      if (value < 70) {
        return Colors.red; // Low blood sugar
      } else if (value >= 70 && value <= 99) {
        return Colors.green; // Normal range
      } else if (value >= 100 && value <= 125) {
        return Colors.orange; // Pre-diabetes range
      } else if (value >= 126) {
        return Colors.red; // Diabetes range
      } else {
        return bgClr1; // Default background color
      }
    } catch (e) {
      return bgClr1; // Default background color in case of error
    }
  }

  // static calculatebp({val}) {
  //   try {
  //     var value = double.parse(val);
  //     if (value <= 90) {
  //       return Colors.red; // Hypotension
  //     } else if (value >= 90 && value <= 120) {
  //       return Colors.green; // Normal BP
  //     } else if (value > 120 && value <= 129) {
  //       return Colors.orange; // Elevated BP
  //     } else if (value >= 130) {
  //       return Colors.red; // Hypertension
  //     } else {
  //       return bgClr1;
  //     }
  //   } catch (e) {
  //     return bgClr1;
  //   }
  // }

  static Color calculatebp({val}) {
    //print(val.toString());
    try {
      var value = double.parse(val);
      if (value <= 100) {
        return errorClr;
      } else if (value > 100 && value < 130) {
        return Colors.orange;
      } else if (value >= 130) {
        return errorClr;
      } else {
        return bgClr1;
      }
    } catch (e) {
      return bgClr1;
    }
  }

  static Color calculatebrathingrate({val}) {
    // print(val.toString());
    try {
      var value = double.parse(val);
      if (value < 12) {
        return Colors.orange;
      } else if (value >= 12 && value <= 20) {
        return Colors.green;
      } else if (value > 20) {
        return Colors.red;
      } else {
        return bgClr1;
      }
    } catch (e) {
      return bgClr1;
    }
  }

  static Color calculateheartrate({val}) {
    // print(val.toString());
    try {
      var value = double.parse(val);
      if (value < 60) {
        return Colors.red; // Bradycardia
      } else if (value >= 60 && value <= 100) {
        return Colors.green; // Normal heart rate
      } else if (value > 100) {
        return Colors.red; // Tachycardia
      } else {
        return bgClr1;
      }
    } catch (e) {
      return bgClr1;
    }
  }

  static Color calculatespo2({val}) {
    // print(val.toString());
    try {
      var value = double.parse(val);
      if (value < 90) {
        return Colors.red; // Severe Hypoxia
      } else if (value >= 90 && value < 95) {
        return Colors.orange; // Mild Hypoxia
      } else if (value >= 95 && value <= 100) {
        return Colors.green; // Normal
      } else {
        return bgClr1;
      }
    } catch (e) {
      return bgClr1;
    }
  }

  static MaterialColor rsiccolwellness({val}) {
    var doval = double.tryParse(val) ?? 0;
    if (doval <= 4) {
      return Colors.red;
    } else if (doval >= 5 && doval <= 7) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  static Color rsiccolstress({val}) {
    var doval = double.tryParse(val) ?? 0;
    //print(val + "Stress");
    if (doval <= 5) {
      return Colors.green;
    } else if (doval > 5 && doval <= 15) {
      return success;
    } else if (doval > 15 && doval <= 25) {
      return Colors.deepOrange;
    } else if (doval > 25 && doval >= 35) {
      return errorClr;
    } else {
      return primary;
    }
  }

  static Color rsiccolstressvalue({val}) {
    //print(val.toString());
    if (val == "low"||val=="Low") {
      return const Color(0xFFA3E635);
    } else if (val == "normal"||val=="Normal") {
      return const Color(0xFFFDE047);
    } else if (val == "mild"||val=="Mild") {
      return const Color(0XFFFACC15);
    } else if (val == "high"||val=="High") {
      return const Color(0XFFFB923C);
    } else if (val == "very high"||val=="Very High") {
      return const Color(0XFFF87171);
    } else {
      return Colors.red;
    }
  }
}




/*
stressValue({score}) {
  if (score == "Mild") {
    return 5.0;
  } else if (score == "Low" || score == "Normal") {
    return 15.0;
  } else if (score == "High") {
    return 25.0;
  } else if (score == "Very High") {
    return 35.0;
  } else {
    return 45.0;
  }
}
*/