// // ignore_for_file: prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, prefer_final_fields

// import 'dart:developer';

// import 'package:XLcarez/env/appexports.dart';
// import 'package:intl/intl.dart';
// import 'package:pedometer/pedometer.dart';
// import 'package:permission_handler/permission_handler.dart';

// class FootstepController extends ChangeNotifier {
//   String _status = '?',
//       _steps = '?',
//       _kms = '?',
//       _kcal = "0.0";
//   late Stream<StepCount> _stepCountStream;
//   late Stream<PedestrianStatus> _pedestrianStatusStream;
//   int _baselineSteps = 0;
//   int _currentSteps = 0;
//   get steps => _steps;
//   get apisteps => _currentSteps;
//   //get webapisteps => _apisteps;
//   get status => _status;
//   get kms => _kms;
//   get kcal => _kcal;

//   // Function to calculate calories burned from steps
//   double calculateCaloriesFromSteps(int steps, double weightInKg) {
//     double stepLengthMeters = 0.762;
//     double distanceKilometers =
//         steps * stepLengthMeters / 1000; // Convert meters to kilometers
//     double metValue = 3.5;
//     double caloriesBurnedPerKilometer = metValue * weightInKg * 3.5 / 200 * 60;
//     double totalCaloriesBurned =
//         caloriesBurnedPerKilometer * distanceKilometers;
//     return totalCaloriesBurned / 1000;
//   }

//   // Future<void> _loadLastSession() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   _baselineSteps = prefs.getInt('baselineSteps') ?? 0;
//   //   notifyListeners();
//   // }

//   // Future<void> checkForDailyReset() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   String lastResetDate = prefs.getString('lastResetDate') ?? "";
//   //   String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

//   //   if (lastResetDate != today) {
//   //     // 🟢 Store the last known step count as the new baseline
//   //     int lastSteps = prefs.getInt('latestStepCount') ?? 0;
//   //     await prefs.setInt('baselineSteps', lastSteps);
//   //     await prefs.setString('lastResetDate', today);
//   //     _baselineSteps = lastSteps;
//   //     notifyListeners();
//   //     //print("[Daily Reset] Steps reset at midnight!");
//   //   }
//   // }

//   ///convertsteps to km
//   double stepsToKilometers(int steps) {
//     double stepLengthMeters = 0.762;
//     double distanceMeters = steps * stepLengthMeters;
//     double distanceKilometers =
//         distanceMeters / 1000; // 1 kilometer = 1000 meters
//     return distanceKilometers;
//   }

//   /// Permisson Metod
//   Future<void> checkAndRequestPermissions(Authcontroller auth) async {
//     // Check if physicalactivity and camera permissions are granted
//     PermissionStatus status = await Permission.activityRecognition.status;

//     if (!status.isGranted) {
//       await Permission.activityRecognition.request();
//     }
//     initialize(auth);
//   }

//   /// Intilize Pedometer

//   // void onStepCount({required StepCount event, required Authcontroller auth}) {
//   //   log("stepcount started");
//   //   _steps = event.steps.toString();
//   //   _kms = stepsToKilometers(event.steps).toStringAsFixed(2);
//   //   notifyListeners();
//   //   // log(steps.toString());
//   //   log("stepcount ended");
//   // }

//   // Future<void> onStepCount({required StepCount event, required Authcontroller auth}) async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();

//   //   int lastBaseline = prefs.getInt('baselineSteps') ?? event.steps;

//   //   // 🟢 Adjust baseline if step count is lower (phone restart)
//   //   if (event.steps < lastBaseline) {
//   //     _baselineSteps = event.steps;
//   //     prefs.setInt('baselineSteps', _baselineSteps);
//   //   } else {
//   //     _baselineSteps = lastBaseline;
//   //   }

//   //   // 🟢 Calculate steps taken today
//   //   _currentSteps = event.steps - _baselineSteps;

//   //   // 🟢 Save the latest step count to avoid resets
//   //   prefs.setInt('latestStepCount', event.steps);

//   //   notifyListeners();

//   //   //print("Steps today: $_currentSteps");
//   // }

//   void onPedestrianStatusChanged(
//       {required PedestrianStatus event, required Authcontroller auth}) {
//     try {
//       log("status chnaged started");
//       _status = event.status;
//       notifyListeners();
//       if (event.status == "stopped") {
//         // if (_steps != "-" && _steps != "?") {
//         //   var s = double.tryParse(_steps) ??
//         //       0.0 - (double.tryParse(_apisteps) ?? 0.0);
//         //   //var calintake;
//         //   // try {
//         //   //   calintake = calculateCaloriesFromSteps(
//         //   //           s.round(), double.parse(auth.userData?["weight"]))
//         //   //       .toStringAsFixed(2);
//         //   // } catch (e) {
//         //   //   calintake = "0.0";
//         //   // }
//         //   var tracksteps;
//         //   if (footsteplist.isNotEmpty) {
//         //     log("not empty");
//         //     var stepslast =
//         //         double.tryParse(footsteplist[0]["stepCount"].toString()) ?? 0.0;
//         //     tracksteps = ((stepslast - double.parse(steps.toString())).abs());
//         //     tracksteps = (double.parse(steps.toString())-double.parse(tracksteps.toString())).abs().toStringAsFixed(2);
//         //   } else {
//         //     tracksteps = s.toStringAsFixed(2);
//         //   }

