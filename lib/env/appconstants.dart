// ignore_for_file: type_literal_in_constant_pattern, unnecessary_import

import 'dart:io';
import 'dart:math';

import 'package:XLcarez/env/appexports.dart';
import 'package:XLcarez/model/availblitymodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

const logo = "assets/logo.png";
const applogo = "assets/applogo.png";
const regiterlogo = "assets/rejister.jpg";
const loginbg = "assets/login.jpg";
const splashbg = "assets/splash.png";
const bottom1 = "assets/bottom/home.png";
const bottom2 = "assets/bottom/vital.png";
const bottom3 = "assets/bottom/facescan.png";
const bottom4 = "assets/bottom/doctor.png";
const bottom5 = "assets/bottom/family.png";
const bottom6 = "assets/bottom/appointments.png";
const bottom7 = "assets/bottom/appointmentsday.png";
const bottom8 = "assets/bottom/records.png";
const bottom9 = "assets/bottom/profile.png";

const bmiicon = "assets/bmi.png";

const obesityimg = "assets/risk/obesity.png";
const cardiacpng = "assets/risk/cardiac.png";
const diabeticpng = "assets/risk/diabetic.png";
const streess = "assets/risk/fear.png";
const spa = "assets/risk/spa.png";
const redblood = "assets/risk/redblood.png";

const screenimg = "assets/screen.jpg";

const avtharimg = "assets/avthar.png";
//"assets/avthar.jpg";

const waitlistedimg = "assets/Appointmentstatus/waitlisted.png";
const checkinimg = "assets/Appointmentstatus/checkin.png";
const completedimg = "assets/Appointmentstatus/completed.png";
const nodatafound = "assets/norecord.png";

// const baseurl = "https://xlcareztestapi.lionorbit.com/api/";
// const asseturl = "https://xlcareztestapi.lionorbit.com/assets/";

const baseurl = "https://api.xlcarez.com/api/";
const asseturl = "https://api.xlcarez.com/assets/";



final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Color getcolr({col}) {
  var mapcolr = {
    0: card1,
    1: card2,
    2: card3,
    3: card4,
    4: card5,
  };
  return mapcolr[col] ?? modeRate;
}

String checkuserimage({path}){
if(path==null||path==""){
  return avtharimage;
}
else{
  return "${asseturl}Users/$path";
}
}

String checkscreenwidth(double width) {
  // print(width.toString());
  if (width > 800 && width < 1000) {
    return "Medium";
  } else if (width >= 800 && width > 1000) {
    return "Large";
  } else {
    return "Small";
  }
}

String dateformat({format, vale}) {
  //print(vale.toString());
  try {
    return DateFormat(format).format(vale);
  } catch (e) {
    return "";
  }
}

String? validateHeightFeetAndInches(String? feetStr, String? inchesStr) {
  if (feetStr == null || feetStr.isEmpty || inchesStr == null || inchesStr.isEmpty) {
    return 'Please enter both feet and inches';
  }

  final int? feet = int.tryParse(feetStr);
  final int? inches = int.tryParse(inchesStr);

  if (feet == null || inches == null) {
    return 'Feet and inches must be valid numbers';
  }

  if (feet < 0 || inches < 0 || inches >= 12) {
    return 'Inches must be between 0 and 11';
  }

  // Convert to cm
  final int totalInches = (feet * 12) + inches;
  final int heightCm =(totalInches * 2.54).round();

  if (heightCm < 130 || heightCm > 230) {
    return 'Height must be between 130 cm and 230 cm (approx. 4 ft 3 in to 7 ft 7 in)';
  }

  return null; // valid input
}

String fetchvalue(context,{index,icaptel = false}) {
    try {
      final vitalCtrl = Provider.of<Vitalscontroller>(context, listen: false);
      var results = vitalCtrl.vitalsData.toString().split(",");
      //log(results.toString());
      return icaptel
          ? (results[index].toString().capitalize()=="Null"?"-":results[index].toString().capitalize())
          : results[index].toString()=="null"?"-":results[index].toString();
    } catch (e) {
      return "";
    }
  }

dynamic formatprefrdtime(DateTime date, time) {
  // print(date);
  // print(time);
  try {
    return dateformat(
        format: "dd/MM/yyy hh:mm a",
        vale: DateTime(
            date.year,
            date.month,
            date.day,
            int.parse(time.split(":")[0]),
            int.parse(time.split(":")[1].split(" ")[0])));
  } catch (e) {
    return "";
  }
}

