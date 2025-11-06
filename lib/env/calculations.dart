 import 'dart:math';





String calculateBmi({required userheight,required userweight}) {
 try {
    double height = double.parse(userheight.toString()) / 100;
  double weight = double.parse(userweight.toString());
  final bmi = weight / (height * height);
  return roundStringToDecimals(bmi.toString());
 } catch (e) {
   return "-";
 }
}


int calculateAge({required DateTime dob}) {
  DateTime today = DateTime.now();
  int age = today.year - dob.year;
  if (today.month < dob.month || (today.month == dob.month && today.day < dob.day)) {
    age--;
  }
  return age;
}

String roundStringToDecimals(String valueStr) {
  try {
    double value = double.parse(valueStr);
    double mod = pow(10.0, 2).toDouble();
    double roundedValue = ((value * mod).round().toDouble() / mod);
    return roundedValue.toStringAsFixed(2);
  } catch (e) {
    //print("Error: $e");
    return valueStr; // or handle the error as needed
  }
}