//           var ojsn = {
//             "id": 0,
//             "userId": auth.userData?["userId"],
//             "calorieIntake": caloreies(steps: 
//                     double.parse(_currentSteps.toString()).round(), weight:  auth.userData?["weight"]),
//             "stepCount": _currentSteps.toString()
//           };
//           if (_currentSteps > 0) {
//             // log(event.status+"Pedstrian Status");
//             // log(steps.toString());
//             // log(tracksteps.toString()+"Track Steps");
//             // log(apisteps.toString()+"Api steps");
//             // log(footsteplist.isNotEmpty?footsteplist.first.toString():"empty");
//              log(ojsn.toString());
//             if (auth.userData?['userId'] != null) {
//               synstepstoapi(ojsn: ojsn).whenComplete(() {
//                 getallsteps(id: auth.userData?["userId"]);
//               });
//             }
//           }
//           else{
//             log("stop");
//           }
//         }
//       }
//     catch (e) {
//       log("err $e");
//     }
//   }

  
//   caloreies({weight,steps}){
//      try {
//       return calculateCaloriesFromSteps(
//                     steps, double.parse(weight))
//                 .toStringAsFixed(2);
//           } catch (e) {
//             return  "0.0";
//           }
//   }
  

//   Future<void> synstepstoapi({ojsn}) async {
//     try {
//       await postmethod(endpoint: "Pedometer/Save", body: ojsn);
//     } catch (e) {
//       log("error Pedometer $e");
//     }
//   }

//   String formatNumber(double number) {
//     //log(number.toString());
//     if (number >= 1e7) {
//       // Convert to crores
//       return "${(number / 1e7).toStringAsFixed(2)} Cr";
//     } else if (number >= 1e5) {
//       // Convert to lakhs
//       return "${(number / 1e5).toStringAsFixed(2)} L";
//     } else if (number >= 1e3) {
//       // Convert to thousands
//       return "${(number / 1e3).toStringAsFixed(2)} K";
//     } else {
//       // Less than 1,000
//       return number.toStringAsFixed(2);
//     }
//   }

//   List _footstepslist = [];
//   List get footsteplist => _footstepslist;

//   bool stepsload = false;
//   getallsteps({id}) async {
//     try {
//       stepsload = true;
//       notifyListeners();
//       final response = await postmethod(
//           endpoint: "Pedometer/GetAllByUserId", body: {"id": id});
//       if (response != null) {
//         List list = response;
//         if (list.isNotEmpty) {
//           log("Before Step ${list.length}");
//           log(list.map((e)=>e.toString()).toList().toString());
//           final Set<String> uniqueKeys = {};
//           final List uniqueList = list.where((item) {
//             final key = '${item["stepCount"]}-${item["calorieIntake"]}';
//             return uniqueKeys
//                 .add(key); // Adds to the set and checks for uniqueness
//           }).toList();

//           // Output the result
//           // log("After Step ${uniqueList.length}");
//           // log(uniqueList.map((e)=>{"Id:${e["id"]}"  "Uid:${e["userId"]}"  "Cal:${e["calorieIntake"]}"  "Step:${e["stepCount"]}"}).toList().toString());
//           // final mapuser = <String?>{};
//           // final uniquelist = list.where((h) => mapuser.add(h["stepCount"])).toList();
//           //  List uniqueData =[];
//           //  uniqueData = uniqueData.where((e)=>list.every((t){
//           //   return t['stepCount'] != e["stepCount"]&&t["calorieIntake"]!=e["calorieIntake"];
//           //  })).toList();
//           //log("Unique${uniqueList.length}");
//           double ssum = 0.0;
//           double calsum = 0.0;
//           for (var val in uniqueList) {
//             var stepvalue = double.parse(val["stepCount"]);
//             var calvalue = double.parse(val["calorieIntake"]);
//             ssum = ssum + stepvalue;
//             calsum = calsum + calvalue;
//           }
//           _kcal = calsum.abs().toStringAsFixed(2);
//           _footstepslist = uniqueList;
//           notifyListeners();
//         } else {
//           _kcal = "0.0";
//         }
//       }
//       stepsload = false;
//       notifyListeners();
//     } catch (e) {
//       // log(e.toString());
//       stepsload = false;
//       notifyListeners();
//     }
//   }

//   void onPedestrianStatusError(error) {
//     _status = 'Pedestrian Status not available';
//     notifyListeners();
//   }

//   void onStepCountError(error) {
//     _steps = '-';
//     notifyListeners();
//   }

//    Future<void> initialize(Authcontroller auth) async {
//     // await checkForDailyReset();
//     // await _loadLastSession(); // Load previous step session
//     initPlatformtrackState(auth);
//   }

//   void initPlatformtrackState(Authcontroller auth) {
//     _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
//     _pedestrianStatusStream
//         .listen((p) => onPedestrianStatusChanged(auth: auth, event: p))
//         .onError(onPedestrianStatusError);
//     _stepCountStream = Pedometer.stepCountStream;
//     _stepCountStream
//         .listen((h) => onStepCount(event: h, auth: auth))
//         .onError(onStepCountError);
//   }
// }
