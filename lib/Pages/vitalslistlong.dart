// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, use_build_context_synchronously

import 'dart:io';
import 'package:XLcarez/env/appexports.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class VitalList extends StatefulWidget {
  var from;
  VitalList({
    super.key,
    this.from = "",
  });

  @override
  State<VitalList> createState() => _VitalListState();
}

class _VitalListState extends State<VitalList> {
  @override
  Widget build(BuildContext context) {
    //log(widget.date??"");
    return MyThemeGradient(
      color: widget.from == "Long" ? [transparentcol, transparentcol] : null,
      child: Consumer2<Vitalscontroller, Authcontroller>(
          builder: (_, ctrl, auth, child) {
        return Scaffold(
          appBar: widget.from == "Long"
              ? null
              : Themeappbar(
                  title: fetchlocale(context).dlvitalscans,
                  centtile: true,
                  leading: true,
                ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: scaffoldbgcol,
                surfaceTintColor: scaffoldbgcol,
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                title: buildWeekSelectormod(
                    date: ctrl.datetime,
                    arrowback: () {
                      var date = ctrl.datetime.subtract(const Duration(days: 7));
                      ctrl.chnagedate(date);
                      // setState(() {
                      //   // _dateTime = _dateTime =
                      //   //     _dateTime.subtract(const Duration(days: 7));
                      // });
                    },
                    arrowup: () {
                      var data = ctrl.datetime.add(const Duration(days: 7));
                      if (data.isAfter(getLastDateOfWeek())) {
                        // print("control");
                      } else {
                        var date = ctrl.datetime.subtract(
                            Duration(days: ctrl.datetime.weekday - 1));
                        ctrl.chnagedate(date);
                        var date2 = ctrl.datetime.add(const Duration(days: 7));
                        ctrl.chnagedate(date2);

                        // setState(() {
                        //   _dateTime = _dateTime.subtract(
                        //       Duration(days: _dateTime.weekday - 1));
                        //   _dateTime =
                        //       _dateTime.add(const Duration(days: 7));
                        // });
                      }
                    },
                    caltap: () async {
                      if (Platform.isIOS) {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (_) {
                              return SizedBox(
                                  height: 250,
                                  width: MediaQuery.of(context).size.width,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    backgroundColor: bgClr2,
                                    onDateTimeChanged: (picked) {
                                      ctrl.chnagedate(picked);
                                      // setState(() {
                                      //   _dateTime = picked;
                                      // });
                                    },
                                    initialDateTime: DateTime.now(),
                                    minimumDate: DateTime(1900),
                                    maximumDate: DateTime.now(),
                                  ));
                            });
                      } else {
                        final DateTime? picked = await showDatePicker(
                          builder: (_, child) {
                            return Theme(
                                data: calendertheme(context), child: child!);
                          },
                          context: context,
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          ctrl.chnagedate(picked);
                          // setState(() {
                          //   _dateTime = picked;
                          // });
                        }
                      }
                    }),
              ),
              SliverAppBar(
                backgroundColor: scaffoldbgcol,
                surfaceTintColor: scaffoldbgcol,
                automaticallyImplyLeading: false,
                pinned: true,
                expandedHeight: 60.0,
                title: _buildWeekdaySelector(),
              ),
              SliverToBoxAdapter(
                  child: ctrl.getallvitalsload
                      ? loader()
                      : const SizedBox.shrink()),
              SliverToBoxAdapter(
                  child: ctrl.getallvitals
                          .where((ele) =>
                              DateFormat("dd/MM/yyyy").format(
                                  DateTime.parse("${ele.createdDate}Z")) ==
                              DateFormat("dd/MM/yyyy").format(ctrl.datetime))
                          .isEmpty
                      ? const Nodatafound()
                      : const SizedBox.shrink()),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverList.separated(
                    itemCount: ctrl.getallvitals
                        .where((ele) =>
                            DateFormat("dd/MM/yyyy").format(
                                DateTime.parse("${ele.createdDate}Z")) ==
                            DateFormat("dd/MM/yyyy").format(ctrl.datetime))
                        .length,
                    itemBuilder: (_, i) {
                      final filterlist = ctrl.getallvitals
                          .where((ele) =>
                              DateFormat("dd/MM/yyyy").format(
                                  DateTime.parse("${ele.createdDate}Z")) ==
                              DateFormat("dd/MM/yyyy").format(ctrl.datetime))
                          .toList();
                      //print((DateFormat("dd/MM/yyyy").format(_dateTime)));
                      return Theme(
                          data: ThemeData(dividerColor: Colors.transparent),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: ExpansionTile(
                              //initiallyExpanded: i == 0,
                              collapsedBackgroundColor: transparentcol,
                              collapsedShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: Apptextwidget(
                                DateFormat("hh:mm a").format(DateTime.parse(
                                        "${filterlist[i].createdDate}Z")
                                    .toLocal()),
                                style: TxtStls.wstl14,
                              ),
                              children: filterlist
                                  .where((r) =>
                                      r.createdDate ==
                                      filterlist[i].createdDate)
                                  .map((o) => formatvitals(context, o))
                                  .toList(),
                            ),
                          ));
                    },
                    separatorBuilder: (_, i) {
                      return appspace(h: 5);
                    }),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget _buildWeekdaySelector() {
    return Consumer<Vitalscontroller>(builder: (_, ctrl, child) {
      List<Widget> dayButtons = [];
      DateTime weekStart =
          ctrl.datetime.subtract(Duration(days: ctrl.datetime.weekday - 1));
      for (int i = 0; i < 7; i++) {
        DateTime currentDate = weekStart.add(Duration(days: i));
        dayButtons.add(
          GestureDetector(
            onTap: DateTime.parse(currentDate.toString().split(" ")[0]).isAfter(
                    DateTime.parse(DateTime.now().toString().split(" ")[0]))
                ? () {
                    Fluttertoast.showToast(msg: fetchlocale(context).youcantch);
                  }
                : () {
                    ctrl.chnagedate(currentDate);
                    // setState(() {
                    //   _dateTime = currentDate;
                    // });
                  },
            child: Container(
              height: 70,
              width: 40,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ctrl.datetime == currentDate ? primary : scaffoldbgcol,
                border: Border.all(
                    color:
                        ctrl.datetime == currentDate ? primary : scaffoldbgcol),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  appspace(h: 5),
                  Apptextwidget(
                    DateFormat('EEE').format(currentDate).substring(0, 1),
                    style: ctrl.datetime == currentDate
                        ? TxtStls.wstl12
                        : TxtStls.stl12,
                  ),
                  appspace(h: 2),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: ctrl.datetime == currentDate
                        ? scaffoldbgcol
                        : transparentcol,
                    child: Apptextwidget(
                      DateFormat('dd').format(currentDate),
                      style: TxtStls.stl12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: dayButtons,
      );
    });
  }
}

CrossFadeState crossFadeState = CrossFadeState.showFirst;
Widget checkui(conext, Vitalmodel model) {
  return Consumer<Vitalscontroller>(
    builder: (context,ctrl,child) {
      return StatefulBuilder(builder: (conext, set) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible:ctrl.getallvitals.where((ele)=>ele.recordType=="Scan").isNotEmpty,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: scaffoldbgcol),
                      onPressed: () async {
                        final ctrl =
                            Provider.of<Authcontroller>(conext, listen: false);
                        //commonlauncth(url: "https://baithnabot.tribandtech.com:7879/superset/dashboard/32/?native_filters_key=WgZdFDrwksD8nBOMGWplFHAJq5BChMRWJFOZyC3U8cCfDtCn2atMfKsEUSNpTlif&userid=${await ctrl.fethuserid()}&standalone=3");
                        navigationSlide(
                            conext, Vitalgraph(id: await ctrl.fethuserid()));
                      },
                      icon: Icon(
                        Icons.timeline,
                        color: hintClr,
                      ),
                      label: Apptextwidget(
                        fetchlocale(conext).viewtrends,
                        style: TxtStls.labelStl,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          set(() {
                            if (crossFadeState == CrossFadeState.showFirst) {
                              crossFadeState = CrossFadeState.showSecond;
                            } else {
                              crossFadeState = CrossFadeState.showFirst;
                            }
                          });
                        },
                        icon: Icon(
                          crossFadeState == CrossFadeState.showFirst
                              ? Icons.grid_on
                              : Icons.layers,
                          color: scaffoldbgcol,
                        )),
                    TextButton(
                        onPressed: () {
                          navigationSlide(conext, VitalList());
                        },
                        child: Apptextwidget(
                          fetchlocale(conext).viewall,
                          style: TxtStls.wstl12,
                        )),
                  ],
                ),
              ],
            ),
            appspace(h: 10),
            labelhead(h: model.height, w: model.weight, bmi: model.bmi),
            AnimatedCrossFade(
                firstChild: SizedBox(
                  height: genratemediaquery(conext).size.height / 3.5,
                  width: double.infinity,
                  child: FlutterCarousel(
                    options: FlutterCarouselOptions(
                      viewportFraction:
                          checkscreenwidth(genratemediaquery(conext).size.width) ==
                                  "Small"
                              ? 0.5
                              : checkscreenwidth(
                                          genratemediaquery(conext).size.width) ==
                                      "Medium"
                                  ? 0.35
                                  : 0.16,
                      autoPlayAnimationDuration: const Duration(milliseconds: 200),
                      autoPlayInterval: const Duration(seconds: 2),
                      autoPlay: true,
                      showIndicator: true,
                      slideIndicator: CircularWaveSlideIndicator(),
                    ),
                    items: formatlist(model)
                      .where((ele) =>
                          ele["value"] != null && ele["value"] != "null")
                      .toList()
                        .map((e) => vitalCard(
                              conext,
                              radius: 90.0,
                              stroke: 20.0,
                              col: e["col"],
                              title: fethvitalsdata(conext, e["title"]),
                              label: e["title"],
                              value: e["value"],
                              confidence: e["confidence"],
                              url: e["image"],
                              level: e["level"],
                              levelcol: e["levelcol"],
                            ))
                        .toList(),
                  ),
                ),
                secondChild: GridView.builder(
                  itemCount: formatlist(model)
                      .where((ele) =>
                          ele["value"] != null && ele["value"] != "null")
                      .toList().length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          checkscreenwidth(genratemediaquery(conext).size.width) ==
                                  "Small"
                              ? 2
                              : checkscreenwidth(
                                          genratemediaquery(conext).size.width) ==
                                      "Medium"
                                  ? 4
                                  : 5,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.8),
                  itemBuilder: (_, i) {
                    var data = formatlist(model)
                      .where((ele) =>
                          ele["value"] != null && ele["value"] != "null")
                      .toList()[i];
                    return vitalCard(conext,
                          col: data["col"],
                          title:fethvitalsdata(conext, data["title"]),
                          confidence: data["confidence"],
                          label: data["title"],
                          value: data["value"],
                          url: data["image"],
                          level: data["level"],
                          levelcol: data["levelcol"]);
                  },
                ),
                crossFadeState: crossFadeState,
                duration: const Duration(milliseconds: 100)),
          ],
        );
      });
    }
  );
}
/*
Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            set(() {
              isgrid = !isgrid;
            });
          },
          icon: Icon(isgrid ? Icons.stacked_bar_chart : Icons.grid_on),
          color: scaffoldbgcol,
        ),
        isgrid ? formatvitals(conext, model) : stackvitals(conext, model),
      ],
    );
*/