List<LinearGaugeRange> fetchranges(val) {
  var data = {
    "Blood Pressure": [
      const LinearGaugeRange(
        startValue: 90,
        endValue: 100.99,
        color: Colors.green, // Normal Range (12-20)
      ),
      const LinearGaugeRange(
        startValue: 101,
        endValue: 129.98,
        color: Colors.orange, // High Range (>20)
      ),
      const LinearGaugeRange(
        startValue: 130,
        endValue: 140,
        color: Colors.red, // Low Range (<12)
      ),
    ],
    "Hemoglobin A1C": [
      const LinearGaugeRange(
        startValue: 0.0,
        endValue: 5.59,
        color: Colors.green, // Normal Range (12-20)
      ),
      const LinearGaugeRange(
        startValue: 5.6,
        endValue: 6.4,
        color: Colors.orange, // High Range (>20)
      ),
      const LinearGaugeRange(
        startValue: 6.4,
        endValue: 8,
        color: Colors.red, // Low Range (<12)
      ),
    ],
    "Stress Level": [
      const LinearGaugeRange(
        startValue: 0,
        endValue: 75,
        color: Colors.green, // Normal Range (12-20)
      ),
      const LinearGaugeRange(
        startValue: 76,
        endValue: 150,
        color: Colors.yellow, // High Range (>20)
      ),
      const LinearGaugeRange(
        startValue: 151,
        endValue: 225,
        color: Colors.orange, // High Range (>20)
      ),
      const LinearGaugeRange(
        startValue: 226,
        endValue: 380,
        color: Colors.red, // Low Range (<12)
      ),
    ],
    "oxygenSaturation": [
      const LinearGaugeRange(
        startValue: 40,
        endValue: 89.99,
        color: Colors.red, // Normal Range (12-20)
      ),
      const LinearGaugeRange(
        startValue: 90,
        endValue: 94.99,
        color: Colors.orange, // High Range (>20)
      ),
      const LinearGaugeRange(
        startValue: 95,
        endValue: 100,
        color: Colors.green, // Low Range (<12)
      ),
    ],
    "Pulse Rate": [
      const LinearGaugeRange(
        startValue: 40,
        endValue: 59.99,
        color: Colors.red, // Normal Range (12-20)
      ),
      const LinearGaugeRange(
        startValue: 60,
        endValue: 100.99,
        color: Colors.green, // High Range (>20)
      ),
      const LinearGaugeRange(
        startValue: 101,
        endValue: 120,
        color: Colors.red, // Low Range (<12)
      ),
    ],
    "Wellness Level": [
      const LinearGaugeRange(
        startValue: 8,
        endValue: 10,
        color: Colors.green, // Normal Range (12-20)
      ),
      const LinearGaugeRange(
        startValue: 5,
        endValue: 7.99,
        color: Colors.yellow, // High Range (>20)
      ),
      const LinearGaugeRange(
        startValue: 1,
        endValue: 4.99,
        color: Colors.red, // Low Range (<12)
      ),
    ],
    "Respiration Rate": [
      const LinearGaugeRange(
        startValue: 12,
        endValue: 20,
        color: Colors.green, // Normal Range (12-20)
      ),
      const LinearGaugeRange(
        startValue: 20,
        endValue: 60,
        color: Colors.red, // High Range (>20)
      ),
      const LinearGaugeRange(
        startValue: 0,
        endValue: 12,
        color: Colors.green, // Low Range (<12)
      ),
    ]
  };
  return data[val] ?? [];
}

List<Color> fetchgradientcol(val) {
  var data = {
    "Pulse Rate": [errorClr, success, success, errorClr],
    "oxygenSaturation": [errorClr, Colors.orange, success],
    "Respiration Rate": [success, Colors.orange, errorClr],
    "Wellness Level": [errorClr, Colors.orange, success],
    "Stress Level": [success, Colors.orange, errorClr],
    "Blood Pressure": [errorClr, success, errorClr],
    "Hemoglobin A1C": [success, Colors.orange, errorClr]
  };
  return data[val] ?? [transparentcol, transparentcol];
}

String formatslottiming(Avaliblity? avi) {
  try {
    return "${dateformat(format: "hh:mm a", vale: DateTime.parse(avi!.startActivity!))} - ${dateformat(format: "hh:mm a", vale: DateTime.parse(avi.endActivity!))}";
  } catch (e) {
    return "";
  }
}

DateTime format(DateTime date) {
  try {
    return DateTime(date.year, date.month, date.day);
  } catch (e) {
    return DateTime.now();
  }
}

String generateTxnId(int length) {
  const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  return List.generate(length, (index) => chars[random.nextInt(chars.length)])
      .join();
}

DateTime? checkdate({date, parsed}) {
  try {
    if (date.contains("/")) {
      var mydata = formatdata(actualtype: "reversedate", value: date);
      var data = DateTime.tryParse(mydata);
      //print("this format $date -  $data");
      return data;
    } else {
      try {
        var data = DateTime.parse(date.toString().replaceAll("Z", ""));
        //print("easily formatted $data");
        return data;
      } catch (ex) {
        var mydata = formatdata(actualtype: "reversedateslash", value: date);
        var data = DateTime.tryParse(mydata);
        //print("this formatslash $date -  $data");
        return data;
      }
    }
  } catch (ex) {
    return null;
  }
}

