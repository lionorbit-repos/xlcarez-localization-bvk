// ignore_for_file: use_build_context_synchronously

import 'package:XLcarez/env/appexports.dart';

class RiskScoreView extends StatefulWidget {
  const RiskScoreView({super.key});

  @override
  State<RiskScoreView> createState() => _RiskScoreViewState();
}

class _RiskScoreViewState extends State<RiskScoreView> {
  @override
  void initState() {
    final riskcal =
        Provider.of<CalculationRiskController>(context, listen: false);
    final scoreCtrl =
        Provider.of<ScoreManagementController>(context, listen: false);
    final generalCtrl = Provider.of<Authcontroller>(context, listen: false);
    final diabitiesCtrl =
        Provider.of<DiabitiesController>(context, listen: false);
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      var age = int.tryParse(generalCtrl.ageconteoller.text.toString()) ?? 0;
      var bmi = double.parse(calculateBmi(
          userheight: generalCtrl.heightController.text,
          userweight: generalCtrl.weightconteoller.text));
      if (!generalCtrl.questionnairecardioskip) {
        riskcal.calculateanemiarisk(dson: {
          "age": age,
          "gender": generalCtrl.gender,
          "smoke": scoreCtrl.cardio3,
          "hemoglobinScore": fetchvalue(3)
        });
        riskcal.calculatecardiorisk(dson: {
          "gender": generalCtrl.gender,
          "smoker": scoreCtrl.cardio3,
          "age": age,
          "bmi": bmi,
          "sbp": int.tryParse(fetchvalue(9).toString().split('/')[0])
        });
      }
      if (!generalCtrl.questionnairedaibeskip) {
        riskcal.calculatediabitiesrisk(dson: {
          "age": age,
          "gender": generalCtrl.gender,
          "background": diabitiesCtrl.diabities3,
          "diabetes": diabitiesCtrl.diabities4,
          "circumference": diabitiesCtrl.diabities5,
          "bmi": bmi,
          "history": diabitiesCtrl.diabities7
        });
      }
      if (!generalCtrl.questionnairecmentalskip) {
        riskcal.calculatedepressionrisk(dson: [
          scoreCtrl.qus1,
          scoreCtrl.qus2,
          scoreCtrl.qus3,
          scoreCtrl.qus4,
          scoreCtrl.qus5,
          scoreCtrl.qus6,
          scoreCtrl.qus7,
          scoreCtrl.qus8,
          scoreCtrl.qus9
        ]);
      }

      riskcal.calculateobesityrisk(dson: {"userbmi": bmi, "age": age});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyThemeGradient(
      child: Consumer5<Vitalscontroller, ScoreManagementController,
              Authcontroller, DiabitiesController, CalculationRiskController>(
          builder: (context, vitalCtrl, scoreCtrl, generalCtrl, diabitiesCtrl,
              calctrl, child) {
        return Scaffold(
            //backgroundColor: bgClr1,
            appBar: AppBar(
              title: Apptextwidget(fetchlocale(context).riskscore,
                  style: TxtStls.wstl16),
              backgroundColor: transparentcol,
              elevation: 0.0,
              scrolledUnderElevation: 0.0,
              centerTitle: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                      height: 50, width: 50, child: Image.asset(applogo)),
                )
              ],
            ),
            body: calctrl.loading
                ? loader()
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    // margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    height: size.height,
                    width: size.width,
                    //color: bgClr1,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            surfaceTintColor: const Color(0xFFFFECC8),
                            color: const Color(0xFFFFECC8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side:
                                    const BorderSide(color: Color(0xFFF3F3F3))),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  const Icon(Icons.warning,
                                      color: Color(0xFFCF5300)),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Flexible(
                                      child: Apptextwidget(
                                    fetchlocale(context).thisissoftwareai,
                                    style: TxtStls.stl13,
                                  ))
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          generalCtrl.questionnairedaibeskip
                              ? const SizedBox.shrink()
                              : diabitiesCard(
                                  image: diabeticpng,
                                  header:
                                      fetchlocale(context).diabetesriskscoree,
                                  score: calctrl.daibetiesriskscore ?? 0),
                          const SizedBox(height: 15),
                          generalCtrl.questionnairecardioskip
                              ? const SizedBox.shrink()
                              : cardioCard(
                                  image: cardiacpng,
                                  header:
                                      fetchlocale(context).cardiovascularrisk,
                                  score: calctrl.cardioriskscore ?? 0),
                          const SizedBox(height: 15),
                          vitalCtrl.vitalsData != null
                              ? stressCard(
                                  image: streess,
                                  header: fetchlocale(context).stresslevel,
                                  val: fetchvalue(7).toString(),
                                  score: fetchvalue(6).toString().capitalize())
                              : const SizedBox.shrink(),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: bmiCard(
                                val: roundStringToDecimals(calculateBmi(
                                        userheight:
                                            generalCtrl.heightController.text,
                                        userweight:
                                            generalCtrl.weightconteoller.text)
                                    .toString()),
                                image: obesityimg,
                                header: fetchlocale(context).obsitygradingbmi,
                                score: calctrl.obesityriskscore),
                          ),
                          Visibility(
                            visible:
                                generalCtrl.questionnairecmentalskip != true,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: depressionCard(
                                  image: spa,
                                  header: fetchlocale(context).depressionscore,
                                  score: calctrl.depressionriskscore ?? 0),
                            ),
                          ),
                          Visibility(
                            visible:
                                generalCtrl.questionnairecardioskip != true &&
                                    calctrl.anemiariskscore != null,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: anemiaGradeCard(
                                  image: redblood,
                                  header: fetchlocale(context).animiagrading,
                                  score: fetchlevels(
                                    context, calctrl.anemiariskscore)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            bottomNavigationBar: bottomContainer(
              child: fillButton(context,
                  load: false,
                  title: fetchlocale(context).continuee, onTap: () {
                navigationSlide(context, const Reportnew());
              }),
            ));
      }),
    );
  }

  Widget diabitiesCard({dynamic image, dynamic header, required int score}) {
    // log(score.toString());
    return GestureDetector(
      onTap: () {
        navigationSlide(
            context,
            RiskScoreDetailsView(
                title: "Diabetes Risk Score",
                header: header,
                image: image,
                indictor: indicator(
                    val: fetchlevels(
                        context, diabitesRiskScoreLevel(score: score)),
                    col: diabitesRiskScoreColor(score: score)),
                col: diabitesRiskScoreColor(score: score),
                score: score));
      },
      child: myyellowcard(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Apptextwidget(
            header,
            style: TxtStls.stl16,
          ),
          appspace(h: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  indicator(
                      val: fetchlevels(
                          context, diabitesRiskScoreLevel(score: score)),
                      col: diabitesRiskScoreColor(score: score)),
                  appspace(h: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Apptextwidget(
                        "$score",
                        style: TxtStls.stl20,
                      ),
                      appspace(w: 10),
                      const Icon(Icons.info)
                    ],
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      value: double.parse(score.toString()) / 40,
                      strokeWidth: 10,
                      backgroundColor: const Color(0xFFE7ECFF),
                      valueColor: AlwaysStoppedAnimation(
                          diabitesRiskScoreColor(score: score)),
                    ),
                  ),
                  mydashcard(image)
                ],
              )
            ],
          ),
        ],
      )),
    );
  }

  String fetchvalue(dynamic index) {
    try {
      final vitalCtrl = Provider.of<Vitalscontroller>(context, listen: false);
      var results = vitalCtrl.vitalsData.toString().split(",");
      return results[index];
    } catch (e) {
      return "";
    }
  }

  Widget cardioCard({dynamic image, dynamic header, required int score}) {
    return GestureDetector(
      onTap: () {
        navigationSlide(
            context,
            RiskScoreDetailsView(
                header: header,
                title: "Cardio Vascular Risk",
                image: image,
                indictor: indicator(
                    val: fetchlevels(context, cardioReturnText(score: score)),
                    col: cardioRetunColor(score: score)),
                col: cardioRetunColor(score: score),
                score: score));
      },
      child: myyellowcard(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Apptextwidget(
            header,
            style: TxtStls.stl16,
          ),
          appspace(h: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  indicator(
                      val: fetchlevels(context, cardioReturnText(score: score)),
                      col: cardioRetunColor(score: score)),
                  appspace(h: 10),
                  Row(
                    children: [
                      Apptextwidget(
                        "$score",
                        style: TxtStls.stl20,
                      ),
                      appspace(w: 10),
                      const Icon(Icons.info)
                    ],
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      value: double.parse(score.toString()) / 100,
                      strokeWidth: 10,
                      backgroundColor: const Color(0xFFE7ECFF),
                      valueColor: AlwaysStoppedAnimation(
                          cardioRetunColor(score: score)),
                    ),
                  ),
                  mydashcard(image)
                ],
              )
            ],
          ),
        ],
      )),
    );
  }

  Widget stressCard({dynamic image, dynamic header, dynamic score, dynamic val}) {
    return GestureDetector(
      onTap: () {
        navigationSlide(
            context,
            RiskScoreDetailsView(
                header: header,
                title: "Stress Level",
                col: Risckscorecolours.rsiccolstressvalue(val: score),
                image: image,
                val: val.toString(),
                indictor: indicator(
                  val: fetchlevels(context, score).toString().capitalize(),
                  col: Risckscorecolours.rsiccolstressvalue(val: score),
                ),
                score: stressValue(score: score)));
      },
      child: myyellowcard(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Apptextwidget(
            header,
            style: TxtStls.stl16,
          ),
          appspace(h: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  indicator(
                      val: fetchlevels(context, score).toString().capitalize(),
                      col: Risckscorecolours.rsiccolstressvalue(val: score)),
                  appspace(h: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Apptextwidget(
                        "$val",
                        style: TxtStls.stl20,
                      ),
                      appspace(w: 10),
                      const Icon(Icons.info)
                    ],
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      value: double.parse(val) / 384,
                      strokeWidth: 10,
                      backgroundColor: const Color(0xFFE7ECFF),
                      valueColor: AlwaysStoppedAnimation(
                          Risckscorecolours.rsiccolstressvalue(val: score)),
                    ),
                  ),
                  mydashcard(image)
                ],
              )
            ],
          ),
        ],
      )),
    );
  }

  Widget bmiCard({dynamic image, dynamic header, dynamic score, dynamic val}) {
    return GestureDetector(
      onTap: () {
        navigationSlide(
            context,
            RiskScoreDetailsView(
                header: header,
                image: image,
                title: "Obesity Grading - BMI",
                indictor: indicator(
                    val: fetchrisklevel(context, score),
                    col:
                        obesityRetunColor(score: double.parse(val.toString()))),
                col: obesityRetunColor(score: double.parse(val.toString())),
                score: double.tryParse(val)??0.0));
      },
      child: myyellowcard(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Apptextwidget(
            header,
            style: TxtStls.stl16,
          ),
          appspace(h: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  indicator(
                      val: fetchrisklevel(context, score),
                      col: obesityRetunColor(
                          score: double.tryParse(val.toString())??0.0)),
                  appspace(h: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Apptextwidget(
                        "$val",
                        style: TxtStls.stl20,
                      ),
                      appspace(w: 10),
                      const Icon(Icons.info)
                    ],
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      value: ((double.tryParse(val.toString())) ?? 0) / 40,
                      strokeWidth: 10,
                      backgroundColor: const Color(0xFFE7ECFF),
                      valueColor: AlwaysStoppedAnimation(obesityRetunColor(
                          score: double.tryParse(val.toString())??0.0)),
                    ),
                  ),
                  mydashcard(image)
                ],
              )
            ],
          ),
        ],
      )),
    );
  }

  Widget depressionCard({dynamic image, dynamic header, dynamic score}) {
    return GestureDetector(
      onTap: () {
        navigationSlide(
            context,
            RiskScoreDetailsView(
                header: header,
                image: image,
                title: "Depression Score",
                indictor: indicator(
                    val: fetchlevels(
                        context, depressionLevel(score: score ?? 0)),
                    col: depressionColor(score: score ?? 0)),
                col: depressionColor(score: score),
                score: score));
      },
      child: myyellowcard(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Apptextwidget(
            header,
            style: TxtStls.stl16,
          ),
          appspace(h: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  indicator(
                      val: fetchlevels(
                          context, depressionLevel(score: score ?? 0)),
                      col: depressionColor(score: score ?? 0)),
                  appspace(h: 10),
                  Row(
                    children: [
                      Apptextwidget(
                        "$score",
                        style: TxtStls.stl20,
                      ),
                      appspace(w: 10),
                      const Icon(Icons.info)
                    ],
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      value: double.parse(score.toString()) / 100,
                      strokeWidth: 10,
                      backgroundColor: const Color(0xFFE7ECFF),
                      valueColor: AlwaysStoppedAnimation(
                          depressionColor(score: score ?? 0)),
                    ),
                  ),
                  mydashcard(image)
                ],
              )
            ],
          ),
        ],
      )),
    );
    // return myyellowcard(
    //     child: Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Row(
    //       children: [
    //         mydashcard(image),
    //         appspace(w: 10),
    //         Text(
    //           header,
    //           style: TxtStls.stl16,
    //         ),
    //       ],
    //     ),
    //     appspace(h: 10),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         Text(
    //           "$score",
    //           style: TxtStls.stl16,
    //         ),
    //         appspace(w: 10),
    //         indicator(
    //             val: depressionLevel(score: score ?? 0),
    //             col: depressionColor(score: score ?? 0)),
    //       ],
    //     ),
    //     appspace(h: 10),
    //     getLinearGauge(max: 27.0, min: 0.0, value: score),
    //   ],
    // ));
  }

  Widget anemiaGradeCard({dynamic image, dynamic header, dynamic score}) {
    return GestureDetector(
      onTap: () {
        navigationSlide(
            context,
            RiskScoreDetailsView(
                header: header,
                image: image,
                title: "Anemia Grading",
                indictor: indicator(
                    val: depressionLevel(score: score ?? 0),
                    col: depressionColor(score: score ?? 0)),
                col: depressionColor(score: score),
                score: score));
      },
      child: myyellowcard(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              mydashcard(image),
              appspace(w: 10),
              Apptextwidget(
                header,
                style: TxtStls.stl16,
              ),
            ],
          ),
          appspace(h: 10),
          Row(
            children: [
              Apptextwidget(
                "$score",
                style: TxtStls.stl16,
              ),
              appspace(w: 10),
              const Icon(Icons.info)
            ],
          ),
          appspace(w: 10),
          //appspace(h: 10),
          // getLinearGauge(max: 27.0,min: 0.0,value: stressValue(score: score)),
        ],
      )),
    );
  }
}

