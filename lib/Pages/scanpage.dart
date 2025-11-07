// ignore_for_file: use_build_context_synchronously, use_super_parameters, duplicate_ignore, use_key_in_widget_constructors, library_private_types_in_public_api
import 'dart:math';

import 'package:XLcarez/env/dotedoval.dart';
import 'package:biosensesignal_flutter_sdk/images/image_data.dart'
    as sdk_image_data;
import 'package:biosensesignal_flutter_sdk/session/demographics/sex.dart';
import 'package:biosensesignal_flutter_sdk/session/session_state.dart';
//import 'package:biosensesignal_flutter_sdk/session/smoking_status.dart';
//import 'package:biosensesignal_flutter_sdk/session/session_builder/session_builder.dart';
import 'package:biosensesignal_flutter_sdk/ui/camera_preview_view.dart';
import 'package:XLcarez/env/appexports.dart';
import 'package:focus_detector/focus_detector.dart';

class MeasurementScreen extends StatefulWidget {
  const MeasurementScreen({Key? key}) : super(key: key);

  @override
  State<MeasurementScreen> createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> {
  MeasurementModel? _measurementModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _measurementModel ??= context.read<MeasurementModel>();
  }

  @override
  void deactivate() async {
    debugPrint("DEactive Called");
    await _measurementModel?.terminatese();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    var warning =
        context.select<MeasurementModel, String?>((model) => model.warning);
    var error =
        context.select<MeasurementModel, String?>((model) => model.error);
    var finalResults = context
        .select<MeasurementModel, String?>((model) => model.finalResultsString);
    var showImageValidity = context
        .select<MeasurementModel, bool>((model) => model.showImageValidity);
    var imageValidityString = context
        .select<MeasurementModel, String>((model) => model.imageValidityString);

    if (showImageValidity) {
      Fluttertoast.showToast(msg: fetchtitles(context, imageValidityString));
    }

    if (warning != null) {
      Fluttertoast.showToast(
          msg: warning,
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white);
    }

    if (error != null) {
      showAlert(context, null, error);
    }

    if (finalResults != null) {
      //print(finalResults.toString());
      WidgetsFlutterBinding.ensureInitialized()
          .addPostFrameCallback((timeStamp) {
        // print("Results$finalResults");
        var data = finalResults.toString().split(",");
        final ctrl = Provider.of<MeasurementModel>(context, listen: false);
        if (data.every((k) => k == "null")) {
          Fluttertoast.showToast(msg: fetchlocale(context).failedtocapture);

          ctrl.stopmesureingandreset();
        } else {
          Provider.of<Vitalscontroller>(context, listen: false)
              .putData(data: finalResults)
              .whenComplete(() async {
            await ctrl.terminatese().whenComplete(() {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const RiskScoreView()),
                  (route) => false);
            });
          });
        }
      });
    }

    var sex = context.select<Authcontroller, String?>((model) => model.gender);
    var age = context
        .select<Authcontroller, String?>((model) => model.ageconteoller.text);
    var weight = context.select<Authcontroller, String?>(
        (model) => model.weightconteoller.text);
    var height = context.select<Authcontroller, String?>(
        (model) => model.heightController.text);
    var state = context
        .select<MeasurementModel, SessionState?>((model) => model.sessionState);
    var smoker =
        Provider.of<ScoreManagementController>(context, listen: false).cardio3;
    // print(smoker);
    //print(height.toString());
    // print(sex);
    //print("Session $state");
    // print("Error $error");
    return FocusDetector(
        onFocusLost: () async {
          await _measurementModel?.terminatese();
        },
        onFocusGained: () {
          //print("gain");
          context.read<MeasurementModel>().screenInFocus(true,
              sex: sex == "Male"
                  ? Sex.male
                  : sex == "Female"
                      ? Sex.female
                      : Sex.unspecified,
              height: double.parse(height.toString()),
              age: double.parse(age.toString()),
              weight: double.parse(weight.toString()),
              smoker: smoker == "Yes"
                  ? 1
                  : smoker == "No"
                      ? 2
                      : 0);
        },
        child: MyThemeGradient(
          child: Scaffold(
              //backgroundColor: scaffoldbgcol,
              appBar: Themeappbar(
                title: fetchlocale(context).scanyourface,
                leading: true,
              ),
              body: SafeArea(
                child: Column(children: [
                  Expanded(
                      child: Stack(children: [
                    const _CameraPreview(),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IgnorePointer(
                              child: Visibility(
                                visible: state == SessionState.processing,
                                child: SizedBox(
                                  height: 100,
                                  width:
                                      genratemediaquery(context).size.width / 2,
                                  child: FlutterCarousel(
                                      options: FlutterCarouselOptions(
                                          onScrolled: null,
                                          onPageChanged: null,
                                          pauseAutoPlayOnManualNavigate: false,
                                          pauseAutoPlayOnTouch: false,
                                          pauseAutoPlayInFiniteScroll: false,
                                          keepPage: true,
                                          viewportFraction: 1,
                                          autoPlayAnimationDuration:
                                              const Duration(seconds: 2),
                                          autoPlayInterval:
                                              const Duration(seconds: 1),
                                          autoPlay: true,
                                          showIndicator: false,
                                          enableInfiniteScroll: true
                                          //slideIndicator: CircularWaveSlideIndicator(),
                                          ),
                                      items: [
                                        Image.asset(
                                          "assets/pulse_animate.png",
                                          color: primary,
                                        ),
                                        Image.asset(
                                          "assets/pulse_animate.png",
                                          color: primary,
                                        ),
                                        Image.asset(
                                          "assets/pulse_animate.png",
                                          color: primary,
                                        ),
                                        Image.asset(
                                          "assets/pulse_animate.png",
                                          color: primary,
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            appspace(h: 10),
                            //SizedBox(height: 100,child: Image.asset("assets/ecg.gif")),
                            const _StartStopButton(),
                            // _ImageValidity()
                          ]),
                    )
                  ])),
                ]),
              )),
        ));
  }

  void showAlert(BuildContext context, String? title, String message) {
    // print("Message $message");
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) => MyThemeGradient(
          child: AlertDialog(
            title:
                title != null ? Text(title, style: TxtStls.modeRateStl) : null,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Text(message.toString(),style: TxtStls.stl16),
                Apptextwidget(
                    showarning(int.parse(message.toString().split(":")[1])),
                    style: TxtStls.themestyle12),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // // print(
                  // //     showarning(int.parse(message.toString().split(":")[1])));
                  // if (showarning(int.parse(message.toString().split(":")[1])) ==
                  //     "Concurrent sessions error.") {
                  //   // print("ugyf");
                  //   // final ctrl =
                  //   //     Provider.of<MeasurementModel>(context, listen: false);
                  //   // final auth =
                  //   //     Provider.of<Authcontroller>(context, listen: false);
                  //   // final scorectrl = Provider.of<ScoreManagementController>(
                  //   //     context,
                  //   //     listen: false);
                  //   // ctrl.terminatese().whenComplete(() {
                  //   //   Navigator.pop(context);
                  //   //   ctrl.reset();
                  //   //   var sex = auth.gender;
                  //   //   var age = auth.ageconteoller.text;
                  //   //   var weight = auth.weightconteoller.text;
                  //   //   var height = auth.heightController.text;
                  //   //   var smoker = scorectrl.cardio3;
                  //   //   ctrl.createSession(
                  //   //     sex: sex == "Male"
                  //   //         ? Sex.male
                  //   //         : sex == "Female"
                  //   //             ? Sex.female
                  //   //             : Sex.unspecified,
                  //   //     age: double.parse(age.toString()),
                  //   //     weight: double.parse(weight.toString()),
                  //   //     smoker: smoker == "Yes"
                  //   //         ? SmokingStatus.smoker
                  //   //         : smoker == "No"
                  //   //             ? SmokingStatus.nonSmoker
                  //   //             : SmokingStatus.unspecified,
                  //   //     height: double.parse(height.toString()),
                  //   //   );
                  //   // });
                  // }
                },
                child: Apptextwidget(fetchlocale(context).ok),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _CameraPreview extends StatefulWidget {
  // ignore: use_super_parameters
  const _CameraPreview({Key? key}) : super(key: key);

  @override
  _CameraPreviewState createState() => _CameraPreviewState();
}

class _CameraPreviewState extends State<_CameraPreview> {
  Size? size;

  @override
  Widget build(BuildContext context) {
    var sessionState = context
        .select<MeasurementModel, SessionState?>((model) => model.sessionState);
    debugPrint('sesssion state');
    debugPrint(sessionState?.toString());
    debugPrint(SessionState.values.toString());
    if (sessionState == null || sessionState == SessionState.initializing) {
      return Container();
    }

    return WidgetSize(
        onChange: (size) => setState(() {
              this.size = size;
            }),
        child: const SizedBox(
            width: double.infinity,
            child: AspectRatio(
                aspectRatio: 0.7,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    DashedOvalTimer(
                      centerWidget: CameraPreviewView(),
                    ),
                  ],
                ))));
  }
}

/*
// const CameraPreviewView(),
                    // //Container(decoration: BoxDecoration(image: DecorationImage(image: const AssetImage("assets/facemask.png",),scale:MediaQuery.of(context).size.width>700?0.5:1.0,),color: primary),),
                    // Image.asset(
                    //   'assets/facemask.png',
                    //   scale:
                    //       MediaQuery.of(context).size.width > 700 ? 0.5 : 1.0,
                    // ),
                    //_FaceDetectionView(size: size)
*/

class _FaceDetectionView extends StatefulWidget {
  final Size? size;

  // ignore: use_super_parameters
  const _FaceDetectionView({Key? key, required this.size}) : super(key: key);

  @override
  State<_FaceDetectionView> createState() => _FaceDetectionViewState();
}

class _FaceDetectionViewState extends State<_FaceDetectionView> {
  @override
  Widget build(BuildContext context) {
    var imageInfo = context.select<MeasurementModel, sdk_image_data.ImageData?>(
        (model) => model.imageData);
    if (imageInfo == null) {
      return Container();
    }

    var roi = imageInfo.roi;
    if (roi == null) {
      return Container();
    }

    var devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    var widthFactor =
        widget.size!.width / (imageInfo.imageWidth / devicePixelRatio);
    var heightFactor =
        widget.size!.height / (imageInfo.imageHeight / devicePixelRatio);
    return Positioned(
        left: (roi.left * widthFactor) / devicePixelRatio,
        top: (roi.top * heightFactor) / devicePixelRatio,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: 4, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
            width: (roi.width * widthFactor) / devicePixelRatio,
            height: (roi.height * heightFactor) / devicePixelRatio));
  }
}

