// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:XLcarez/env/appexports.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class ReportSummurynewpage extends StatefulWidget {
  const ReportSummurynewpage({super.key});

  @override
  State<ReportSummurynewpage> createState() => _ReportSummurynewpageState();
}

class _ReportSummurynewpageState extends State<ReportSummurynewpage> {
  GlobalKey screenshotkey = GlobalKey();
  //@override
  // void initState() {
  //   captureWidget();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child:
          Consumer3<Vitalscontroller, Authcontroller, Localizationcontroller>(
              builder: (_, vitalCtrl, genctrl, lan, child) {
        var results = vitalCtrl.vitalsData.toString().split(",");
        return Scaffold(
          appBar: Themeappbar(
            title: fetchlocale(context).reportsummry,
            leading: true,
            act: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                    height: 50, width: 50, child: Image.asset(applogo)),
              ),
            ],
          ),
          body: imagegenerate
              ? Center(
                  child: Apptextwidget(
                    fetchlocale(context).imagegen,
                    //"Image is being generated, please wait...",
                    style: TxtStls.wstl14,
                  ),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: genratemediaquery(context).size.height,
                  width: genratemediaquery(context).size.width,
                  child: SingleChildScrollView(
                    child: RepaintBoundary(
                      key: screenshotkey,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                onPressed: () {
                                  if (lan.locale == const Locale("ar")||lan.locale==const Locale("uk")) {
                                    //print("arabic");
                                    arabicconvertImageToPdf(
                                        context, lan.locale);
                                  } else {
                                    convertImageToPdf(context, lan.locale);
                                    //print("other");
                                  }
                                  // convertImageToPdf(
                                  //     context,
                                  //      const Locale("pt"));
                                  //lan.locale);
                                },
                                icon: const Icon(
                                  Icons.share,
                                  color: scaffoldbgcol,
                                )),
                          ),
                          ...formatvitalist(results)
                              .map((e) => slidercardreportcard(context,
                                  labelw: e['title'] == "Hemoglobin A1C"
                                      ? RichText(
                                          text: TextSpan(
                                              text: fethvitalsdata(
                                                  context, "Hemoglobin A1C"),
                                              style: TxtStls.stl13,
                                              children: [
                                              WidgetSpan(
                                                child: Apptextwidget(
                                                  "*",
                                                  style: TxtStls.errorStl,
                                                ),
                                              )
                                            ]))
                                      : null,
                                  label: e['title'] ?? "-",
                                  imageurl: "Vitals/${e['image']}",
                                  riskcol: e["levelcol"] ?? primary,
                                  confidence: e["confidence"],
                                  riskvale: e["level"] ?? "-",
                                  value: e["value"],
                                  child: configwidget(context,
                                      val: e["value"], lable: e["title"])))
                              
                        ],
                      ),
                    ),
                  ),
                ),
          bottomNavigationBar: Material(
            color: transparentcol,
            child: bottomContainer(
                child: Row(
              children: [
                const Icon(
                  Icons.warning_amber_outlined,
                  size: 50,
                  color: Colors.amberAccent,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: fetchlocale(context).forinvestuseonly,
                          style: TxtStls.stl15,
                        ),
                        TextSpan(
                          text: fetchlocale(context).thesenumbersareonly,
                          style: TxtStls.stl12,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ),
        );
      }),
    );
  }

  Consumer<Localizationcontroller> configwidget(context, {val, lable}) {
    return Consumer<Localizationcontroller>(builder: (context, ctrl, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: Apptextwidget(
                  referncevalues(lable, ctrl.locale),
                  style: TxtStls.stl13,
                )),
            Apptextwidget(
              fetchlocale(context).intrpret,
              style: TxtStls.stl16,
            ),
            Apptextwidget(
              interpretonvalues(lable, ctrl.locale),
              style: TxtStls.stl14,
            )
          ],
        ),
      );
    });
  }

  List<Map<String, Object?>> formatvitalist(results) {
    return [
      {
        "col": const Color(0xFFEBE0E7),
        "title": "Wellness Index",
        "value": results[0],
        "image": "wellness.png",
        "levelcol": Risckscorecolours.rsiccolwellness(val: results[0]),
        "level": results[1].toString(),
      },
      //   {
      //   "col":const Color(0xFFD1E7DF),
      //   "title": "Wellness Level",
      //   "value": results[1].toString(),
      //   "image": "wellnessLevel.png"
      // },
      {
        "col": const Color(0xFFE0E5FA),
        "title": "Pulse Rate",
        "value": "${results[4]} bpm",
        "image": "pulseRate.png",
        "levelcol": Risckscorecolours.calculateheartrate(val: results[4]),
        "level": RiskScorevalues.calculateheartrate(val: results[4]),
        "confidence": results[11] ?? "N/A"
      },
      {
        "col": const Color(0xFFCCF0C2),
        "title": "Respiration Rate",
        "value": "${results[5]} breaths per minute",
        "image": "respirationrate.png",
        "levelcol": Risckscorecolours.calculatebrathingrate(val: results[5]),
        "level": RiskScorevalues.calculatebrathingrate(val: results[5]),
        "confidence": results[12] ?? "N/A"
      },
      //   {
      //   "col":const Color(0xFFCBE7FF),
      //   "title": "Stress Level",
      //   "value": results[6],
      //   "image": "stressLevel.png"
      // },
      {
        "col": const Color(0xFFFAFAE0),
        "title": "Stress Index",
        "value": results[7],
        "image": "stressindex.png",
        "levelcol": Risckscorecolours.rsiccolstressvalue(val: results[6]),
        "level": results[6].toString().capitalize(),
      },
      {
        "col": const Color(0xFFD9F8F8),
        "title": "Oxygen Saturation",
        "value": "${results[8]} %",
        "image": "oxygenSaturation.png",
        "levelcol": Risckscorecolours.calculatespo2(val: results[8]),
        "level": RiskScorevalues.calculatespo2(val: results[8]),
      },
      {
        "col": const Color(0xFFF8E6FE),
        "title": "Blood Pressure",
        "value": "${results[9]} mmHg",
        "image": "bloodPressure.png",
        "levelcol": Risckscorecolours.calculatebp(val: results[10]),
        "level": RiskScorevalues.calculatebp(val: results[10]),
      },
      {
        "col": const Color(0xFFE0E5FA),
        "title": "Hemoglobin A1C",
        "value": "${results[2]} %",
        "image": "hemoglobinA1c.png",
         "levelcol": Risckscorecolours.calculatehba1c(val: results[2]),
        "level": RiskScorevalues.calculatehba1c(val: results[2]),
      },
      {
        "col": const Color(0xFFEBE7DB),
        "title": "Hemoglobin",
        "value": "${results[3]} g/dL",
        "image": "hemoglobin.png",
        "levelcol": null,
        "level": null,
      },
    ];
  }

  bool imagegenerate = false;
  Future<void> arabicconvertImageToPdf(
    BuildContext context,
    Locale? loc,
  ) async {
    try {
      setState(() {
        imagegenerate = true;
      });
      final ctrl = Provider.of<Authcontroller>(context, listen: false);
      final vital = Provider.of<Vitalscontroller>(context, listen: false);
      var results = vital.vitalsData.toString().split(",");
      //final img = await rootBundle.load('assets/blulogo.png');
      final bg = await rootBundle.load("assets/logo.png");
      final fontData = await rootBundle.load("assets/fonts/Amiri-Regular.ttf");
      final fontData1 =
          await rootBundle.load("assets/fonts/NotoNaskhArabic-Regular.ttf");
      final fontdata3 = await rootBundle.load("assets/fonts/Cairo-Regular.ttf");
      final ukrinaefont = await rootBundle.load("assets/fonts/Roboto-Regular.ttf");
      //  final font4 = await rootBundle.load("assets/fonts/SFArabic-Regular.ttf");
      //  final font5 = await rootBundle.load("assets/fonts/Geeza Pro Regular.ttf");
      final ttf = pw.Font.ttf(fontData);
      final ttfn = pw.Font.ttf(fontData1);
      final ttfc = pw.Font.ttf(fontdata3);
      final ukrainefont = pw.Font.ttf(ukrinaefont);
      // final ttfs = pw.Font.ttf(font4);
      // final ttfg = pw.Font.ttf(font5);

      //final imageBytes = img.buffer.asUint8List();
      // pw.Image image1 = pw.Image(
      //   pw.MemoryImage(imageBytes),
      //   height: 150,
      // );
      final pdf = pw.Document();
      pdf.addPage(argenratepage(
          bg: bg.buffer.asUint8List(),
          loc: loc,
          //ttf: ttf,
          child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Divider(
                    height: 2,
                    color: convertFlutterColorToPdfColor(Colors.grey),
                    endIndent: 20.0),
                pw.SizedBox(height: 5),
                pw.Text(fetchlocale(context).personaldetails,
                    style: pw.TextStyle(
                        font:loc==const Locale("ar")?ttf:ukrainefont,
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 5),
                pw.Container(
                    padding: const pw.EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: pw.BoxDecoration(
                        border: pw.Border.all(
                            color: convertFlutterColorToPdfColor(
                                hintClr.withValues())),
                        borderRadius: pw.BorderRadius.circular(10)),
                    child: pw.Column(children: [
                      argenratelabel(
                          label: fetchlocale(context).namee,
                          font:loc==const Locale("ar")?ttf:ukrainefont,
                          vale: ctrl.firstnamecontroller.text),
                      pw.Divider(
                          height: 1,
                          color: convertFlutterColorToPdfColor(
                              hintClr.withValues(alpha: 0.2))),
                      pw.SizedBox(height: 5),
                      argenratelabel(
                          label: fetchlocale(context).phonee,
                          font:loc==const Locale("ar")?ttf:ukrainefont,
                          vale: ctrl.phonecontroller.text),
                      pw.Divider(
                          height: 1,
                          color: convertFlutterColorToPdfColor(
                              hintClr.withValues(alpha: 0.2))),
                      pw.SizedBox(height: 5),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            argenratelabel(
                                label: fetchlocale(context).agee,
                                font: loc==const Locale("ar")?ttf:ukrainefont,
                                vale: ctrl.ageconteoller.text),
                            pw.VerticalDivider(
                                color: convertFlutterColorToPdfColor(hintClr),
                                width: 1),
                            argenratelabel(
                                label: fetchlocale(context).gendere,
                                font:loc==const Locale("ar")? ttf:ukrainefont,
                                vale: ctrl.gender ?? "Male"),
                          ]),
                      pw.Divider(
                          height: 1,
                          color: convertFlutterColorToPdfColor(
                              hintClr.withValues(alpha: 0.2))),
                      pw.SizedBox(height: 5),
                      argenratelabel(
                          label: fetchlocale(context).date_time,
                          font:loc==const Locale("ar")? ttf:ukrainefont,
                          vale: DateFormat("dd/MM/yy hh:mm a")
                              .format(DateTime.now())),
                      pw.Divider(
                          height: 1,
                          color: convertFlutterColorToPdfColor(
                              hintClr.withValues(alpha: 0.2))),
                      pw.SizedBox(height: 5),
                    ])),
                pw.SizedBox(height: 10),
                pdfSliderCardReportCard(
                    font:loc==const Locale("ar")? ttf:ukrainefont,
                    labelw: formatvitalist(results)[4]['title'] ==
                            "Hemoglobin A1C"
                        ? pw.RichText(
                            text:
                                pw.TextSpan(text: "Hemoglobin A1C", children: [
                            pw.WidgetSpan(
                              child: pw.Text(
                                "*",
                                style: pw.TextStyle(
                                    color: PdfColor.fromHex("#FF0000")),
                              ),
                            )
                          ]))
                        : null,
                    label: (formatvitalist(results)[4]['title'] as String?) ?? "-", 
                    imageurl: "Vitals/${formatvitalist(results)[4]['image']}",
                    refernce: referncevalues(
                        formatvitalist(results)[4]['title'], loc),
                    riskcol: convertFlutterColorToPdfColor(
                       ((formatvitalist(results))[4]["levelcol"] as Color?) ?? primary),
                    riskvale: (formatvitalist(results)[4]["level"] as String?) ?? "-",
                    value: (formatvitalist(results)[4]["value"] as String?),
                    child: arpdfConfigWidget(context,
                        val: formatvitalist(results)[4]["value"],
                          lable: formatvitalist(results)[4]["title"],
                          loc: loc,
                        font:loc==const Locale("ar")?ttfc:ukrainefont)),
              ])));

      pdf.addPage(argenratepage(
        bg: bg.buffer.asUint8List(),
        loc: loc,
        child: pdfSliderCardReportCard(
            font: loc==const Locale("ar")?ttf:ukrainefont,
            labelw: formatvitalist(results)[2]['title'] == "Hemoglobin A1C"
                ? pw.RichText(
                    text: pw.TextSpan(text: "Hemoglobin A1C", children: [
                    pw.WidgetSpan(
                      child: pw.Text(
                        "*",
                        style: pw.TextStyle(color: PdfColor.fromHex("#FF0000")),
                      ),
                    )
                  ]))
                : null,
            label: (formatvitalist(results)[2]['title'] as String?) ?? "-",
            refernce: referncevalues(formatvitalist(results)[2]['title'], loc),
            imageurl: "Vitals/${formatvitalist(results)[2]['image']}",
            riskcol: convertFlutterColorToPdfColor(
                formatvitalist(results)[2]["levelcol"] as Color? ?? primary),
            riskvale: (formatvitalist(results)[2]["level"] as String? )?? "-",
            value: (formatvitalist(results)[2]["value"] as String?),
            child: arpdfConfigWidget(context,
                val: formatvitalist(results)[2]["value"],
                lable: formatvitalist(results)[2]["title"],
                loc: loc,
                font: loc==const Locale("ar")?ttfc:ukrainefont)),
      ));

      pdf.addPage(argenratepage(
        bg: bg.buffer.asUint8List(),
        loc: loc,
        child: pdfSliderCardReportCard(
            font: loc==const Locale("ar")?ttf:ukrainefont,
            labelw: formatvitalist(results)[1]['title'] == "Hemoglobin A1C"
                ? pw.RichText(
                    text: pw.TextSpan(text: "Hemoglobin A1C", children: [
                    pw.WidgetSpan(
                      child: pw.Text(
                        "*",
                        style: pw.TextStyle(color: PdfColor.fromHex("#FF0000")),
                      ),
                    )
                  ]))
                : null,
            label: (formatvitalist(results)[1]['title'] as String?) ?? "-",
            imageurl: "Vitals/${formatvitalist(results)[1]['image']}",
            refernce: referncevalues(formatvitalist(results)[1]['title'], loc),
            riskcol: convertFlutterColorToPdfColor(
                formatvitalist(results)[1]["levelcol"] as Color? ?? primary),
            riskvale: (formatvitalist(results)[1]["level"] as String?) ?? "-",
            value: (formatvitalist(results)[1]["value"] as String?),
            child: arpdfConfigWidget(context,
                val: formatvitalist(results)[1]["value"],
                lable: formatvitalist(results)[1]["title"],
                loc: loc,
                font: loc==const Locale("ar")?ttfc:ukrainefont,
                font1: loc==const Locale("ar")?ttfn:ukrainefont)),
      ));

      pdf.addPage(argenratepage(
        bg: bg.buffer.asUint8List(),
        loc: loc,
        child: pdfSliderCardReportCard(
            font: loc==const Locale("ar")?ttf:ukrainefont,
            labelw: formatvitalist(results)[5]['title'] == "Hemoglobin A1C"
                ? pw.RichText(
                    text: pw.TextSpan(text: "Hemoglobin A1C", children: [
                    pw.WidgetSpan(
                      child: pw.Text(
                        "*",
                        style: pw.TextStyle(color: PdfColor.fromHex("#FF0000")),
                      ),
                    )
                  ]))
                : null,
            label: (formatvitalist(results)[5]['title'] as String?) ?? "-",
            imageurl: "Vitals/${formatvitalist(results)[5]['image']}",
            refernce: referncevalues(formatvitalist(results)[5]['title'], loc),
            riskcol: convertFlutterColorToPdfColor(
                formatvitalist(results)[5]["levelcol"] as Color? ?? primary),
            riskvale: (formatvitalist(results)[5]["level"] as String?) ?? "-",
            value: (formatvitalist(results)[5]["value"] as String?),
            child: arpdfConfigWidget(context,
                val: (formatvitalist(results)[5]["value"] as String?),
                lable: (formatvitalist(results)[5]["title"] as String?),
                loc: loc,
                font: loc==const Locale("ar")?ttfc:ukrainefont,
                font1: loc==const Locale("ar")?ttfn:ukrainefont)),
      ));

      // pdf.addPage(genratepage(
      //     bg: bg.buffer.asUint8List(),
      //     //ttf: ttf,
      //     child: pw.Column(
      //       children: [
      //         pdfSliderCardReportCard(
      //             font: ttf,
      //               labelw: formatvitalist(results)[1]['title'] ==
      //                       "Hemoglobin A1C"
      //                   ? pw.RichText(
      //                       text:
      //                           pw.TextSpan(text: "Hemoglobin A1C", children: [
      //                       pw.WidgetSpan(
      //                         child: pw.Text(
      //                           "*",
      //                           style: pw.TextStyle(
      //                               color: PdfColor.fromHex("#FF0000")),
      //                         ),
      //                       )
      //                     ]))
      //                   : null,
      //               label: formatvitalist(results)[1]['title'] ?? "-",
      //               imageurl: "Vitals/${formatvitalist(results)[1]['image']}",
      //               refernce: referncevalues(
      //                   formatvitalist(results)[1]['title'], loc),
      //               riskcol: convertFlutterColorToPdfColor(
      //                   formatvitalist(results)[1]["levelcol"] ?? primary),
      //               riskvale: formatvitalist(results)[1]["level"] ?? "-",
      //               value: formatvitalist(results)[1]["value"],
      //               child: pdfConfigWidget(
      //                   val: formatvitalist(results)[1]["value"],
      //                   lable: formatvitalist(results)[1]["title"],
      //                   loc: loc,font: ttfc,font1: ttfn)
      //                   ),
      //          pw.SizedBox(height: 10),
      //         pdfSliderCardReportCard(
      //           font: ttf,
      //             labelw: formatvitalist(results)[5]['title'] ==
      //                     "Hemoglobin A1C"
      //                 ? pw.RichText(
      //                     text: pw.TextSpan(text: "Hemoglobin A1C", children: [
      //                     pw.WidgetSpan(
      //                       child: pw.Text(
      //                         "*",
      //                         style: pw.TextStyle(
      //                             color: PdfColor.fromHex("#FF0000")),
      //                       ),
      //                     )
      //                   ]))
      //                 : null,
      //             label: formatvitalist(results)[5]['title'] ?? "-",
      //             imageurl: "Vitals/${formatvitalist(results)[5]['image']}",
      //             refernce:
      //                 referncevalues(formatvitalist(results)[5]['title'], loc),
      //             riskcol: convertFlutterColorToPdfColor(
      //                 formatvitalist(results)[5]["levelcol"] ?? primary),
      //             riskvale: formatvitalist(results)[5]["level"] ?? "-",
      //             value: formatvitalist(results)[5]["value"],
      //             child: pdfConfigWidget(
      //                 val: formatvitalist(results)[5]["value"],
      //                 lable: formatvitalist(results)[5]["title"],
      //                 loc: loc,font: ttfc,font1: ttfn)
      //                 ),
      //       ],
      //     )));
      if (checkscreenwidth(genratemediaquery(context).size.width) == "Small") {
        pdf.addPage(argenratepage(
            bg: bg.buffer.asUint8List(),
            loc: loc,
            //ttf: ttf,
            child: pw.Column(
              children: [
                pdfSliderCardReportCard(
                    font: loc==const Locale("ar")?ttf:ukrainefont,
                    labelw: formatvitalist(results)[6]['title'] ==
                            "Hemoglobin A1C"
                        ? pw.RichText(
                            text: pw.TextSpan(
                                text: fethvitalsdata(context, "Hemoglobin A1C"),
                                style: pw.TextStyle(font: ttf),
                                children: [
                                pw.WidgetSpan(
                                  child: pw.Text(
                                    "*",
                                    style: pw.TextStyle(
                                      color: PdfColor.fromHex("#FF0000"),
                                    ),
                                  ),
                                )
                              ]))
                        : null,
                    label: (formatvitalist(results)[6]['title'] as String?) ?? "-",
                    imageurl: "Vitals/${formatvitalist(results)[6]['image']}",
                    refernce: referncevalues(
                        formatvitalist(results)[6]['title'], loc),
                    riskcol: convertFlutterColorToPdfColor(
                        formatvitalist(results)[6]["levelcol"] as Color? ?? primary),
                    riskvale: (formatvitalist(results)[6]["level"] as String?) ?? "-",
                    value: (formatvitalist(results)[6]["value"] as String?),
                    child: arpdfConfigWidget(context,
                        val: formatvitalist(results)[6]["value"],
                        lable: formatvitalist(results)[6]["title"],
                        loc: loc,
                        font: loc==const Locale("ar")?ttfn:ukrainefont)),
                pw.SizedBox(height: 10),
                pdfSliderCardReportCard(
                    font: loc==const Locale("ar")?ttf:ukrainefont,
                    labelw: formatvitalist(results)[7]['title'] ==
                            "Hemoglobin A1C"
                        ? pw.RichText(
                            text:
                                pw.TextSpan(text: "Hemoglobin A1C", children: [
                            pw.WidgetSpan(
                              child: pw.Text(
                                "*",
                                style: pw.TextStyle(
                                    color: PdfColor.fromHex("#FF0000")),
                              ),
                            )
                          ]))
                        : null,
                    label: (formatvitalist(results)[7]['title'] as String?) ?? "-",
                    imageurl: "Vitals/${formatvitalist(results)[7]['image']}",
                    riskcol: convertFlutterColorToPdfColor(
                        formatvitalist(results)[7]["levelcol"] as Color? ?? primary),
                    riskvale: (formatvitalist(results)[7]["level"] as String?) ?? "-",
                    refernce: referncevalues(
                        formatvitalist(results)[7]['title'], loc),
                    value: (formatvitalist(results)[7]["value"] as String?),
                    child: arpdfConfigWidget(context,
                        val: (formatvitalist(results)[7]["value"] as String?),
                        lable: (formatvitalist(results)[7]["title"] as String?),
                        loc: loc,
                        font: loc==const Locale("ar")?ttfn:ukrainefont)),
              ],
            )));
      }

      pdf.addPage(argenratepage(
          bg: bg.buffer.asUint8List(),
          loc: loc,
          //ttf: ttf,
          child: pw.Column(
            children: [
              pdfSliderCardReportCard(
                  font: loc==const Locale("ar")?ttf:ukrainefont,
                  labelw: formatvitalist(results)[0]['title'] ==
                          "Hemoglobin A1C"
                      ? pw.RichText(
                          text: pw.TextSpan(text: "Hemoglobin A1C", children: [
                          pw.WidgetSpan(
                            child: pw.Text(
                              "*",
                              style: pw.TextStyle(
                                  color: PdfColor.fromHex("#FF0000")),
                            ),
                          )
                        ]))
                      : null,
                  label: (formatvitalist(results)[0]['title'] as String?) ?? "-",
                  imageurl: "Vitals/${formatvitalist(results)[0]['image']}",
                  refernce:
                      referncevalues(formatvitalist(results)[0]['title'], loc),
                  riskcol: convertFlutterColorToPdfColor(
                      formatvitalist(results)[0]["levelcol"] as Color? ?? primary),
                  riskvale: (formatvitalist(results)[0]["level"] as String?) ?? "-",
                  value: (formatvitalist(results)[0]["value"] as String?),
                  child: arpdfConfigWidget(context,
                      val: (formatvitalist(results)[0]["value"] as String?),
                      lable: (formatvitalist(results)[0]["title"] as String?),
                      loc: loc,
                      font: loc==const Locale("ar")?ttfn:ukrainefont)),
              pw.SizedBox(height: 10),
              pdfSliderCardReportCard(
                  font: loc==const Locale("ar")?ttf:ukrainefont,
                  labelw: formatvitalist(results)[3]['title'] ==
                          "Hemoglobin A1C"
                      ? pw.RichText(
                          text: pw.TextSpan(text: "Hemoglobin A1C", children: [
                          pw.WidgetSpan(
                            child: pw.Text(
                              "*",
                              style: pw.TextStyle(
                                  color: PdfColor.fromHex("#FF0000")),
                            ),
                          )
                        ]))
                      : null,
                  label: (formatvitalist(results)[3]['title'] as String?) ?? "-",
                  imageurl: "Vitals/${formatvitalist(results)[3]['image']}",
                  refernce:
                      referncevalues(formatvitalist(results)[3]['title'], loc),
                  riskcol: convertFlutterColorToPdfColor(
                      formatvitalist(results)[3]["levelcol"] as Color? ?? primary),
                  riskvale: (formatvitalist(results)[3]["level"] as String?) ?? "-",
                  value: (formatvitalist(results)[3]["value"] as String?),
                  child: arpdfConfigWidget(context,
                      val: (formatvitalist(results)[3]["value"] as String?),
                      lable: (formatvitalist(results)[3]["title"] as String?),
                      loc: loc,
                      font: loc==const Locale("ar")?ttfn:ukrainefont)),
            ],
          )));

      pdf.addPage(argenratepage(
          bg: bg.buffer.asUint8List(),
          loc: loc,
          //ttf: ttf,
          child: pw.Column(
            children: [
              pw.Table(columnWidths: {
                0: const pw.FlexColumnWidth(1.2),
                1: const pw.FlexColumnWidth(1),
                2: const pw.FlexColumnWidth(1)
              }, children: [
                pw.TableRow(children: [
                  arcolhead(lablel: fetchlocale(context).vitalsingn, font: loc==const Locale("ar")?ttf:ukrainefont),
                  arcolhead(lablel: fetchlocale(context).accur, font: loc==const Locale("ar")?ttf:ukrainefont),
                  pw.Container(
                      padding: const pw.EdgeInsets.symmetric(
                          vertical: 2, horizontal: 5),
                      color: convertFlutterColorToPdfColor(primary),
                      child: pw.Flexible(
                          child: pw.Text(fetchlocale(context).uim,
                              style: pw.TextStyle(
                                  font: loc==const Locale("ar")?ttf:ukrainefont,
                                  color: PdfColors.white,
                                  fontSize: 12.0),
                              textAlign: pw.TextAlign.center))),
                ]),
                pw.TableRow(children: [
                  argenrateblerow(
                      value: fetchlocale(context).pulseratee, font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "50-180", font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "bpm", font: loc==const Locale("ar")?ttf:ukrainefont),
                  // pw.Text(fetchlocale(context).pulseratee,
                  //     textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("50-180", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("bpm", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                ]),
                pw.TableRow(children: [
                  argenrateblerow(
                      value: fetchlocale(context).resperationrate, font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "8-30", font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "rpm", font: loc==const Locale("ar")?ttf:ukrainefont),
                  // pw.Text(fetchlocale(context).resperationrate,
                  //     textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("8-30", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("rpm", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                ]),
                pw.TableRow(children: [
                  argenrateblerow(
                      value: fetchlocale(context).blosys, font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(
                    value: "80-160",
                    font: loc==const Locale("ar")?ttf:ukrainefont,
                  ),
                  argenrateblerow(
                    value: "mmHg",
                    font: loc==const Locale("ar")?ttf:ukrainefont,
                  ),
                  // pw.Text(fetchlocale(context).blosys,
                  //     textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("80-160", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("mmHg", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                ]),
                pw.TableRow(children: [
                  argenrateblerow(
                      value: fetchlocale(context).blodia, font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "50-100", font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "mmHg", font: loc==const Locale("ar")?ttf:ukrainefont),
                  // pw.Text(fetchlocale(context).blodia,
                  //     textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("50-100", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("mmHg", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                ]),
                pw.TableRow(children: [
                  argenrateblerow(
                      value: "${fetchlocale(context).hemoglobin} *", font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "9-17", font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "g/dL", font: loc==const Locale("ar")?ttf:ukrainefont),
                  // pw.Text("${fetchlocale(context).hemoglobin} *",
                  //     textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("9-17", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("g/dL", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                ]),
                pw.TableRow(children: [
                  argenrateblerow(
                      value: "${fetchlocale(context).hemoglobina1c} *",
                      font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "3-8", font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "%", font: loc==const Locale("ar")?ttf:ukrainefont),
                  // pw.Text("${fetchlocale(context).hemoglobina1c} *",
                  //     textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("3-8", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("%", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                ]),
              ]),
              pw.SizedBox(height: 10),
              pw.Table(columnWidths: {
                0: const pw.FlexColumnWidth(1.2),
                1: const pw.FlexColumnWidth(1),
                2: const pw.FlexColumnWidth(1)
              }, children: [
                pw.TableRow(children: [
                  arcolhead(lablel: fetchlocale(context).vitalsingn, font: loc==const Locale("ar")?ttf:ukrainefont),
                  arcolhead(lablel: fetchlocale(context).resolution, font: loc==const Locale("ar")?ttf:ukrainefont),
                  arcolhead(lablel: fetchlocale(context).errl, font: loc==const Locale("ar")?ttf:ukrainefont)
                ]),
                pw.TableRow(children: [
                  argenrateblerow(
                      value: fetchlocale(context).pulseratee, font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "1", font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "RMSE <=3", font: loc==const Locale("ar")?ttf:ukrainefont),
                  // pw.Text(fetchlocale(context).pulseratee,
                  //     textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("1", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("RMSE <=3", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                ]),
                pw.TableRow(children: [
                  argenrateblerow(
                      value: fetchlocale(context).resperationrate, font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "1", font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "RMSE <=3", font: loc==const Locale("ar")?ttf:ukrainefont),
                  // pw.Text(fetchlocale(context).resperationrate,
                  //     textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("1", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("RMSE <=3", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                ]),
                pw.TableRow(children: [
                  argenrateblerow(
                      value: fetchlocale(context).blosys, font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "1", font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "MAE <=15", font: loc==const Locale("ar")?ttf:ukrainefont),
                  // pw.Text(fetchlocale(context).blosys,
                  //     textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("1", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("MAE <=15", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                ]),
                pw.TableRow(children: [
                  argenrateblerow(
                      value: fetchlocale(context).blodia, font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "1", font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "MAE <=10", font: loc==const Locale("ar")?ttf:ukrainefont),
                  // pw.Text(fetchlocale(context).blodia,
                  //     textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("1", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("MAE <=10", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                ]),
                pw.TableRow(children: [
                  argenrateblerow(
                      value: "${fetchlocale(context).hemoglobin} *", font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "0.1", font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "MAE <=1", font: loc==const Locale("ar")?ttf:ukrainefont),
                  // pw.Text("${fetchlocale(context).hemoglobin} *",
                  //     textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("0.1", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("MAE <=1", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                ]),
                pw.TableRow(children: [
                  argenrateblerow(
                      value: "${fetchlocale(context).hemoglobina1c} *",
                      font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "0.01", font: loc==const Locale("ar")?ttf:ukrainefont),
                  argenrateblerow(value: "MAE <=0.5", font: loc==const Locale("ar")?ttf:ukrainefont),
                  // pw.Text("${fetchlocale(context).hemoglobina1c} *",
                  //     textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("0.01", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                  // pw.Text("MAE <=0.5", textAlign: pw.TextAlign.center,style: pw.TextStyle(font: ttf)),
                ]),
              ]),
              //pw.Spacer(),
              pw.SizedBox(height: 10),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Text(fetchlocale(context).desclaimer,
                    style: pw.TextStyle(
                        font: loc==const Locale("ar")?ttf:ukrainefont,
                        fontSize: 15,
                        fontWeight: pw.FontWeight.bold)),
              ),
              pw.SizedBox(height: 10),
              pw.Container(
                child: pw.Padding(
                    padding: const pw.EdgeInsets.all(10),
                    child: pw.Flexible(
                        child: pw.Text(
                      fetchlocale(context).thexlcarezappis,
                      //"The XLcarez app uses AI to analyze results. These results are not a substitute for professional medical advice. Please consult a healthcare professional for accurate health assessments. XLcarez is not responsible for any issues caused by the results.",
                      style: pw.TextStyle(fontSize: 13.0, font: loc==const Locale("ar")?ttf:ukrainefont),
                    ))),
              ),
            ],
          )));

      final outputDir = await getApplicationDocumentsDirectory();
      final outputFile = File(
          '${outputDir.path}/${'${DateTime.now().toIso8601String()}${loc?.languageCode ?? "en"}'}.pdf');

      // Save the PDF
      await outputFile.writeAsBytes(await pdf.save()).whenComplete(() {
        setState(() {
          imagegenerate = false;
        });
      });
      XFile pdfxfile = XFile(outputFile.path);
      if (genratemediaquery(context).size.width < 700) {
        Share.shareXFiles(
          [pdfxfile],
          subject: ctrl.userData?["userName"] ?? "",
        );
      } else {
        //print("in ipad");
        Rect origin = Rect.fromLTWH(0, 0, MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height / 2);
        Share.shareXFiles(
          [pdfxfile],
          subject: ctrl.userData?["userName"] ?? "",
          sharePositionOrigin: origin,
        );
      }

      //('PDF saved at ${outputFile.path}');
    } catch (e) {
      setState(() {
        imagegenerate = false;
      });
      //print('Error creating PDF: $e');
    }
  }

  Future<void> convertImageToPdf(
    BuildContext context,
    Locale? loc,
  ) async {
    try {
      setState(() {
        imagegenerate = true;
      });
      final ctrl = Provider.of<Authcontroller>(context, listen: false);
      final vital = Provider.of<Vitalscontroller>(context, listen: false);
      var results = vital.vitalsData.toString().split(",");
      //final img = await rootBundle.load('assets/blulogo.png');
      final bg = await rootBundle.load("assets/logo.png");
      //final imageBytes = img.buffer.asUint8List();
      // pw.Image image1 = pw.Image(
      //   pw.MemoryImage(imageBytes),
      //   height: 150,
      // );
      final pdf = pw.Document();
      pdf.addPage(genratepage(
          bg: bg.buffer.asUint8List(),
          child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Divider(
                    height: 2,
                    color: convertFlutterColorToPdfColor(Colors.grey),
                    endIndent: 20.0),
                pw.SizedBox(height: 5),
                pw.Text(fetchlocale(context).personaldetails,
                    style: pw.TextStyle(
                        fontSize: 14, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 5),
                pw.Container(
                    padding: const pw.EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: pw.BoxDecoration(
                        border: pw.Border.all(
                            color: convertFlutterColorToPdfColor(
                                hintClr.withValues())),
                        borderRadius: pw.BorderRadius.circular(10)),
                    child: pw.Column(children: [
                      genratelabel(
                          label: fetchlocale(context).namee,
                          vale: ctrl.firstnamecontroller.text),
                      pw.Divider(
                          height: 1,
                          color: convertFlutterColorToPdfColor(
                              hintClr.withValues(alpha: 0.2))),
                      pw.SizedBox(height: 5),
                      genratelabel(
                          label: fetchlocale(context).phonee,
                          vale: ctrl.phonecontroller.text),
                      pw.Divider(
                          height: 1,
                          color: convertFlutterColorToPdfColor(
                              hintClr.withValues(alpha: 0.2))),
                      pw.SizedBox(height: 5),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            genratelabel(
                                label: fetchlocale(context).agee,
                                vale: ctrl.ageconteoller.text),
                            pw.VerticalDivider(
                                color: convertFlutterColorToPdfColor(hintClr),
                                width: 1),
                            genratelabel(
                                label: fetchlocale(context).gendere,
                                vale: ctrl.gender ?? "Male"),
                          ]),
                      pw.Divider(
                          height: 1,
                          color: convertFlutterColorToPdfColor(
                              hintClr.withValues(alpha: 0.2))),
                      pw.SizedBox(height: 5),
                      genratelabel(
                          label: fetchlocale(context).date_time,
                          vale: DateFormat("dd/MM/yy hh:mm a")
                              .format(DateTime.now())),
                      pw.Divider(
                          height: 1,
                          color: convertFlutterColorToPdfColor(
                              hintClr.withValues(alpha: 0.2))),
                      pw.SizedBox(height: 5),
                    ])),
                pw.SizedBox(height: 10),
                pdfSliderCardReportCard(
                    labelw: formatvitalist(results)[2]['title'] ==
                            "Hemoglobin A1C"
                        ? pw.RichText(
                            text:
                                pw.TextSpan(text: "Hemoglobin A1C", children: [
                            pw.WidgetSpan(
                              child: pw.Text(
                                "*",
                                style: pw.TextStyle(
                                    color: PdfColor.fromHex("#FF0000")),
                              ),
                            )
                          ]))
                        : null,
                    label: (formatvitalist(results)[2]['title'] as String?) ?? "-",
                    refernce: referncevalues(
                        formatvitalist(results)[2]['title'], loc),
                    imageurl: "Vitals/${formatvitalist(results)[2]['image']}",
                    riskcol: convertFlutterColorToPdfColor(
                        formatvitalist(results)[2]["levelcol"] as Color? ?? primary),
                    riskvale: (formatvitalist(results)[2]["level"] as String?) ?? "-",
                    value: (formatvitalist(results)[2]["value"] as String?),
                    child: pdfConfigWidget(context,
                        val: (formatvitalist(results)[2]["value"] as String?),
                        lable: (formatvitalist(results)[2]["title"] as String?),
                        loc: loc)),
                pw.SizedBox(height: 10),
                pdfSliderCardReportCard(
                    labelw: formatvitalist(results)[1]['title'] ==
                            "Hemoglobin A1C"
                        ? pw.RichText(
                            text:
                                pw.TextSpan(text: "Hemoglobin A1C", children: [
                            pw.WidgetSpan(
                              child: pw.Text(
                                "*",
                                style: pw.TextStyle(
                                    color: PdfColor.fromHex("#FF0000")),
                              ),
                            )
                          ]))
                        : null,
                    label: (formatvitalist(results)[1]['title'] as String?) ?? "-",
                    imageurl: "Vitals/${formatvitalist(results)[1]['image']}",
                    refernce: referncevalues(
                        formatvitalist(results)[1]['title'], loc),
                    riskcol: convertFlutterColorToPdfColor(
                        formatvitalist(results)[1]["levelcol"] as Color? ?? primary),
                    riskvale: (formatvitalist(results)[1]["level"] as String?) ?? "-",
                    value: (formatvitalist(results)[1]["value"] as String?),
                    child: pdfConfigWidget(context,
                        val: formatvitalist(results)[1]["value"],
                        lable: formatvitalist(results)[1]["title"],
                        loc: loc)),
              ])));

      pdf.addPage(genratepage(
          bg: bg.buffer.asUint8List(),
          child: pw.Column(
            children: [
              pdfSliderCardReportCard(
                  labelw: formatvitalist(results)[4]['title'] ==
                          "Hemoglobin A1C"
                      ? pw.RichText(
                          text: pw.TextSpan(text: "Hemoglobin A1C", children: [
                          pw.WidgetSpan(
                            child: pw.Text(
                              "*",
                              style: pw.TextStyle(
                                  color: PdfColor.fromHex("#FF0000")),
                            ),
                          )
                        ]))
                      : null,
                  label: (formatvitalist(results)[4]['title'] as String?) ?? "-",
                  imageurl: "Vitals/${formatvitalist(results)[4]['image']}",
                  refernce:
                      referncevalues(formatvitalist(results)[4]['title'], loc),
                  riskcol: convertFlutterColorToPdfColor(
                      formatvitalist(results)[4]["levelcol"] as Color? ?? primary),
                  riskvale: (formatvitalist(results)[4]["level"] as String?) ?? "-",
                  value: (formatvitalist(results)[4]["value"] as String?),
                  child: pdfConfigWidget(context,
                      val: (formatvitalist(results)[4]["value"] as String?),
                      lable: (formatvitalist(results)[4]["title"] as String?),
                      loc: loc)),
              pw.SizedBox(height: 10),
              pdfSliderCardReportCard(
                  labelw: formatvitalist(results)[5]['title'] ==
                          "Hemoglobin A1C"
                      ? pw.RichText(
                          text: pw.TextSpan(text: "Hemoglobin A1C", children: [
                          pw.WidgetSpan(
                            child: pw.Text(
                              "*",
                              style: pw.TextStyle(
                                  color: PdfColor.fromHex("#FF0000")),
                            ),
                          )
                        ]))
                      : null,
                  label: (formatvitalist(results)[5]['title'] as String?) ?? "-",
                  imageurl: "Vitals/${formatvitalist(results)[5]['image']}",
                  refernce:
                      referncevalues(formatvitalist(results)[5]['title'], loc),
                  riskcol: convertFlutterColorToPdfColor(
                      formatvitalist(results)[5]["levelcol"] as Color? ?? primary),
                  riskvale: (formatvitalist(results)[5]["level"] as String?) ?? "-",
                  value: (formatvitalist(results)[5]["value"] as String?),
                  child: pdfConfigWidget(context,
                      val: (formatvitalist(results)[5]["value"] as String?),
                      lable: (formatvitalist(results)[5]["title"] as String?),
                      loc: loc)),
            ],
          )));

      if (checkscreenwidth(genratemediaquery(context).size.width) == "Small") {
        pdf.addPage(genratepage(
            bg: bg.buffer.asUint8List(),
            child: pw.Column(
              children: [
                pdfSliderCardReportCard(
                    labelw: formatvitalist(results)[6]['title'] ==
                            "Hemoglobin A1C"
                        ? pw.RichText(
                            text: pw.TextSpan(
                                text: fethvitalsdata(context, "Hemoglobin A1C"),
                                children: [
                                pw.WidgetSpan(
                                  child: pw.Text(
                                    "*",
                                    style: pw.TextStyle(
                                        color: PdfColor.fromHex("#FF0000")),
                                  ),
                                )
                              ]))
                        : null,
                    label: (formatvitalist(results)[6]['title'] as String?) ?? "-",
                    imageurl: "Vitals/${formatvitalist(results)[6]['image']}",
                    refernce: referncevalues(
                        formatvitalist(results)[6]['title'], loc),
                    riskcol: convertFlutterColorToPdfColor(
                        formatvitalist(results)[6]["levelcol"] as Color? ?? primary),
                    riskvale: (formatvitalist(results)[6]["level"] as String?) ?? "-",
                    value: (formatvitalist(results)[6]["value"] as String?),
                    child: pdfConfigWidget(context,
                        val: (formatvitalist(results)[6]["value"] as String?),
                        lable: (formatvitalist(results)[6]["title"] as String?),
                        loc: loc)),
                pw.SizedBox(height: 10),
                pdfSliderCardReportCard(
                    labelw: formatvitalist(results)[7]['title'] ==
                            "Hemoglobin A1C"
                        ? pw.RichText(
                            text:
                                pw.TextSpan(text: "Hemoglobin A1C", children: [
                            pw.WidgetSpan(
                              child: pw.Text(
                                "*",
                                style: pw.TextStyle(
                                    color: PdfColor.fromHex("#FF0000")),
                              ),
                            )
                          ]))
                        : null,
                    label: (formatvitalist(results)[7]['title'] as String?) ?? "-",
                    imageurl: "Vitals/${formatvitalist(results)[7]['image']}",
                    riskcol: convertFlutterColorToPdfColor(
                        formatvitalist(results)[7]["levelcol"] as Color? ?? primary),
                    riskvale: (formatvitalist(results)[7]["level"] as String?) ?? "-",
                    refernce: referncevalues(
                        formatvitalist(results)[7]['title'], loc),
                    value: (formatvitalist(results)[7]["value"] as String?),
                    child: pdfConfigWidget(context,
                        val: (formatvitalist(results)[7]["value"] as String?),
                        lable: (formatvitalist(results)[7]["title"] as String?),
                        loc: loc)),
              ],
            )));
      }
      // pdf.addPage(genratepage(
      //     bg: bg.buffer.asUint8List(),
      //     child: pw.Column(
      //       children: [
      //         pdfSliderCardReportCard(
      //             labelw: formatvitalist(results)[6]['title'] ==
      //                     "Hemoglobin A1C"
      //                 ? pw.RichText(
      //                     text: pw.TextSpan(
      //                         text: fethvitalsdata(context, "Hemoglobin A1C"),
      //                         children: [
      //                         pw.WidgetSpan(
      //                           child: pw.Text(
      //                             "*",
      //                             style: pw.TextStyle(
      //                                 color: PdfColor.fromHex("#FF0000")),
      //                           ),
      //                         )
      //                       ]))
      //                 : null,
      //             label: formatvitalist(results)[6]['title'] ?? "-",
      //             imageurl: "Vitals/${formatvitalist(results)[6]['image']}",
      //             refernce:
      //                 referncevalues(formatvitalist(results)[6]['title'], loc),
      //             riskcol: convertFlutterColorToPdfColor(
      //                 formatvitalist(results)[6]["levelcol"] ?? primary),
      //             riskvale: formatvitalist(results)[6]["level"] ?? "-",
      //             value: formatvitalist(results)[6]["value"],
      //             child: pdfConfigWidget(context,
      //                 val: formatvitalist(results)[6]["value"],
      //                 lable: formatvitalist(results)[6]["title"],
      //                 loc: loc)),
      //         pw.SizedBox(height: 10),
      //         pdfSliderCardReportCard(
      //             labelw: formatvitalist(results)[7]['title'] ==
      //                     "Hemoglobin A1C"
      //                 ? pw.RichText(
      //                     text: pw.TextSpan(text: "Hemoglobin A1C", children: [
      //                     pw.WidgetSpan(
      //                       child: pw.Text(
      //                         "*",
      //                         style: pw.TextStyle(
      //                             color: PdfColor.fromHex("#FF0000")),
      //                       ),
      //                     )
      //                   ]))
      //                 : null,
      //             label: formatvitalist(results)[7]['title'] ?? "-",
      //             imageurl: "Vitals/${formatvitalist(results)[7]['image']}",
      //             riskcol: convertFlutterColorToPdfColor(
      //                 formatvitalist(results)[7]["levelcol"] ?? primary),
      //             riskvale: formatvitalist(results)[7]["level"] ?? "-",
      //             refernce:
      //                 referncevalues(formatvitalist(results)[7]['title'], loc),
      //             value: formatvitalist(results)[7]["value"],
      //             child: pdfConfigWidget(context,
      //                 val: formatvitalist(results)[7]["value"],
      //                 lable: formatvitalist(results)[7]["title"],
      //                 loc: loc)),
      //       ],
      //     )));

      pdf.addPage(genratepage(
          bg: bg.buffer.asUint8List(),
          child: pw.Column(
            children: [
              pdfSliderCardReportCard(
                  labelw: formatvitalist(results)[0]['title'] ==
                          "Hemoglobin A1C"
                      ? pw.RichText(
                          text: pw.TextSpan(text: "Hemoglobin A1C", children: [
                          pw.WidgetSpan(
                            child: pw.Text(
                              "*",
                              style: pw.TextStyle(
                                  color: PdfColor.fromHex("#FF0000")),
                            ),
                          )
                        ]))
                      : null,
                  label: (formatvitalist(results)[0]['title'] as String?) ?? "-",
                  imageurl: "Vitals/${formatvitalist(results)[0]['image']}",
                  refernce:
                      referncevalues(formatvitalist(results)[0]['title'], loc),
                  riskcol: convertFlutterColorToPdfColor(
                      formatvitalist(results)[0]["levelcol"] as Color? ?? primary),
                  riskvale: (formatvitalist(results)[0]["level"] as String?) ?? "-",
                  value: (formatvitalist(results)[0]["value"] as String?),
                  child: pdfConfigWidget(context,
                      val: (formatvitalist(results)[0]["value"] as String?),
                      lable: (formatvitalist(results)[0]["title"] as String?),
                      loc: loc)),
              pw.SizedBox(height: 10),
              pdfSliderCardReportCard(
                  labelw: formatvitalist(results)[3]['title'] ==
                          "Hemoglobin A1C"
                      ? pw.RichText(
                          text: pw.TextSpan(text: "Hemoglobin A1C", children: [
                          pw.WidgetSpan(
                            child: pw.Text(
                              "*",
                              style: pw.TextStyle(
                                  color: PdfColor.fromHex("#FF0000")),
                            ),
                          )
                        ]))
                      : null,
                  label: (formatvitalist(results)[3]['title'] as String?) ?? "-",
                  imageurl: "Vitals/${formatvitalist(results)[3]['image']}",
                  refernce:
                      referncevalues(formatvitalist(results)[3]['title'], loc),
                  riskcol: convertFlutterColorToPdfColor(
                      formatvitalist(results)[3]["levelcol"] as Color? ?? primary),
                  riskvale: (formatvitalist(results)[3]["level"] as String?) ?? "-",
                  value: (formatvitalist(results)[3]["value"] as String?),
                  child: pdfConfigWidget(context,
                      val: (formatvitalist(results)[3]["value"] as String?),
                      lable: (formatvitalist(results)[3]["title"] as String?),
                      loc: loc)),
            ],
          )));

      pdf.addPage(genratepage(
          bg: bg.buffer.asUint8List(),
          child: pw.Column(
            children: [
              pw.Table(columnWidths: {
                0: const pw.FlexColumnWidth(1.2),
                1: const pw.FlexColumnWidth(1),
                2: const pw.FlexColumnWidth(1)
              }, children: [
                pw.TableRow(children: [
                  colhead(lablel: fetchlocale(context).vitalsingn),
                  colhead(lablel: fetchlocale(context).accur),
                  pw.Container(
                      padding: const pw.EdgeInsets.symmetric(
                          vertical: 2, horizontal: 5),
                      color: convertFlutterColorToPdfColor(primary),
                      child: pw.Flexible(
                          child: pw.Text(fetchlocale(context).uim,
                              style: const pw.TextStyle(
                                  color: PdfColors.white, fontSize: 12.0),
                              textAlign: pw.TextAlign.center))),
                ]),
                pw.TableRow(children: [
                  pw.Text(fetchlocale(context).pulseratee,
                      textAlign: pw.TextAlign.center),
                  pw.Text("50-180", textAlign: pw.TextAlign.center),
                  pw.Text("bpm", textAlign: pw.TextAlign.center),
                ]),
                pw.TableRow(children: [
                  pw.Text(fetchlocale(context).resperationrate,
                      textAlign: pw.TextAlign.center),
                  pw.Text("8-30", textAlign: pw.TextAlign.center),
                  pw.Text("rpm", textAlign: pw.TextAlign.center),
                ]),
                pw.TableRow(children: [
                  pw.Text(fetchlocale(context).blosys,
                      textAlign: pw.TextAlign.center),
                  pw.Text("80-160", textAlign: pw.TextAlign.center),
                  pw.Text("mmHg", textAlign: pw.TextAlign.center),
                ]),
                pw.TableRow(children: [
                  pw.Text(fetchlocale(context).blodia,
                      textAlign: pw.TextAlign.center),
                  pw.Text("50-100", textAlign: pw.TextAlign.center),
                  pw.Text("mmHg", textAlign: pw.TextAlign.center),
                ]),
                pw.TableRow(children: [
                  pw.Text("${fetchlocale(context).hemoglobin} *",
                      textAlign: pw.TextAlign.center),
                  pw.Text("9-17", textAlign: pw.TextAlign.center),
                  pw.Text("g/dL", textAlign: pw.TextAlign.center),
                ]),
                pw.TableRow(children: [
                  pw.Text("${fetchlocale(context).hemoglobina1c} *",
                      textAlign: pw.TextAlign.center),
                  pw.Text("3-8", textAlign: pw.TextAlign.center),
                  pw.Text("%", textAlign: pw.TextAlign.center),
                ]),
              ]),
              pw.SizedBox(height: 10),
              pw.Table(columnWidths: {
                0: const pw.FlexColumnWidth(1.2),
                1: const pw.FlexColumnWidth(1),
                2: const pw.FlexColumnWidth(1)
              }, children: [
                pw.TableRow(children: [
                  colhead(lablel: fetchlocale(context).vitalsingn),
                  colhead(lablel: fetchlocale(context).resolution),
                  colhead(lablel: fetchlocale(context).errl)
                ]),
                pw.TableRow(children: [
                  pw.Text(fetchlocale(context).pulseratee,
                      textAlign: pw.TextAlign.center),
                  pw.Text("1", textAlign: pw.TextAlign.center),
                  pw.Text("RMSE <=3", textAlign: pw.TextAlign.center),
                ]),
                pw.TableRow(children: [
                  pw.Text(fetchlocale(context).resperationrate,
                      textAlign: pw.TextAlign.center),
                  pw.Text("1", textAlign: pw.TextAlign.center),
                  pw.Text("RMSE <=3", textAlign: pw.TextAlign.center),
                ]),
                pw.TableRow(children: [
                  pw.Text(fetchlocale(context).blosys,
                      textAlign: pw.TextAlign.center),
                  pw.Text("1", textAlign: pw.TextAlign.center),
                  pw.Text("MAE <=15", textAlign: pw.TextAlign.center),
                ]),
                pw.TableRow(children: [
                  pw.Text(fetchlocale(context).blodia,
                      textAlign: pw.TextAlign.center),
                  pw.Text("1", textAlign: pw.TextAlign.center),
                  pw.Text("MAE <=10", textAlign: pw.TextAlign.center),
                ]),
                pw.TableRow(children: [
                  pw.Text("${fetchlocale(context).hemoglobin} *",
                      textAlign: pw.TextAlign.center),
                  pw.Text("0.1", textAlign: pw.TextAlign.center),
                  pw.Text("MAE <=1", textAlign: pw.TextAlign.center),
                ]),
                pw.TableRow(children: [
                  pw.Text("${fetchlocale(context).hemoglobina1c} *",
                      textAlign: pw.TextAlign.center),
                  pw.Text("0.01", textAlign: pw.TextAlign.center),
                  pw.Text("MAE <=0.5", textAlign: pw.TextAlign.center),
                ]),
              ]),
              //pw.Spacer(),
              pw.SizedBox(height: 10),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Text(fetchlocale(context).desclaimer,
                    style: pw.TextStyle(
                        fontSize: 15, fontWeight: pw.FontWeight.bold)),
              ),
              pw.SizedBox(height: 10),
              pw.Container(
                child: pw.Padding(
                    padding: const pw.EdgeInsets.all(10),
                    child: pw.Flexible(
                        child: pw.Text(
                      fetchlocale(context).thexlcarezappis,
                      //"The XLcarez app uses AI to analyze results. These results are not a substitute for professional medical advice. Please consult a healthcare professional for accurate health assessments. XLcarez is not responsible for any issues caused by the results.",
                      style: const pw.TextStyle(fontSize: 13.0),
                    ))),
              ),
            ],
          )));

      final outputDir = await getApplicationDocumentsDirectory();
      final outputFile = File(
          '${outputDir.path}/${'${DateTime.now().toIso8601String()}${loc?.languageCode ?? "en"}'}.pdf');

      // Save the PDF
      await outputFile.writeAsBytes(await pdf.save()).whenComplete(() {
        setState(() {
          imagegenerate = false;
        });
      });
      XFile pdfxfile = XFile(outputFile.path);
      if (genratemediaquery(context).size.width < 700) {
        Share.shareXFiles(
          [pdfxfile],
          subject: ctrl.userData?["userName"] ?? "",
        );
      } else {
        //print("in ipad");
        Rect origin = Rect.fromLTWH(0, 0, MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height / 2);
        Share.shareXFiles(
          [pdfxfile],
          subject: ctrl.userData?["userName"] ?? "",
          sharePositionOrigin: origin,
        );
      }

      //('PDF saved at ${outputFile.path}');
    } catch (e) {
      setState(() {
        imagegenerate = false;
      });
      //print('Error creating PDF: $e');
    }
  }

  pw.Widget pdfSliderCardReportCard({
    pw.RichText? labelw,
    String? label,
    PdfColor? riskcol,
    String? riskvale,
    String? imageurl,
    String? refernce,
    String? value,
    pw.Widget? child,
    font,
  }) {
    return pw.Directionality(
        textDirection:
            font != null ? pw.TextDirection.rtl : pw.TextDirection.ltr,
        child: pw.Container(
          // Replace with a suitable background color equivalent
          padding: const pw.EdgeInsets.all(8.0),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Table(columnWidths: {
                0: const pw.FlexColumnWidth(1.2),
                1: const pw.FlexColumnWidth(1),
                2: const pw.FlexColumnWidth(1.2)
              }, children: [
                pw.TableRow(children: [
                  font != null
                      ? arcolhead(
                          lablel: fetchlocale(context).investigation,
                          font: font)
                      : colhead(
                          lablel: fetchlocale(context).investigation,
                        ),
                  font != null
                      ? arcolhead(
                          lablel: fetchlocale(context).observedval, font: font)
                      : colhead(
                          lablel: fetchlocale(context).observedval,
                        ),
                  font != null
                      ? arcolhead(lablel: fetchlocale(context).brr, font: font)
                      : colhead(
                          lablel: fetchlocale(context).brr,
                        ),
                  // colhead(
                  //   lablel: fetchlocale(context).observedval,
                  // ),
                  // colhead(
                  //   lablel: fetchlocale(context).brr,
                  // )
                ]),
                pw.TableRow(children: [
                  font != null
                      ? argenrateblerow(
                          value: fethvitalsdata(context, label), font: font)
                      : genrateblerow(
                          value: fethvitalsdata(context, label),
                        ),
                  font != null
                      ? argenrateblerow(value: value ?? "-", font: font)
                      : genrateblerow(
                          value: value ?? "-",
                        ),
                  font != null
                      ? argenrateblerow(
                          value: refernce != null
                              ? refernce.replaceAll("Reference Range:", "")
                              : "-",
                          font: font)
                      : genrateblerow(
                          value: refernce != null
                              ? refernce.replaceAll("Reference Range:", "")
                              : "-",
                        ),
                ])
              ]),
              // pw.Container(
              //   // padding: const pw.EdgeInsets.symmetric(horizontal: 2),
              //   decoration: pw.BoxDecoration(
              //       border: pw.Border.all(
              //           color: convertFlutterColorToPdfColor(Colors.black))),
              //   child: pw.Row(
              //       //mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
              //       children: [
              //         pw.SizedBox(width: 10),
              //         pw.Text(fetchlocale(context).investigation,
              //             textAlign: pw.TextAlign.center,
              //             style: pw.TextStyle(
              //                 font: font,
              //                 fontSize: 13,
              //                 fontWeight: pw.FontWeight.bold)),
              //                 pw.SizedBox(width: 10),
              //         pw.Text(fetchlocale(context).observedval,
              //             textAlign: pw.TextAlign.center,
              //             style: pw.TextStyle(
              //               fontSize: 13,
              //               font: font,
              //               fontWeight: pw.FontWeight.bold,
              //             )),
              //             pw.SizedBox(width: 10),
              //         pw.Text(fetchlocale(context).brr,
              //             textAlign: pw.TextAlign.center,
              //             style: pw.TextStyle(
              //                 font: font,
              //                 fontSize: 13,
              //                 fontWeight: pw.FontWeight.bold)),
              //       ]),
              // ),
              // pw.SizedBox(height: 5),
              // pw.Container(
              //   decoration: pw.BoxDecoration(
              //       border: pw.Border.all(
              //           color: convertFlutterColorToPdfColor(Colors.black))),
              //   // padding: const pw.EdgeInsets.symmetric(horizontal: 2),
              //   child: pw.Row(
              //       mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
              //       children: [
              //         labelw ??
              //             pw.Text(
              //               fethvitalsdata(context, label),
              //               //label ?? "",
              //               textAlign: pw.TextAlign.center,
              //               style: pw.TextStyle(fontSize: 13, font: font),
              //             ),
              //         pw.Text(
              //           textAlign: pw.TextAlign.center,
              //           value ?? "-",
              //           style: pw.TextStyle(fontSize: 14, font: font),
              //         ),
              //         pw.Text(
              //           textAlign: pw.TextAlign.center,
              //           refernce != null
              //               ? refernce.replaceAll("Reference Range:", "")
              //               : "-",
              //           style: pw.TextStyle(
              //               fontSize: 13,
              //               font: font), // Adjust font size as needed
              //         ),
              //       ]),
              // ),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: (riskvale != "-" && riskvale != null)
                    ? pw.Container(
                        margin: const pw.EdgeInsets.symmetric(vertical: 4),
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        decoration: pw.BoxDecoration(
                          border:
                              pw.Border.all(color: riskcol ?? PdfColors.black),
                          borderRadius: pw.BorderRadius.circular(10),
                          color: PdfColor.fromHex("FFFFFF"),
                        ),
                        child: pw.Text(
                          fetchlevels(context, riskvale),
                          // riskvale[0].toUpperCase() +
                          //     riskvale.substring(1), // Capitalize
                          style: pw.TextStyle(
                            fontSize: 12,
                            font: font,
                            color: riskcol ?? PdfColors.black,
                          ),
                        ),
                      )
                    : pw.SizedBox(),
              ),
              child ?? pw.SizedBox.shrink(),
            ],
          ),
        ));
  }
}