String diabitesRiskScoreLevel({dynamic score}) {
  try {
    if (score >= 0 && score <= 6) {
      return "Low Risk";
    } else if (score > 6 && score <= 15) {
      return "Increased Risk";
    } else if (score > 15 && score <= 24) {
      return "Moderate Risk";
    } else if (score > 24) {
      return "High Risk";
    } else {
      return "High Risk";
    }
  } catch (e) {
    return "-";
  }
}

Color diabitesRiskScoreColor({dynamic score}) {
  try {
    if (score >= 0 && score <= 6) {
      return Colors.lime;
    } else if (score > 6 && score <= 15) {
      return const Color(0xFFFFC683);
    } else if (score > 15 && score <= 24) {
      return Colors.deepOrange;
    } else if (score > 24) {
      return const Color(0xFFFF8181);
    } else {
      return const Color(0xFFFF8181);
    }
  } catch (e) {
    return bgClr1;
  }
}

Widget cardioMeter({dynamic score}) {
  return SfRadialGauge(
    enableLoadingAnimation: true,
    axes: <RadialAxis>[
      RadialAxis(
        minimum: 0,
        maximum: 40,
        canScaleToFit: true,
        showTicks: true,
        showLabels: true,
        showFirstLabel: true,
        ranges: <GaugeRange>[
          GaugeRange(
              startValue: 0,
              endValue: 5,
              color: Colors.lime,
              startWidth: 1,
              endWidth: 10),
          GaugeRange(
              startValue: 5,
              endValue: 10,
              color: const Color(0xFFFFC683),
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: 10,
              endValue: 20,
              color: Colors.deepOrange,
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: 20,
              endValue: 30,
              color: const Color(0xFFFF8181),
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: 30,
              endValue: 40,
              color: maroonClr,
              startWidth: 10,
              endWidth: 1),
        ],
        pointers: <GaugePointer>[
          MarkerPointer(
            value: score == null ? 0.0 : double.parse(score.toString()),
            color: Colors.white,
            markerType: MarkerType.circle,
            enableAnimation: true,
            animationType: AnimationType.easeInCirc,
            elevation: 5.0,
            markerHeight: 20,
            markerWidth: 20,
          ),
        ],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              widget: Text(score.toString(), style: TxtStls.stl16),
              angle: 90,
              positionFactor: 0)
        ],
        startAngle: 180,
        endAngle: 360,
        showAxisLine: false,
        showLastLabel: true,
      ),
    ],
  );
}