Widget formatvitals(context, Vitalmodel viatal) {
  return Consumer<Authcontroller>(builder: (_, ctrl, child) {
    return viatal.recordType == "Scan"
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Apptextwidget(
                "${fetchlocale(context).scan_type} - ${fetchlocale(context).facescan}",
                style: TxtStls.wstl13,
              ),
              appspace(h: 10),
              labelhead(h: viatal.height, w: viatal.weight, bmi: viatal.bmi),
              appspace(h: 10),
              GridView.builder(
                itemCount: formatlist(viatal)
                    .where(
                        (ele) => ele["value"] != null && ele["value"] != "null")
                    .toList()
                    .length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: checkscreenwidth(
                                genratemediaquery(context).size.width) ==
                            "Small"
                        ? 2
                        : checkscreenwidth(
                                    genratemediaquery(context).size.width) ==
                                "Medium"
                            ? 4
                            : 5,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.9),
                itemBuilder: (_, i) {
                  var data = formatlist(viatal)
                      .where((ele) =>
                          ele["value"] != null && ele["value"] != "null")
                      .toList()[i];
                  return vitalCard(context,
                      col: data["col"],
                      label: data["title"],
                      title: fethvitalsdata(context, data["title"]),
                      value: data["value"],
                      confidence: data["confidence"],
                      url: data["image"],
                      level: data["level"],
                      levelcol: data["levelcol"]);
                },
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Apptextwidget(
                "${fetchlocale(context).scan_type} - ${fetchlocale(context).manual}",
                style: TxtStls.wstl13,
              ),
              appspace(h: 10),
              labelhead(h: viatal.height, w: viatal.weight, bmi: viatal.bmi),
              appspace(h: 10),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 7,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: checkscreenwidth(
                                genratemediaquery(context).size.width) ==
                            "Small"
                        ? 2
                        : checkscreenwidth(
                                    genratemediaquery(context).size.width) ==
                                "Medium"
                            ? 4
                            : 5,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.9),
                itemBuilder: (_, i) {
                  var data = formatlist(viatal)[i];
                  return vitalCard(context,
                      col: data["col"],
                      title:fethvitalsdata(context, data["title"]),
                      label: data["title"],
                      value: data["value"],
                      url: data["image"],
                      level: data["level"],
                      levelcol: data["levelcol"]);
                },
              ),
            ],
          );
  });
}

