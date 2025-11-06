// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'dart:developer';
import 'package:XLcarez/env/appexports.dart';

class Reportnew extends StatefulWidget {
  const Reportnew({super.key});

  @override
  State<Reportnew> createState() => _ReportnewState();
}

class _ReportnewState extends State<Reportnew> {
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer4<Vitalscontroller, ScoreManagementController,
              Authcontroller, DiabitiesController>(
          builder: (_, vitalCtrl, scoreCtrl, auth, diabitiesCtrl, child) {
        return Scaffold(
            appBar: Themeappbar(
              title: fetchlocale(context).finalresults,
              leading: true,
              act: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                      height: 50, width: 50, child: Image.asset(applogo)),
                )
              ],
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: genratemediaquery(context).size.height,
              width: genratemediaquery(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    slidercard(context,
                        imageurl: "Vitals/cardio.png",
                        label: "Pulse Rate",
                        riscol: Risckscorecolours.calculateheartrate(
                            val: fetchvalue(context, index: 4)),
                        riskvale:
                            RiskScorevalues.calculateheartrate(val: fetchvalue(context, index: 4)),
                        maxvalue: fetchmaxvalues("Pulse Rate"),
                        minvalue: fetchminvalues("Pulse Rate"),
                        value: vitlparse(fetchvalue(context, index: 4))),
                    //Spo2
                    slidercard(context,
                        imageurl: "Vitals/oxygenSaturation.png",
                        label: "oxygenSaturation",
                        riscol: Risckscorecolours.calculatespo2(
                            val: fetchvalue(context, index: 8)),
                        riskvale:
                            RiskScorevalues.calculatespo2(val: fetchvalue(context, index: 8)),
                        maxvalue: fetchmaxvalues("oxygenSaturation"),
                        minvalue: fetchminvalues("oxygenSaturation"),
                        value: vitlparse(fetchvalue(context, index: 8))),
                    // Respiration Rate
                    slidercard(context,
                        imageurl: "Vitals/respirationrate.png",
                        label: "Respiration Rate",
                        riscol: Risckscorecolours.calculatebrathingrate(
                            val: fetchvalue(context, index: 5)),
                        riskvale:
                            RiskScorevalues.calculatebrathingrate(val: fetchvalue(context, index: 5)),
                        maxvalue: fetchmaxvalues("Respiration Rate"),
                        minvalue: fetchminvalues("Respiration Rate"),
                        value: vitlparse(fetchvalue(context, index: 5))),
                    //Blood Pressure
                    // slidercard(
                    //     isbp: true,
                    //     imageurl: "Vitals/bloodPressure.png",
                    //     label: "Blood Pressure",
                    //     isbpvale: fetchvalue(context, index: 9),
                    //     riscol: Risckscorecolours.calculatebp(
                    //         val: fetchvalue(context, index: 10)),
                    //     riskvale:
                    //         "${RiskScorevalues.calculatebp(val: fetchvalue(context, index: 10))}",
                    //     maxvalue: fetchmaxvalues("Blood Pressure"),
                    //     minvalue: fetchminvalues("Blood Pressure"),
                    //     value: vitlparse(fetchvalue(context, index: 10))),
                    slidercard(context,
                        isbp: true,
                        imageurl: "Vitals/bloodPressure.png",
                        label: "Blood Pressure",
                        riscol: Risckscorecolours.calculatebp(
                            val: fetchvalue(context, index: 10)),
                        riskvale:
                            RiskScorevalues.calculatebp(val: fetchvalue(context, index: 10)),
                        maxvalue: fetchmaxvalues("Blood Pressure"),
                        minvalue: fetchminvalues("Blood Pressure"),
                        isbpvale: (fetchvalue(context, index: 9)),
                        // iextrawidget: Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Container(
                        //       margin: const EdgeInsets.only(top: 20),
                        //       padding: const EdgeInsets.symmetric(vertical: 10),
                        //       height: 10,
                        //       width: vitlparse(fetchvalue(context, index: 10)),
                        //          // genratemediaquery(context).size.width / 1.5,
                        //       decoration: BoxDecoration(
                        //           color: primary,
                        //           borderRadius: BorderRadius.circular(15)),
                        //     ),
                        //     appspace(h: 10),
                        //     Apptextwidget(
                        //       "${(fetchvalue(context, index: 9))}",
                        //       style: TxtStls.stl13,
                        //     )
                        //   ],
                        // ),
                        value: vitlparse(fetchvalue(context, index: 10))),
                    slidercard(context,
                        imageurl: "Vitals/stressLevel.png",
                        label: "Stress Level",
                        riscol: Risckscorecolours.rsiccolstressvalue(
                            val: fetchvalue(context, index: 6)),
                        riskvale: fetchvalue(context, index: 6, icaptel: true),
                        maxvalue: fetchmaxvalues("Stress Level"),
                        minvalue: fetchminvalues("Stress Level"),
                        // iextrawidget: Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Container(
                        //       margin: const EdgeInsets.only(top: 20),
                        //       padding: const EdgeInsets.symmetric(vertical: 10),
                        //       height: 10,
                        //       width: vitlparse(fetchvalue(context, index: 7))/1.5,
                        //          // genratemediaquery(context).size.width / 1.5,
                        //       decoration: BoxDecoration(
                        //           color: primary,
                        //           borderRadius: BorderRadius.circular(15)),
                        //     ),
                        //     appspace(h: 10),
                        //     Apptextwidget(
                        //       "${vitlparse(fetchvalue(context, index: 7))}",
                        //       style: TxtStls.stl13,
                        //     )
                        //   ],
                        // ),
                        value:
                            // 484.0

                            vitlparse(fetchvalue(context, index: 7))),
                    slidercard(context,
                        imageurl: "Vitals/wellnessLevel.png",
                        label: "Wellness Level",
                        riscol: Risckscorecolours.rsiccolwellness(
                            val: fetchvalue(context, index: 0)),
                        riskvale: fetchvalue(context, index: 1, icaptel: true),
                        maxvalue: fetchmaxvalues("Wellness Level"),
                        minvalue: fetchminvalues("Wellness Level"),
                        value: vitlparse(fetchvalue(context, index: 0))),

                    Visibility(
                      visible: fetchvalue(context, index: 2) != "-",
                      child: slidercard(context,
                          imageurl: "Vitals/hemoglobinA1c.png",
                          label: "Hemoglobin A1C",
                          labelw: RichText(
                              text: TextSpan(
                                  text:
                                      fethvitalsdata(context, "Hemoglobin A1C"),
                                  //"Hemoglobin A1C",
                                  style: TxtStls.stl13,
                                  children: [
                                WidgetSpan(
                                  child: Apptextwidget(
                                    "*",
                                    style: TxtStls.errorStl,
                                  ),
                                )
                              ])),
                          riscol: Risckscorecolours.calculatehba1c(
                              val: fetchvalue(context, index: 2)),
                          riskvale: RiskScorevalues.calculatehba1c(
                              val: fetchvalue(context, index: 2)),
                          maxvalue: 8.0,
                          minvalue: 0.0,
                          value: vitlparse(fetchvalue(context, index: 2))),
                    ),
                    // Visibility(
                    //   visible: fetchvalue(context, index: 2) != "-",
                    //   child: slidercard1(context,
                    //       imageurl: "Vitals/hemoglobinA1c.png",
                    //       labelw: RichText(
                    //           text: TextSpan(
                    //               text:
                    //                   fethvitalsdata(context, "Hemoglobin A1C"),
                    //               //"Hemoglobin A1C",
                    //               style: TxtStls.stl13,
                    //               children: [
                    //             WidgetSpan(
                    //               child: Apptextwidget(
                    //                 "*",
                    //                 style: TxtStls.errorStl,
                    //               ),
                    //             )
                    //           ])),
                    //       value: fetchvalue(context, index: 2),
                    //       child: Flexible(
                    //           child: Apptextwidget(
                    //         fetchlocale(context).accuracyRange,
                    //         //"The accuracy range currently is  3-8, and under R&D"
                    //         style: TxtStls.stl14,
                    //       ))),
                    // ),
                    Visibility(
                      visible: fetchvalue(context, index: 3) != "-",
                      child: slidercard1(context,
                          imageurl: "Vitals/hemoglobin.png",
                          label: "Hemoglobin",
                          value: fetchvalue(context, index: 3),
                          child: Flexible(
                              child: Apptextwidget(
                            fetchlocale(context).hemoglobin_text
                            //"Men: 14 to 18 g/dL \nWomen: 12 to 16 g/dL for Hemoglobin"
                            ,
                            style: TxtStls.stl14,
                          ))),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: primary,
              onPressed: () {
                navigationSlide(context, const ReportSummurynewpage());
              },
              child: ImageIcon(
                color: bgClr1,
                const AssetImage(bottom2),
                size: 30,
              ),
            ),
            bottomNavigationBar: bottomContainer(
              child: fillButton(context,
                  load: vitalCtrl.saveload ||
                      auth.isload ||
                      vitalCtrl.risksaveload ||
                      vitalCtrl.questionsaveload,
                  title: fetchlocale(context).backtohome, onTap: () async {
                final ctrl =
                    Provider.of<Authcontroller>(context, listen: false);
                final calctrl = Provider.of<CalculationRiskController>(context,
                    listen: false);
                final diabetiescyrl =
                    Provider.of<DiabitiesController>(context, listen: false);
                final scoremanagementcontroller =
                    Provider.of<ScoreManagementController>(context,
                        listen: false);
                var results = vitalCtrl.vitalsData.toString().split(",");
                var vjon = {
                  "vitalsId": 0,
                  "userId": await ctrl.fethuserid(),
                  "wellnessIndex": results[0].toString(),
                  "wellnessLevel": results[1].toString().capitalize(),
                  "hemoglobinA1C": results[2].toString(),
                  "hemoglobin": results[3].toString(),
                  "pulseRate": results[4].toString(),
                  "respirationRate": results[5].toString(),
                  "stressLevel": results[6].toString().capitalize(),
                  "stressIndex": results[7].toString(),
                  "oxygenSaturation": results[8].toString(),
                  "bloodPressure": results[9].toString(),
                  "breatheconfidence": results[12],
                  "heartconfidence": results[11],
                  "bloodpressurelevel": RiskScorevalues.calculatebp(
                      val: fetchvalue(context, index: 10)),
                  "respirationlevel": RiskScorevalues.calculatebrathingrate(
                      val: fetchvalue(context, index: 5)),
                  "oxygensaturationlevel": RiskScorevalues.calculatespo2(
                      val: fetchvalue(context, index: 8)),
                  "pulselevel": RiskScorevalues.calculateheartrate(
                      val: fetchvalue(context, index: 4)),
                  "bmi": ctrl.bmicontroller.text,
                  "weight": ctrl.weightconteoller.text,
                  "height": ctrl.heightController.text,
                  "recordType": "Scan",
                  "Country": null,
                  "addedBy": await ctrl.fethuserid(),
                };
                var risksave = {
                  "id": 0,
                  "userId": await ctrl.fethuserid(),
                  "stopBang": null,
                  "obesity": auth.questionnairedaibeskip
                      ? null
                      : roundStringToDecimals(calculateBmi(
                                  userheight: auth.heightController.text,
                                  userweight: auth.weightconteoller.text)
                              .toString())
                          .toString(),
                  "cardio": auth.questionnairecardioskip
                      ? null
                      : calctrl.cardioriskscore.toString(),
                  "diabetes": auth.questionnairedaibeskip
                      ? null
                      : calctrl.daibetiesriskscore.toString(),
                  "obesityLevel": auth.questionnairedaibeskip
                      ? null
                      : calctrl.obesityriskscore,
                  "cardioLevel": auth.questionnairecardioskip
                      ? null
                      : cardioReturnText(score: calctrl.cardioriskscore),
                  "diabetesLevel": auth.questionnairedaibeskip
                      ? null
                      : diabitesRiskScoreLevel(
                          score: calctrl.daibetiesriskscore)
                };
                var qson = {
                  "questionId": 0,
                  "userId": await ctrl.fethuserid(),
                  "ethinicBackground": ctrl.questionnairedaibeskip
                      ? null
                      : diabetiescyrl.diabities3,
                  "type12": ctrl.questionnairedaibeskip
                      ? null
                      : diabetiescyrl.diabities4,
                  "waist": ctrl.questionnairedaibeskip
                      ? null
                      : diabetiescyrl.diabities5,
                  "doctorBp": ctrl.questionnairedaibeskip
                      ? null
                      : diabetiescyrl.diabities7,
                  "breathing": ctrl.questionnairecardioskip
                      ? null
                      : scoremanagementcontroller.cardio1,
                  "drinking": ctrl.questionnairecardioskip
                      ? null
                      : scoremanagementcontroller.cardio2,
                  "smoking": ctrl.questionnairecardioskip
                      ? null
                      : scoremanagementcontroller.cardio3,
                  "longdiseases": ctrl.questionnairecardioskip
                      ? null
                      : scoremanagementcontroller.cardio4,
                  "heartRelated": ctrl.questionnairecardioskip
                      ? null
                      : scoremanagementcontroller.cardio5,
                  "pleasure": ctrl.questionnairecmentalskip
                      ? null
                      : scoremanagementcontroller.qus1,
                  "depressed": ctrl.questionnairecmentalskip
                      ? null
                      : scoremanagementcontroller.qus2,
                  "sleeping": ctrl.questionnairecmentalskip
                      ? null
                      : scoremanagementcontroller.qus3,
                  "littleEnergy": ctrl.questionnairecmentalskip
                      ? null
                      : scoremanagementcontroller.qus4,
                  "appetite": ctrl.questionnairecmentalskip
                      ? null
                      : scoremanagementcontroller.qus5,
                  "familyDown": ctrl.questionnairecmentalskip
                      ? null
                      : scoremanagementcontroller.qus6,
                  "telvision": ctrl.questionnairecmentalskip
                      ? null
                      : scoremanagementcontroller.qus7,
                  "slowSpeaking": ctrl.questionnairecmentalskip
                      ? null
                      : scoremanagementcontroller.qus8,
                  "dead": ctrl.questionnairecmentalskip
                      ? null
                      : scoremanagementcontroller.qus9,
                  "addedBy": await ctrl.fethuserid(),
                  // "hiv1": ctrl.questionnairehivskip?null:scoreCtrl.getscore(1),
                  // "hiv2": ctrl.questionnairehivskip?null:scoreCtrl.getscore(2),
                  // "hiv3": ctrl.questionnairehivskip?null:scoreCtrl.getscore(3),
                  // "hiv4": ctrl.questionnairehivskip?null:scoreCtrl.getscore(4),
                  // "hiv5": ctrl.questionnairehivskip?null:scoreCtrl.getscore(5),
                  // "hiv6": ctrl.questionnairehivskip?null:scoreCtrl.getscore(6),
                  // "hiv7": ctrl.questionnairehivskip?null:scoreCtrl.getscore(7),
                  // "hiv8": ctrl.questionnairehivskip?null:scoreCtrl.getscore(8),
                  // "hiv9": ctrl.questionnairehivskip?null:scoreCtrl.getscore(9),
                  // "hiv10": ctrl.questionnairehivskip?null:scoreCtrl.getscore(10),
                  // "hiv11": ctrl.questionnairehivskip?null:scoreCtrl.getscore(11),
                  // "hiv12": ctrl.questionnairehivskip?null:scoreCtrl.getscore(12),
                  // "hivtotal": ctrl.questionnairehivskip?null:scoreCtrl.calculateTotalScore().toStringAsFixed(2),
                  // "hivinteragration": ctrl.questionnairehivskip?null:scoreCtrl.calculateIntegrationScore().toStringAsFixed(2),
                  // "hivperseverencescore":ctrl.questionnairehivskip?null:scoreCtrl.calculatePerseveranceScore().toStringAsFixed(2)
                };
                log(qson.toString());
                vitalCtrl.savevitals(vjson: vjon).whenComplete(() {
                  Provider.of<MeasurementModel>(context, listen: false).reset();
                  vitalCtrl.savevrisk(vjson: risksave).whenComplete(() async {
                    vitalCtrl.questionaresave(qjson: qson).whenComplete(() {
                      scoremanagementcontroller.clearData();
                      diabetiescyrl.clearDiabities();
                    });
                    vitalCtrl.clearData();
                    Provider.of<DiabitiesController>(context, listen: false)
                        .clearDiabities();
                    Provider.of<ScoreManagementController>(context,
                            listen: false)
                        .clearData();
                    vitalCtrl.getlatesvitalscore(id: await auth.fethuserid());
                    vitalCtrl.getallvitalslist(id: await ctrl.fethuserid());
                    auth.getbyid().whenComplete(() {
                      //Provider.of<CalculationRiskController>(context,listen: false).reset();
                      navigationSlideAndRemoveUntil(context, const Landing(),
                          x: 0.0, y: 1.0);
                    });
                  });
                });
                //final permission = await Permission.location.status;
                // if(permission== PermissionStatus.granted){
                //--- the above code.
                // }else{
                //   auth.currentlocation();
                // }
              }),
            ));
      }),
    );
  }
}