String cardioReturnText({score}) {
  try {
    if (score <= 5) {
      return "Low Risk";
    } else if (score > 5 && score <= 10) {
      return "Moderate Risk";
    } else if (score > 10 && score <= 20) {
      return "High Risk";
    } else if (score > 20 && score <= 30) {
      return "Very High Risk";
    } else {
      return "Established Cardiovascular Disease";
    }
  } catch (e) {
    return "-";
  }
}

Color cardioRetunColor({dynamic score}) {
  try {
    if (score <= 5) {
      return Colors.lime;
    } else if (score > 5 && score <= 10) {
      return const Color(0xFFFFC683);
    } else if (score > 10 && score <= 20) {
      return Colors.deepOrange;
    } else if (score > 20 && score <= 30) {
      return const Color(0xFFFF8181);
    } else {
      return maroonClr;
    }
  } catch (e) {
    return bgClr1;
  }
}

Color obesityRetunColor({dynamic score}) {
  //log(score.toString());
  try {
    if (score <= 24.9) {
      return Colors.lime;
    } else if (score >= 25 && score <= 30) {
      return const Color(0xFFFFC683);
    } else if (score >= 31 && score <= 35) {
      return Colors.deepOrange;
    } else if (score >= 35 && score <= 40) {
      return const Color(0xFFFF8181);
    } else {
      return maroonClr;
    }
  } catch (e) {
    return bgClr1;
  }
}