class _StartStopButton extends StatefulWidget {
  const _StartStopButton({Key? key}) : super(key: key);

  @override
  State<_StartStopButton> createState() => _StartStopButtonState();
}

class _StartStopButtonState extends State<_StartStopButton> {
  @override
  Widget build(BuildContext context) {
    var state = context
        .select<MeasurementModel, SessionState?>((model) => model.sessionState);
    var opacity =
        (state == SessionState.ready || state == SessionState.processing)
            ? 1.0
            : 0.5;

    return Consumer<MeasurementModel>(builder: (context, mesCtrl, child) {
      return Opacity(
          opacity: opacity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              state == SessionState.processing
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //alignment: Alignment.center,
                      children: [
                        Visibility(
                            visible: mesCtrl.pulserateinstant != null,
                            child: Apptextwidget(
                              "${mesCtrl.pulserateinstant ?? ""} bpm",
                              style: TxtStls.appstyle14,
                            )),
                        appspace(h: 5),
                        Apptextwidget(
                          "${mesCtrl.seconds < 10 ? "0${mesCtrl.seconds}" : mesCtrl.seconds} ${fetchlocale(context).sec}",
                          style: TxtStls.appstyle14,
                        ),
                        appspace(h: 10),
                        // Apptextwidget(
                        //   "Do you Know?",
                        //   style: TxtStls.themestyle16,
                        // ),
                        // SizedBox(
                        //     height: 50,
                        //     width: MediaQuery.of(context).size.width,
                        //     child: RandomTextUpdater()),
                      ],
                    )
                  : const SizedBox(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: fillButton(context,
                    load: false,
                    title: state == SessionState.processing
                        ? fetchlocale(context).stop
                        : fetchlocale(context).start, onTap: () {
                  mesCtrl.startStopButtonClicked(context);
                }),
              ),
            ],
          ));
    });
  }
}