List formatlist(Vitalmodel viatal) {
  if (viatal.recordType == "Scan") {
    return [
      {
        "col": const Color(0xFFEBE0E7),
        "title": "Wellness Index",
        "value": viatal.wellnessIndex,
        "image": "wellness.png",
        "levelcol":
            Risckscorecolours.rsiccolwellness(val: viatal.wellnessIndex),
        "level": viatal.wellnessLevel,
      },
      {
        "col": const Color(0xFFE0E5FA),
        "title": "Pulse Rate",
        "value": viatal.pulseRate,
        "image": "pulseRate.png",
        "levelcol": Risckscorecolours.calculateheartrate(val: viatal.pulseRate),
        "level": viatal.pulselevel,
        "confidence": viatal.heartconfidence ?? "N/A"
      },
      {
        "col": const Color(0xFFCCF0C2),
        "title": "Respiration Rate",
        "value": viatal.respirationRate,
        "image": "respirationrate.png",
        "levelcol":
            Risckscorecolours.calculatebrathingrate(val: viatal.respirationRate),
        "level": viatal.respirationlevel,
        "confidence": viatal.breatheconfidence ?? "N/A"
      },
      {
        "col": const Color(0xFFD9F8F8),
        "title": "Oxygen Saturation",
        "value": viatal.oxygenSaturation,
        "image": "oxygenSaturation.png",
        "levelcol":
            Risckscorecolours.calculatespo2(val: viatal.oxygenSaturation),
        "level": viatal.oxygensaturationlevel,
      },
      {
        "col": const Color(0xFFF8E6FE),
        "title": "Blood Pressure",
        "value": viatal.bloodPressure,
        "image": "bloodPressure.png",
        "levelcol": Risckscorecolours.calculatebp(
            val: viatal.bloodPressure?.split("/")[0]
            ),
        "level": viatal.bloodpressurelevel,
      },
      // {
      //   "col":const Color(0xFFCBE7FF),
      //   "title": "Stress Level",
      //   "value": viatal.stressLevel,
      //   "image": "stressLevel.png"
      // },
      {
        "col": const Color(0xFFFAFAE0),
        "title": "Stress Index",
        "value": viatal.stressIndex,
        "levelcol": Risckscorecolours.rsiccolstressvalue(val: viatal.stressLevel),
        "level": viatal.stressLevel,
        "image": "stressindex.png"
      },
      // {
      //   "col":const Color(0xFFD1E7DF),
      //   "title": "Wellness Level",
      //   "value": viatal.wellnessLevel,
      //   "image": "wellnessLevel.png"
      // },
      {
        "col": const Color(0xFFEBE7DB),
        "title": "Hemoglobin",
        "value": viatal.hemoglobin,
        "image": "hemoglobin.png",
        "levelcol": null,
        "level": null,
      },
      {
        "col": const Color(0xFFE0E5FA),
        "title": "Hemoglobin A1C",
        "value": viatal.hemoglobinA1C,
        "image": "hemoglobinA1c.png",
        "levelcol": Risckscorecolours.calculatehba1c(val: viatal.hemoglobinA1C),
        "level": RiskScorevalues.calculatehba1c(val: viatal.hemoglobinA1C),
      },
    ];
  } else {
    return [
      {
        "col": const Color(0xFFE0E5FA),
        "title": "Pulse Rate",
        "value": viatal.pulseRate,
        "image": "pulseRate.png",
        "levelcol": Risckscorecolours.calculateheartrate(val: viatal.pulseRate),
        "level": RiskScorevalues.calculateheartrate(val: viatal.pulseRate),
      },
      {
        "col": const Color(0xFFCCF0C2),
        "title": "Respiration Rate",
        "value": viatal.respirationRate,
        "image": "respirationrate.png",
        "levelcol": Risckscorecolours.calculatebrathingrate(
            val: viatal.respirationRate),
        "level":
            RiskScorevalues.calculatebrathingrate(val: viatal.respirationRate),
      },
      {
        "col": const Color(0xFFD9F8F8),
        "title": "Oxygen Saturation",
        "value": viatal.oxygenSaturation,
        "image": "oxygenSaturation.png",
        "levelcol":
            Risckscorecolours.calculatespo2(val: viatal.oxygenSaturation),
        "level": RiskScorevalues.calculatespo2(val: viatal.oxygenSaturation),
      },
      {
        "col": const Color(0xFFF8E6FE),
        "title": "Blood Pressure",
        "value": viatal.bloodPressure,
        "image": "bloodPressure.png",
        "levelcol": Risckscorecolours.calculatebp(
            val: viatal.bloodPressure?.split("/")[0]),
        "level": RiskScorevalues.calculatebp(
            val: viatal.bloodPressure?.split("/")[0]),
      },
      {
        "col": const Color(0xFFFAFAE0),
        "title": "Temperature",
        "value": viatal.temparature,
        "image": "thermometer.png",
        "levelcol":
            Risckscorecolours.calculateTemperature(val: viatal.temparature),
        "level": RiskScorevalues.calculateTemperature(val: viatal.temparature),
      },
      {
        "col": const Color(0xFFD9F8F8),
        "title": "Sugar",
        "value": viatal.sugar,
        "image": "sugar.png",
        "levelcol": Risckscorecolours.calculateSugar(val: viatal.sugar),
        "level": RiskScorevalues.calculateSugar(val: viatal.sugar),
      },
      {
        "col": const Color(0xFFCBE7FF),
        "title": "Cholesterol",
        "value": viatal.cholesterol,
        "image": "cholesterol.png",
        "levelcol":
            Risckscorecolours.calculateCholesterol(val: viatal.cholesterol),
        "level": RiskScorevalues.calculateCholesterol(val: viatal.cholesterol),
      },
    ];
  }
}

Widget labelhead({h, w, bmi}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      label(
        icon: FontAwesomeIcons.weightScale,
        value: "$w kg",
      ),
      label(icon: const AssetImage("assets/Vitals/height.png"), value: "$h cm"),
      label(icon: const AssetImage(bmiicon), value: bmi),
    ],
  );
}

Widget label({icon, value}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: scaffoldbgcol)),
    child: Row(
      children: [
        icon.runtimeType != IconDataSolid
            ? ImageIcon(
                icon,
                color: scaffoldbgcol,
                size: 20,
              )
            : Icon(
                icon,
                color: scaffoldbgcol,
                size: 20,
              ),
        appspace(w: 15),
        Apptextwidget(
          value,
          style: TxtStls.wstl12,
        ),
      ],
    ),
  );
}