dynamic formatdata({actualtype, value}) {
  try {
    switch (actualtype) {
      case String:
        return value == null ? "" : value.toString();
      case TextEditingController:
        return TextEditingController.fromValue(
            TextEditingValue(text: value ?? ""));
      case int:
        return int.tryParse(value.toString());
      case double:
        return double.tryParse(value.toString());
      case List:
        return value == null ? [] : value as List;
      case "date":
        return value == null || value == "null" || value == ""
            ? ""
            : DateFormat("dd/MM/yyyy").format(DateTime.parse(value.toString()));
      case "reversedate":
        return value == null || value == "null" || value == ""
            ? ""
            : DateFormat("yyyy-MM-dd").format(DateTime(
                int.parse(value.toString().split("/")[2]),
                int.parse(value.toString().split("/")[1]),
                int.parse(value.toString().split("/")[0])));
      case "reversedateslash":
        return value == null || value == "null" || value == ""
            ? ""
            : DateFormat("yyyy-MM-dd").format(DateTime(
                int.parse(value.toString().split("-")[2]),
                int.parse(value.toString().split("-")[1]),
                int.parse(value.toString().split("-")[0])));
      case "phone":
        return value == null || value == "null" ? "" : value;
      case "24hrs":
        return value == null || value == "null"
            ? ""
            : DateFormat("HH:MM").format(DateTime(
                2024,
                03,
                19,
                int.parse(value.split(":")[0]),
                int.parse(value.split(":")[1].split(" ")[0])));
      case "12hrsper":
        return value == null || value == "null"
            ? ""
            : DateFormat("hh:mm aa").format(DateTime(
                2024,
                03,
                19,
                int.parse(value.split(":")[0]),
                int.parse(value.split(":")[1].split(" ")[0])));
      case "timeformat":
        return value == null || value == "null"
            ? ""
            : DateFormat("HH:mm aa").format(DateTime.parse(value));
      case "Monthname":
        return value == null || value == "null"
            ? ""
            : DateFormat('dd MMM').format(DateTime.parse(value.toString()));
      default:
        return null;
    }
  } catch (e) {
    return null;
  }
}

String webdateformat(TextEditingController dateController1) {
  try {
    if (dateController1.text.isEmpty || dateController1.text == "") {
      return "";
    } else {
      var sharedate = dateController1.text == ""
          ? DateFormat("dd-MM-YYYY").format(DateTime.now())
          : dateController1.text;
      var dateTime = DateFormat('dd-MM-yyyy').parse(sharedate.toString());
      var dateTime1 = DateFormat("yyyy-MM-ddThh:mm:ss.0000").format(dateTime);
      return "${dateTime1}Z";
    }
  } catch (e) {
    return dateController1.text;
  }
}

// jionmeet({hospitalid,aptid}){
//   var jitsiMeet = JitsiMeet();
// var options = JitsiMeetConferenceOptions(room: "https://meet.jit.si/$hospitalid");
// //JitsiMeetConferenceOptions(room: 'https://video.tribandtech.com:8443/XLcarez/$hospitalid/$aptid ');
// jitsiMeet.join(options);
// }
Future<void> checkAndRequestPermissions({hospitalid, aptid}) async {
  // Check if microphone and camera permissions are granted
  PermissionStatus microphoneStatus = await Permission.microphone.status;
  PermissionStatus cameraStatus = await Permission.camera.status;
  if (!microphoneStatus.isGranted) {
    await Permission.microphone.request();
  }
  if (!cameraStatus.isGranted) {
    await Permission.camera.request();
  }
  launchurl(hospitalid: hospitalid, aptid: aptid);
}

Future<void> launchurl({hospitalid, aptid}) async {
  try {
    await launchUrl(
        Uri.parse("https://video.tribandtech.com/XLcarez/$hospitalid/$aptid"));
  } catch (e) {
    Fluttertoast.showToast(msg: "Couldn't connect to meeting");
  }
}

Future<void> commonlauncth({url}) async {
  try {
    await launchUrl(Uri.parse("$url"));
  } catch (e) {
    Fluttertoast.showToast(msg: "Failed to load url");
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

Future<void> requestNotificationPermissions() async {
  // Request iOS permissions
  final IOSFlutterLocalNotificationsPlugin? iosPlugin =
      flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>();
  await iosPlugin?.requestPermissions(
    alert: true,
    badge: true,
    sound: true,
  );
//print("iOS Notification Permissions Granted: $permissionsGranted");
  // Request Android permissions (Android 13+ requires explicit permission)
  if (Platform.isAndroid) {
    if (await Permission.scheduleExactAlarm.isDenied) {
      await Permission.scheduleExactAlarm.request();
    }
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
    if (await Permission.notification.isPermanentlyDenied ||
        await Permission.scheduleExactAlarm.isPermanentlyDenied) {
      //print("⚠️ Permission permanently denied. Open app settings.");
      openAppSettings(); // Open app settings for manual enable
    }
  }
}
