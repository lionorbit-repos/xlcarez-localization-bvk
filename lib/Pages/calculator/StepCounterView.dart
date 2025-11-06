// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, file_names
import 'dart:io';
import 'dart:math';
import 'package:XLcarez/env/appexports.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sensors_plus/sensors_plus.dart';

class StepCounterPage extends StatefulWidget {
  const StepCounterPage({super.key});

  @override
  _StepCounterPageState createState() => _StepCounterPageState();
}

class _StepCounterPageState extends State<StepCounterPage> {
  int _currentSessionSteps = 0; // Steps counted in the current session
  int _lastSavedSteps = 0; // Last saved total steps from pedometer
  int _initialSteps = 0; // Stores the initial step count when app starts
  List<int> _stepHistory = []; // Stores previous session step counts
  late StreamSubscription<StepCount> _subscription;
  Timer? _stopTimer;
  final int _minStepThreshold =
      1; // Minimum step threshold to save steps (1 step)
  double _previousAcceleration = 0.0;
  StreamSubscription? _accelerometerSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((callback) {
      Provider.of<StepController>(context, listen: false).getStepsCount();
    });
    intilize();
  }

  void startListeningaccelometer() {
    //print("Accelometer");
    _accelerometerSubscription = accelerometerEventStream().listen((event) {
      double acceleration =
          sqrt(event.x * event.x + event.y * event.y + event.z * event.z);
      double delta = (acceleration - _previousAcceleration).abs();
      //print("a ooppayee $delta");

      if (delta > 2.0) {
        setState(() {
          _currentSessionSteps++;
        });
      }
      _stopTimer = Timer(const Duration(seconds: 3), () {
        // print("Saving Accelometer Steps");
        _onUserStoppedWalking();
      });

      _previousAcceleration = acceleration;
    });
  }

  Future<void> requestActivityPermission() async {
    var status = await Permission.activityRecognition.request();
    if (status.isGranted) {
      _startListening();
    } else if (status.isDenied) {
      requestNotificationPermissions();
    } else if (status.isPermanentlyDenied) {
      //print("Permission Permanently Denied. Open Settings.");
      openAppSettings();
    }
  }

  void intilize() {
    if (Platform.isAndroid) {
      requestActivityPermission();
    } else {
      _startListening();
    }
  }

  void _startListening() {
    try {
      _subscription = Pedometer.stepCountStream.listen((StepCount event) {
        _stopTimer?.cancel(); // Cancel stop timer if user starts walking

        int stepDifference = 0;

        if (_initialSteps == 0) {
          // Set the initial step count when the app starts
          _initialSteps = event.steps;
          _lastSavedSteps = event.steps;
        } else {
          stepDifference = event.steps - _lastSavedSteps;
          //print("Step Difference: $stepDifference");
        }

        // Only count if the step difference is above the minimum threshold
        if (stepDifference > 0 && stepDifference >= _minStepThreshold) {
          setState(() {
            _currentSessionSteps += stepDifference;
          });
        }

        _lastSavedSteps = event.steps; // Update last step count

        // Start a timer to detect when user stops walking (increased to 3 seconds)
        _stopTimer = Timer(const Duration(seconds: 3), () {
          _onUserStoppedWalking();
        });
      });
    } catch (ex) {
      //print("step $ex");
    }
  }

  // void _startListening() {
  //   print("Step Counter");
  //   _subscription = Pedometer.stepCountStream.listen(
  //     (StepCount event) {
  //       _stopTimer?.cancel(); // Cancel stop timer if user starts walking

  //       int stepDifference = 0;

  //       if (_initialSteps == 0) {
  //         // Set the initial step count when the app starts
  //         _initialSteps = event.steps;
  //         _lastSavedSteps = event.steps;
  //       } else {
  //         stepDifference = event.steps - _lastSavedSteps;
  //       }

  //       // Only count if the step difference is above the minimum threshold
  //       if (stepDifference > 0 && stepDifference >= _minStepThreshold) {
  //         setState(() {
  //           _currentSessionSteps += stepDifference;
  //         });
  //       }

  //       _lastSavedSteps = event.steps; // Update last step count

  //       // Start a timer to detect when user stops walking (3 seconds)
  //       _stopTimer = Timer(const Duration(seconds: 3), () {
  //         print("Saving Steps Pedometer");
  //         _onUserStoppedWalking();
  //       });
  //     },
  //     onError: (error) {
  //       print("step error");
  //       startListeningaccelometer(); // Corrected function call
  //     },
  //   );
  // }

  void _onUserStoppedWalking() {
    if (_currentSessionSteps > 0) {
      setState(() {
        //log("Saving steps: $_currentSessionSteps");
        // Save step count and reset for next session
        var weight = Provider.of<Authcontroller>(context, listen: false)
            .weightconteoller
            .text;
        //print("Weight $weight");
        Provider.of<StepController>(context, listen: false)
            .saveStepCount(
                StepCount: _currentSessionSteps.toString(), weight: weight)
            .whenComplete(() {
          if (mounted) {
            Provider.of<StepController>(context, listen: false).getStepsCount();
          }
        });
        _stepHistory.add(_currentSessionSteps); // Save session step count
        _currentSessionSteps = 0; // Reset for the next session
      });
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    _stopTimer?.cancel();
    _accelerometerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StepController>(builder: (context, stepCtrl, child) {
      return GestureDetector(
        onTap: () {
          navigationSlide(context, const Steplist());
        },
        child: dashboardcard(
            url: "assets/calorie.png",
            title: fetchlocale(context).stepcount,
            value: stepCtrl.totalSteps.toString(),
            //footctrl.apisteps!="-"?footctrl.formatNumber(double.parse(footctrl.apisteps)):"",
            extra: ""),
      );
      // return Scaffold(
      //   backgroundColor: Colors.white,
      //   //appBar: AppBar(title: const Text("Step Counter"), elevation: 0.0),
      //   body: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text("Total Steps: ${stepCtrl.totalSteps.toString()}"),
      //         Text(
      //           "Current Steps: $_currentSessionSteps",
      //           style: const TextStyle(
      //               fontSize: 32,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.black),
      //         ),
      //         const SizedBox(height: 20),
      //         // Text(
      //         //   "Previous Sessions: ${_stepHistory.join(', ')}",
      //         //   style:
      //         //       const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      //         // ),
      //       ],
      //     ),
      //   ),
      // );
    });
  }
}