Widget stressMeter({score}) {
  return SfRadialGauge(
    enableLoadingAnimation: true,
    axes: <RadialAxis>[
      RadialAxis(
        minimum: 0,
        maximum: 50,
        interval: 10,
        canScaleToFit: true,
        ranges: <GaugeRange>[
          GaugeRange(
              startValue: 0,
              endValue: 10,
              color: Colors.lime,
              startWidth: 1,
              endWidth: 10),
          GaugeRange(
              startValue: 10,
              endValue: 20,
              color: const Color(0xFFFFC683),
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: 20,
              endValue: 30,
              color: Colors.deepOrange,
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: 30,
              endValue: 40,
              color: const Color(0xFFFF8181),
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: 40,
              endValue: 50,
              color: maroonClr,
              startWidth: 10,
              endWidth: 1),
        ],
        pointers: <GaugePointer>[
          MarkerPointer(
            value: score == null ? 0.0 : stressValue(score: score),
            color: Colors.white,
            markerType: MarkerType.circle,
            enableAnimation: true,
            animationType: AnimationType.easeInCirc,
            elevation: 5.0,
            markerHeight: 20,
            markerWidth: 20,
          ),
        ],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              widget: SizedBox(child: Text(score, style: TxtStls.stl16)),
              angle: 90,
              positionFactor: 0)
        ],
        startAngle: 180,
        endAngle: 360,
        showAxisLine: false,
        showLabels: false,
        showTicks: false,
        // showLastLabel: true,
      ),
    ],
  );
}