class RandomTextUpdater extends StatefulWidget {
  @override
  _RandomTextUpdaterState createState() => _RandomTextUpdaterState();
}

class _RandomTextUpdaterState extends State<RandomTextUpdater> {
  String _displayText = '';
  final List<String> _textList = [
    "Did you sleep 7-9 hours last night? Consistent sleep supports energy and focus.",
    "Is your bedroom dark and cool? A calm environment improves sleep quality.",
    "Do you avoid screens before bed? Less screen time helps you fall asleep faster.",
    "Are you winding down before bed? A relaxing pre-sleep routine signals it’s time to rest.",
    "Have you had 8 glasses of water today? Staying hydrated keeps your body energized.",
    "Drinking water after waking up? Starting your day with water aids digestion.",
    "Do you hydrate before and after exercise? Proper hydration supports endurance and recovery.",
    "Drinking too many sugary drinks? Water is best for hydration without extra calories.",
    "Are you including fruits and veggies daily? A colorful plate means a nutrient-rich diet.",
    "Have you had enough protein today? Protein helps repair muscles and keeps you full.",
    "Do you eat whole grains? Whole grains provide fiber and longer-lasting energy.",
    "Are you mindful of portion sizes? Balanced portions prevent overeating and support digestion.",
    "Are you limiting sugary snacks? Reducing sugar can improve energy levels and focus.",
    "Did you move for at least 30 minutes today? Regular movement boosts mood and health.",
    "Are you stretching during the day? Stretching can reduce muscle tension and improve flexibility.",
    "Taking breaks to move around? Small movements prevent stiffness and increase energy.",
    "Are you tracking your steps? Setting daily step goals keeps you active and motivated.",
    "Did you do strength exercises this week? Strength training supports muscle and bone health.",
    "Did you take a moment for self-care today? Self-care reduces stress and boosts well-being.",
    "Do you practice deep breathing? Deep breaths calm your mind and reduce anxiety.",
    "Had a positive thought today? Positive thinking can improve your mood and resilience.",
    "Did you disconnect from screens for a while? A break from screens refreshes your focus.",
    "Are you setting aside time to relax? Intentional relaxation improves mental clarity.",
    "Have you taken a break to unwind? Regular breaks prevent burnout and reduce stress.",
    "Did you spend time outdoors? Fresh air and sunlight can improve mood and energy.",
    "Are you prioritizing tasks? Organization helps manage stress and boosts productivity.",
    "Took a moment to breathe deeply today? Slow breathing calms your mind and body.",
    "Practicing gratitude? Reflecting on positives can shift your mindset and reduce stress."
  ];

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateText();
    // Set up a timer to update the text every 10 seconds
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      _updateText();
    });
  }

  void _updateText() {
    final randomIndex = Random().nextInt(_textList.length);
    setState(() {
      _displayText = _textList[randomIndex];
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Apptextwidget(
            _displayText.isEmpty ? 'Loading...' : _displayText,
            style: TxtStls.wstl14,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

// class _ImageValidity extends StatefulWidget {
//   const _ImageValidity({Key? key}) : super(key: key);

//   @override
//   State<_ImageValidity> createState() => _ImageValidityState();
// }

// class _ImageValidityState extends State<_ImageValidity> {
//   @override
//   Widget build(BuildContext context) {
//     var showImageValidity = context
//         .select<MeasurementModel, bool>((model) => model.showImageValidity);
//     var imageValidityString = context
//         .select<MeasurementModel, String>((model) => model.imageValidityString);

//     return Visibility(
//       visible: showImageValidity,
//       child: Container(
//         height: 100,
//           color: const Color(0xFF3D3734),
//           padding: const EdgeInsets.all(5.0),
//           width: 180,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 "Image Validity",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 imageValidityString,
//                 style: const TextStyle(color: Colors.white, fontSize: 15),
//               )
//             ],
//           )),
//     );
//   }
// }

// warningBox(BuildContext context) {
//   // set up the buttons
//   Widget cancelButton = Cflatbtn(
//     title: "No",
//     color: redClr,
//     onTap: () {
//       Navigator.pop(context);
//     },
//   );
//   Widget continueButton = Cflatbtn(
//     title: "Yes",
//     color: greenColor,
//     onTap: () {
//       Provider.of<AuthenticationController>(context, listen: false)
//           .LogOut(context);
//       Provider.of<GeneralProfileController>(context, listen: false).clearData();
//     },
//   );
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     elevation: 10,
//     titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//     contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//     actionsPadding: const EdgeInsets.symmetric(horizontal: 10),
//     title: Text("Logout", style: TxtStls.stl16),
//     content: StatefulBuilder(
//       builder: (BuildContext context, void Function(void Function()) setState) {
//         return Container(
//           width: MediaQuery.of(context).size.width,
//           child: Text(
//             "Are you sure you want to logout ?",
//             style: TxtStls.stl14,
//           ),
//         );
//       },
//     ),
//     actions: [cancelButton, continueButton],
//   );

//   // show the dialog
//   showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

String showarning(warn) {
  //log(warn.toString());
  var warningmap = {
    4: "Your device is in low power mode, please turn it off to proceed further.",
    8: "The device does not meet the minimum OS version requirement.",
    14: "The device's battery level is too low.",
    17: "There is a significant clock skew on the device.",
    19: "Bluetooth is turned off on the device.",
    20: "The application lacks necessary Bluetooth permissions.",
    21: "Location services are turned off on the device.",
    1001: "No camera is available on the device.",
    1002: "The camera could not be opened.",
    1005: "Missing permissions to access the camera.",
    1501: "The image dimensions from the camera are unexpected.",
    2002: "Activation limit for the license has been reached.",
    2003: "Meter attribute usage limit for the license has been reached.",
    2004: "License authentication failed.",
    2007: "The license key provided is invalid.",
    2010: "The license has been revoked.",
    2016: "An internal error occurred with the license code.",
    2017: "The license has expired.",
    2018: "The license has been suspended.",
    2024: "Network issues are preventing license validation.",
    2025: "SSL handshake failed during license validation.",
    2032: "The license key input is empty.",
    2034: "The product ID provided is illegal.",
    2035: "Unable to open the license file for reading.",
    2036: "Monthly usage tracking requires synchronization.",
    2037: "SSL handshake failed due to device date issues.",
    2038: "SSL certificate has expired.",
    2039: "The SDK version does not meet the minimum required version.",
    2042: "Network timeout occurred during license validation.",
    2049: "Monitoring has been disabled.",
    3003: "Misdetection duration has exceeded the allowable limit.",
    3004: "Recent detection rate is invalid.",
    3006: "License activation for measurement failed.",
    3008: "Invalid average detection rate for measurements.",
    3009: "Too many frames are out of order.",
    3500: "Misdetection duration exceeds the allowable limit (warning).",
    3505: "Invalid recent FPS (frames per second) rate.",
    3506: "A frame was misplaced in the measurement.",
    4505: "Blood pressure processing failed.",
    4506: "Measuring with no enabled vital signs.",
    6004: "Illegal start call for the session.",
    6005: "Illegal stop call for the session.",
    7002: "Invalid processing time during initialization.",
    7004: "Mismatch in rotation and orientation during initialization.",
    7005: "The license format is invalid.",
    7006: "SDK loading failed.",
    7007: "Unsupported user weight during initialization.",
    7008: "Unsupported user age during initialization.",
    7009: "Concurrent sessions error.",
    7010: "Missing Polar dependencies.",
    7011: "Missing analytics dependencies.",
    7012: "Unsupported user height during initialization.",
    8003: "Device connection timeout occurred.",
    8004: "Invalid device ID.",
    8005: "Unsupported firmware version on device.",
    8006: "Unsupported device model.",
    8007: "Device connection error.",
    8008: "Device misplacement error.",
    8501: "Device is not properly placed on the body (warning).",
    9001: "Monitoring has been stopped.",
    9500: "Monitoring data gap exceeds the allowable limit."
  };
  //log(warningmap[warn].toString());
  return warningmap[warn] ??
      "something went wrong please contact admin for support";
}
