import 'dart:developer';
import 'package:XLcarez/env/appexports.dart';
import 'package:biosensesignal_flutter_sdk/images/image_validity.dart';
import 'package:biosensesignal_flutter_sdk/license/license_details.dart';
import 'package:biosensesignal_flutter_sdk/images/image_data_listener.dart';
import 'package:biosensesignal_flutter_sdk/images/image_data.dart'
    as sdk_image_data;
import 'package:biosensesignal_flutter_sdk/session/demographics/subject_demographic.dart';
import 'package:biosensesignal_flutter_sdk/session/session_builder/face_session_builder.dart';
import 'package:biosensesignal_flutter_sdk/session/session.dart';
//import 'package:biosensesignal_flutter_sdk/session/user_information.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vital_sign_types.dart';
//import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign_ascvd_risk.dart';
// import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign_high_blood_pressure_risk.dart';
// import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign_high_fasting_glucose_risk.dart';
// import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign_high_hemoglobin_a1c_risk.dart';
// import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign_high_total_cholesterol_risk.dart';
// import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign_low_hemoglobin_risk.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign_pulse_rate.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vital_signs_listener.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vital_signs_results.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign.dart';
import 'package:biosensesignal_flutter_sdk/alerts/warning_data.dart';
import 'package:biosensesignal_flutter_sdk/alerts/error_data.dart';
import 'package:biosensesignal_flutter_sdk/license/license_info.dart';
import 'package:biosensesignal_flutter_sdk/session/session_state.dart';
import 'package:biosensesignal_flutter_sdk/session/session_enabled_vital_signs.dart';
import 'package:biosensesignal_flutter_sdk/session/session_info_listener.dart';
import 'package:biosensesignal_flutter_sdk/alerts/alert_codes.dart';
import 'package:biosensesignal_flutter_sdk/health_monitor_exception.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign_blood_pressure.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign_hemoglobin.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign_hemoglobin_a1c.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign_oxygen_saturation.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign_respiration_rate.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign_stress_index.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign_stress_level.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign_wellness_index.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign_wellness_level.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class MeasurementModel extends ChangeNotifier
    implements SessionInfoListener, VitalSignsListener, ImageDataListener {
  final licenseKey = "C6989C-7623C0-4ACAA5-64E87C-A28A34-9B6DF8";
  //"2E539C-65BB9A-4EA68E-D2593C-D8DE78-5FFB13";
  final measurementDuration = 50;
  Session? _session;
  sdk_image_data.ImageData? imageData;
  bool isStopped = false;

  String? error;
  bool consurreterror = false;
  String? warning;
  dynamic pulserateinstant;
  SessionState? sessionState;
  String? finalResultsString;
  String imageValidityString = "";
  bool showImageValidity = false;

  Future<void> screenInFocus(bool focus,
      {required sex,
      required age,
      required weight,
      required smoker,
      required height}) async {
    //log("Focus" + focus.toString());
    if (focus) {
      if (!await _requestCameraPermission()) {
        return;
      } else {
        createSession(
            sex: sex, age: age, weight: weight, smoker: smoker, height: height);
      }

      // if (_session != null) {
      //   //reset();
      //   await _terminateSession().whenComplete(() async {
      //     if (sessionState == SessionState.terminated) {
      //       await createSession(
      //           sex: sex,
      //           age: age,
      //           weight: weight,
      //           smoker: smoker,
      //           height: height);
      //     } else {
      //       print(sessionState?.name ?? "Reinstlization");
      //     }
      //   });
      // } else {
      //   createSession(
      //       sex: sex, age: age, weight: weight, smoker: smoker, height: height);
      // }
    }
  }

  void startStopButtonClicked(context) {
    showImageValidity = false;
    switch (sessionState) {
      case SessionState.ready:
        _startMeasuring();
        break;
      case SessionState.processing:
        _stopMeasuring();
        break;
      default:
        break;
    }
  }

  @override
  void onImageData(sdk_image_data.ImageData imageData) {
    this.imageData = imageData;
    if (imageData.imageValidity != ImageValidity.valid) {
      showImageValidity = true;
      switch (imageData.imageValidity) {
        case ImageValidity.invalidDeviceOrientation:
          imageValidityString = "Invalid Orientation";
          break;
        case ImageValidity.invalidRoi:
          imageValidityString = "Face Not Detected";
          _stopMeasuring().whenComplete(() {
            reset();
          });
          break;
        case ImageValidity.tiltedHead:
          imageValidityString = "Titled Head";
          break;
        case ImageValidity.faceTooFar:
          imageValidityString = "You are Too Far";
          break;
        case ImageValidity.unevenLight:
          imageValidityString = "Uneven Lighting";
          break;
      }
    } else {
      showImageValidity = false;
    }
    notifyListeners();
  }

  void stopmesureingandreset() {
    _stopMeasuring().whenComplete(() {
      reset();
    });
  }

  @override
  void onVitalSign(VitalSign vitalSign) {
    if (vitalSign.type == VitalSignTypes.pulseRate) {
      VitalSignPulseRate pulseRate = vitalSign as VitalSignPulseRate;
      // print("Pulse Rate: ${pulseRate.value}");
      pulserateinstant = pulseRate.value;
      notifyListeners();
    }
  }

  @override
  void onFinalResults(VitalSignsResults finalResults) async {
    var wellnessIndex = (finalResults.getResult(VitalSignTypes.wellnessIndex)
            as VitalSignWellnessIndex?)
        ?.value;
    var wellnessLevel = (finalResults.getResult(VitalSignTypes.wellnessLevel)
            as VitalSignWellnessLevel?)
        ?.value;
    var hemoglobinA1C = (finalResults.getResult(VitalSignTypes.hemoglobinA1C)
            as VitalSignHemoglobinA1C?)
        ?.value;
    var hemoglobin = (finalResults.getResult(VitalSignTypes.hemoglobin)
            as VitalSignHemoglobin?)
        ?.value;
    var pulseRate = (finalResults.getResult(VitalSignTypes.pulseRate)
            as VitalSignPulseRate?)
        ?.value;
    var respirationRate =
        (finalResults.getResult(VitalSignTypes.respirationRate)
                as VitalSignRespirationRate?)
            ?.value;
    var stressLevel = (finalResults.getResult(VitalSignTypes.stressLevel)
            as VitalSignStressLevel?)
        ?.value;
    var stressIndex = (finalResults.getResult(VitalSignTypes.stressIndex)
            as VitalSignStressIndex?)
        ?.value;
    var oxygenSaturation =
        (finalResults.getResult(VitalSignTypes.oxygenSaturation)
                as VitalSignOxygenSaturation?)
            ?.value;
    var bloodPressure = (finalResults.getResult(VitalSignTypes.bloodPressure)
            as VitalSignBloodPressure?)
        ?.value;
    var systolic = (finalResults.getResult(VitalSignTypes.bloodPressure)
            as VitalSignBloodPressure?)
        ?.value
        .systolic;
    var pulserateconfidence = (finalResults.getResult(VitalSignTypes.pulseRate)
            as VitalSignPulseRate?)
        ?.confidence
        ?.level;
    var respirationconfidence =
        (finalResults.getResult(VitalSignTypes.respirationRate)
                as VitalSignRespirationRate?)
            ?.confidence
            ?.level;
    // VitalSign? vitalSign = finalResults.getResult(VitalSignTypes.ascvdRisk);
    // if (vitalSign != null && vitalSign is VitalSignAscvdRisk) {
    //   //VitalSignAscvdRisk ascvdRisk = vitalSign;
    //   // print("ASCVD Risk: ${ascvdRisk.value}");
    // }
    // var ascvdrisk = (finalResults.getResult(VitalSignTypes.ascvdRisk) as VitalSignAscvdRisk?)?.value;
    // var bp = (finalResults.getResult(VitalSignTypes.highBloodPressureRisk) as VitalSignHighBloodPressureRisk?)?.value;
    // var colestrol = (finalResults.getResult(VitalSignTypes.highTotalCholesterolRisk)as VitalSignHighTotalCholesterolRisk?)?.value;
    // var glucoserisk = (finalResults.getResult(VitalSignTypes.highFastingGlucoseRisk) as VitalSignHighFastingGlucoseRisk?)?.value;
    // var hemglobinrisk = (finalResults.getResult(VitalSignTypes.lowHemoglobinRisk)as VitalSignLowHemoglobinRisk?)?.value;
    // var hba1crisk = (finalResults.getResult(VitalSignTypes.highHemoglobinA1CRisk)as VitalSignHighHemoglobinA1CRisk?)?.value;
    //log("HighBp $bp Cholestro $colestrol Glucose $glucoserisk LowHemoglobinrisk $hemglobinrisk HighHba1c $hba1crisk");
    if (isStopped) {
      finalResultsString = null;
    } else {
      HapticFeedback.vibrate();
      finalResultsString =
          "$wellnessIndex,$wellnessLevel,$hemoglobinA1C,$hemoglobin,$pulseRate,$respirationRate,$stressLevel,$stressIndex,$oxygenSaturation,$bloodPressure,$systolic,$pulserateconfidence,$respirationconfidence";
    }
    //reset();
    notifyListeners();
  }

  @override
  void onWarning(WarningData warningData) {
    if (warning != null) {
      return;
    }

    if (warningData.code ==
        AlertCodes.measurementCodeMisdetectionDurationExceedsLimitWarning) {}

    warning = "Warning: ${warningData.code}";
    notifyListeners();
    Future.delayed(const Duration(seconds: 1), () {
      warning = null;
    });
    reset();
  }

  @override
  void onError(ErrorData errorData) {
    // if (errorData.code != 7009) {
    //     error = "Error: ${errorData.code}";
    //     notifyListeners();
    //   }
    error = "Error: ${errorData.code}";
    notifyListeners();
  }

  @override
  void onSessionStateChange(SessionState sessionState) {
    this.sessionState = sessionState;
    switch (sessionState) {
      case SessionState.ready:
        WakelockPlus.enable();
        break;
      case SessionState.terminating:
        WakelockPlus.disable();
        reset();
        break;
      default:
        break;
    }

    notifyListeners();
  }

  @override
  void onEnabledVitalSigns(SessionEnabledVitalSigns enabledVitalSigns) {}

  @override
  void onLicenseInfo(LicenseInfo licenseInfo) {}

  Future<void> terminatese() async {
    await _terminateSession();
  }

  Future<void> createSession(
      {required sex,
      required age,
      required weight,
      required smoker,
      required height}) async {
    try {
      var currentsession = await _session?.getState();
      log("New Session $currentsession");
      SubjectDemographic subjectDemographic = SubjectDemographic(
          sex: sex,
          age: age,
          weight: weight);
      if (consurreterror) {
        log("Concurrent Error status $consurreterror");
        await _terminateSession().whenComplete(() {});
      } else {
        if (currentsession == null ||
            currentsession == SessionState.terminated) {
          log("User Information {Gender:$sex} {Age:$age} {Weight:$weight} {Height:$height} {Smoker:$smoker}");
          _session = await FaceSessionBuilder()
              .withSubjectDemographic(subjectDemographic)
              .withImageDataListener(this)
              .withVitalSignsListener(this)
              .withSessionInfoListener(this)
              .build(LicenseDetails(licenseKey));
        }
      }
    } on HealthMonitorException catch (e) {
      log(e.code.toString());
      if (e.code != 7009) {
        reset();
        error = "Error: ${e.code}";
      } else {
        consurreterror = true;
        notifyListeners();
      }
    }
  }

  Future checksesstion() async {
    var session = sessionState;
   // print("Check Previous Session Active or not $session");
    if (session != null) {
      await terminatese();
    }
  }

  Future<void> _startMeasuring() async {
    log(imageValidityString);
    try {
      reset();
      await _session?.start(measurementDuration);
      startTimer();
      dashstartTimer();
      isStopped = false;
      notifyListeners();
    } on HealthMonitorException catch (e) {
      if (e.code != 7009) {
        error = "Error: ${e.code}";
        notifyListeners();
      }
      // error = "Error: ${e.code}";
    }
  }

  final int dashCount = 50; // 50 dashes for each second
  List<Color> dashColors = [];
  Timer? dashtimer;
  int currentDash = 0;
  void init() {
    dashColors = List<Color>.filled(dashCount, scaffoldbgcol);
    notifyListeners();
  }

  void dashstartTimer() {
    dashColors = List<Color>.filled(dashCount, scaffoldbgcol);
    currentDash = 0;
    notifyListeners();
    dashtimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentDash < dashCount) {
        dashColors[currentDash] = primary;
        currentDash++;
        notifyListeners();
      } else {
        dashtimer?.cancel(); // Stop the timer after 50 seconds
      }
    });
  }

  void canceltimer() {
    dashtimer?.cancel();
    init();
    notifyListeners();
  }

  Future<void> _stopMeasuring() async {
    try {
      await _session?.stop();
      stopTimer();
      canceltimer();
      isStopped = true;
      reset();
    } on HealthMonitorException catch (e) {
      reset();
      error = "Error: ${e.code}";
    }
  }

  Future<void> _terminateSession() async {
    await _session?.terminate();
    //log("Session check ${_session.toString()}");
  }

  int seconds = 50;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
      } else {
        timer.cancel();
      }
      notifyListeners();
    });
  }

  void stopTimer() {
    seconds = 50;
    timer?.cancel();
    notifyListeners();
  }

  void reset() {
    error = null;
    consurreterror = false;
    warning = null;
    finalResultsString = null;
    seconds = 50;
    pulserateinstant = null;
    init();
    notifyListeners();
  }

  Future<bool> _requestCameraPermission() async {
    PermissionStatus result;
    result = await Permission.camera.request();
    return result.isGranted;
  }
}