// stresReturnColor({score}) {
//  // log(score.toString());
//   if (score == "Mild") {
//     return Colors.lime;
//   } else if (score == "Low") {
//     return Colors.greenAccent;
//   } else if (score == "High") {
//     return Colors.deepOrange;
//   } else if (score == "Very high") {
//     return Colors.red;
//   } else {
//     return maroonClr;
//   }
// }

double stressValue({dynamic score}) {
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

Widget bmiMeter({dynamic score}) {
  return SfRadialGauge(
    enableLoadingAnimation: true,
    axes: <RadialAxis>[
      RadialAxis(
        minimum: 0,
        maximum: 50,
        interval: 10,
        canScaleToFit: true,
        ranges: <GaugeRange>[
          GaugeRange(
              startValue: 0,
              endValue: 18.5,
              color: Colors.lime,
              startWidth: 1,
              endWidth: 10),
          GaugeRange(
              startValue: 18.5,
              endValue: 24.9,
              color: const Color(0xFFFFC683),
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: 24.9,
              endValue: 29.9,
              color: Colors.deepOrange,
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: 29.9,
              endValue: 34.9,
              color: const Color(0xFFFF8181),
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: 34.9,
              endValue: 39.9,
              color: maroonClr.withValues(alpha: 0.75),
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: 39.9,
              endValue: 50.0,
              color: maroonClr,
              startWidth: 10,
              endWidth: 1),
        ],
        pointers: <GaugePointer>[
          MarkerPointer(
            value: score == null ? 0.0 : double.parse(score.toString()),
            color: Colors.white,
            markerType: MarkerType.circle,
            enableAnimation: true,
            animationType: AnimationType.easeInCirc,
            elevation: 5.0,
            markerHeight: 20,
            markerWidth: 20,
          ),
        ],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              widget:
                  SizedBox(child: Text(score.toString(), style: TxtStls.stl16)),
              angle: 90,
              positionFactor: 0)
        ],
        startAngle: 180,
        endAngle: 360,
        showAxisLine: false,
        showLastLabel: true,
      ),
    ],
  );
}