class CustomSliderExample extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final double currentValue;
  final bpvalue;
  final isbp;
  final vital;

  const CustomSliderExample(
      {super.key,
      required this.currentValue,
      this.isbp = false,
      this.bpvalue,
      this.vital,
      required this.maxValue,
      required this.minValue});
  @override
  _CustomSliderExampleState createState() => _CustomSliderExampleState();
}

class _CustomSliderExampleState extends State<CustomSliderExample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: genratemediaquery(context).size.width,
          height: 70,
          child: getLinearGauge(
            interval: widget.vital == "Stress Level" ? 100.0 : null,
            max: widget.maxValue,
            ranges: fetchranges(widget.vital),
            min: widget.minValue,
            value: widget.currentValue,
            // colors: fetchgradientcol(widget.vital)
          ),
        ),
        //Min and Max Labels
        Apptextwidget(
          "${fetchlocale(context).observedval} => ${widget.isbp ? "${widget.bpvalue}" : "${widget.currentValue}"}",
          style: TxtStls.stl14,
        )
        // SizedBox(
        //   width: genratemediaquery(context).size.width,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Apptextwidget(
        //         widget.isbp ? "90/60mmHg" : '${widget.minValue.round()}',
        //         style: TxtStls.appstyle12,
        //       ),
        //       Apptextwidget(
        //           widget.isbp ? "140/90mmHg" : '${widget.maxValue.round()}',
        //           style: TxtStls.appstyle12),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