Color bmiColor({dynamic score}) {
  if (score > 0 && score <= 18.5) {
    return Colors.lime;
  } else if (score > 18.5 && score <= 24.9) {
    return const Color(0xFFFFC683);
  } else if (score > 24.9 && score <= 29.9) {
    return Colors.deepOrange;
  } else if (score > 29.9 && score <= 34.9) {
    return const Color(0xFFFF8181);
  } else if (score > 34.9 && score <= 39.9) {
    return maroonClr.withValues(alpha: 0.75);
  } else {
    return maroonClr;
  }
}

Widget depressionMeter({score}) {
  return SfRadialGauge(
    enableLoadingAnimation: true,
    axes: <RadialAxis>[
      RadialAxis(
        minimum: 0,
        maximum: 27,
        interval: 10,
        canScaleToFit: true,
        ranges: <GaugeRange>[
          GaugeRange(
              startValue: 0,
              endValue: 4,
              color: Colors.lime,
              startWidth: 1,
              endWidth: 10),
          GaugeRange(
              startValue: 4,
              endValue: 9,
              color: const Color(0xFFFFC683),
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: 9,
              endValue: 14,
              color: Colors.deepOrange,
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: 14,
              endValue: 19,
              color: const Color(0xFFFF8181),
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: 19,
              endValue: 27,
              color: maroonClr,
              startWidth: 10,
              endWidth: 1),
        ],
        pointers: <GaugePointer>[
          MarkerPointer(
            value: score == null ? 0.0 : double.parse(score.toString()),
            color: Colors.white,
            markerType: MarkerType.circle,
            enableAnimation: true,
            animationType: AnimationType.easeInCirc,
            elevation: 5.0,
            markerHeight: 20,
            markerWidth: 20,
          ),
        ],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              widget: Text(score.toString(), style: TxtStls.stl16),
              angle: 90,
              positionFactor: 0)
        ],
        startAngle: 180,
        endAngle: 360,
        showAxisLine: false,
        showLabels: false,
        showTicks: false,
        // showLastLabel: true,
      ),
    ],
  );
}

Color depressionColor({dynamic score}) {
  try {
    if (score >= 0 && score <= 4) {
      return Colors.greenAccent;
    } else if (score >= 5 && score <= 9) {
      return const Color(0xFFFFC683);
    } else if (score >= 10 && score <= 14) {
      return Colors.deepOrange;
    } else if (score >= 14 && score <= 19) {
      return const Color(0xFFFF8181);
    } else if (score > 19 && score <= 27) {
      return maroonClr;
    } else {
      return Colors.grey;
    }
  } catch (e) {
    return bgClr1;
  }
}

String depressionLevel({score}) {
  try {
    if (score >= 0 && score <= 4) {
      return "None";
    } else if (score >= 5 && score <= 9) {
      return "Mild Depression";
    } else if (score >= 10 && score <= 14) {
      return "Moderate Depression";
    } else if (score > 14 && score <= 19) {
      return "Moderately Severe Depression";
    } else if (score > 19 && score <= 27) {
      return "Severe Depression";
    } else {
      return "-";
    }
    
  } catch (e) {
    return "-";
  }
}

Decoration decoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: bgClr1,
);
