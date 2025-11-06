// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:XLcarez/env/appexports.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Steplist extends StatefulWidget {
  const Steplist({
    super.key,
  });

  @override
  State<Steplist> createState() => _SteplistState();
}

class _SteplistState extends State<Steplist> {
  //DateTime _dateTime = DateTime.now();
  //@override
  // void initState() {
  //   _dateTime = DateTime.tryParse("${widget.date}Z") ?? DateTime.now();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer<StepController>(builder: (_, ctrl, child) {
        return Scaffold(
          appBar: Themeappbar(
            title: fetchlocale(context).steps_track,
            leading: true,
          ),
          body: ctrl.stepsload
              ? loader()
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: bgClr1,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/calorie.png",
                                height: 50,
                                width: 50,
                              ),
                              appspace(w: 15),
                              Column(
                                children: [
                                  Apptextwidget(
                                    fetchlocale(context).steps_track,
                                    style: TxtStls.hintStl,
                                  ),
                                  appspace(h: 2),
                                  unitcard(
                                      val: ctrl.stepList
                                          .where((ele) =>
                                              DateFormat("dd/MM/yyyy").format(
                                                  DateTime.parse(
                                                      "${ele.createdDate}Z")) ==
                                              DateFormat("dd/MM/yyyy")
                                                  .format(ctrl.datetime))
                                          .fold(
                                              0.0,
                                              (pr, ele) =>
                                                  double.parse(
                                                      ele.stepCount ?? "0.0") +
                                                  pr)
                                          .toStringAsFixed(2),
                                      //"${ctrl.apisteps}",
                                      style: TxtStls.stl14,
                                      unit: fetchlocale(context).steps)
                                ],
                              ),
                              appspace(w: 15),
                              Column(
                                children: [
                                  Apptextwidget(
                                    fetchlocale(context).calariesburnt,
                                    style: TxtStls.hintStl,
                                  ),
                                  appspace(h: 2),
                                  unitcard(
                                      val: ctrl.stepList
                                          .where((ele) =>
                                              DateFormat("dd/MM/yyyy").format(
                                                  DateTime.parse(
                                                      "${ele.createdDate}Z")) ==
                                              DateFormat("dd/MM/yyyy")
                                                  .format(ctrl.datetime))
                                          .fold(
                                              0.0,
                                              (pr, ele) =>
                                                  double.tryParse(
                                                      ele.calorieIntake ??
                                                          "0.0") ??
                                                  0.0 + pr)
                                          .toStringAsFixed(2),
                                      //"${ctrl.kcal}",
                                      style: TxtStls.stl14,
                                      unit: fetchlocale(context).kcal)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    appspace(h: 5),
                    Container(
                      decoration: const BoxDecoration(color: scaffoldbgcol),
                      child: buildWeekSelectormod(
                          date: ctrl.datetime,
                          arrowback: () {
                            var date =
                                ctrl.datetime.subtract(const Duration(days: 7));
                            ctrl.chnagedate(date);
                            // setState(() {
                            //   // _dateTime = _dateTime =
                            //   //     _dateTime.subtract(const Duration(days: 7));
                            // });
                          },
                          arrowup: () {
                            var data =
                                ctrl.datetime.add(const Duration(days: 7));
                            if (data.isAfter(getLastDateOfWeek())) {
                              // print("control");
                            } else {
                              var date = ctrl.datetime.subtract(
                                  Duration(days: ctrl.datetime.weekday - 1));
                              ctrl.chnagedate(date);
                              var date2 =
                                  ctrl.datetime.add(const Duration(days: 7));
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
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                      data: calendertheme(context),
                                      child: child!);
                                },
                                context: context,
                                initialEntryMode:
                                    DatePickerEntryMode.calendarOnly,
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
                    appspace(h: 10),
                    Container(
                      child: _buildWeekdaySelector(),
                    ),
                    ctrl.stepList
                            .where((ele) =>
                                DateFormat("dd/MM/yyyy").format(
                                    DateTime.parse("${ele.createdDate}Z")) ==
                                DateFormat("dd/MM/yyyy").format(ctrl.datetime))
                            .isEmpty
                        ? const Nodatafound()
                        : const SizedBox.shrink(),
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (_, i) {
                              final filterlist = ctrl.stepList
                                  .where((ele) =>
                                      DateFormat("dd/MM/yyyy").format(
                                          DateTime.parse(
                                              "${ele.createdDate}Z")) ==
                                      DateFormat("dd/MM/yyyy")
                                          .format(ctrl.datetime))
                                  .toList();
                              return Theme(
                                  data: ThemeData(
                                      dividerColor: Colors.transparent),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,horizontal: 15
                                    ),
                                    child: SizedBox(
                                      height: genratemediaquery(context).size.height/1.9,
                                      child: ScoreIndicator(
                                          show: false,
                                          score: double.tryParse( ctrl.stepList
                                          .where((ele) =>
                                              DateFormat("dd/MM/yyyy").format(
                                                  DateTime.parse(
                                                      "${ele.createdDate}Z")) ==
                                              DateFormat("dd/MM/yyyy")
                                                  .format(ctrl.datetime))
                                          .fold(
                                              0.0,
                                              (pr, ele) =>
                                                  double.parse(
                                                      ele.stepCount ?? "0.0") +
                                                  pr)
                                          .toStringAsFixed(2)) ??
                                              0.0,
                                          maxScore: 10000,
                                          progressValue: stepslueparse(
                                              filterlist[i].stepCount),
                                          label: "Steps",
                                          image: SizedBox(
                                              height: 150.0,
                                              child: Image.asset(
                                                  "assets/calorie.png")),
                                          level:"${ ctrl.stepList
                                          .where((ele) =>
                                              DateFormat("dd/MM/yyyy").format(
                                                  DateTime.parse(
                                                      "${ele.createdDate}Z")) ==
                                              DateFormat("dd/MM/yyyy")
                                                  .format(ctrl.datetime))
                                          .fold(
                                              0.0,
                                              (pr, ele) =>
                                                  double.tryParse(
                                                      ele.calorieIntake ??
                                                          "0.0") ??
                                                  0.0 + pr)
                                          .toStringAsFixed(2)} kcal"),
                                    ),
                                    // child: ExpansionTile(
                                    //   initiallyExpanded: i == 0,
                                    //   collapsedBackgroundColor: transparentcol,
                                    //   collapsedShape: RoundedRectangleBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(10)),
                                    //   title: Apptextwidget(
                                    //     DateFormat("MMM/dd").format(DateTime.parse(
                                    //             "${filterlist[i].createdDate}Z")
                                    //         .toLocal()),
                                    //     style: TxtStls.wstl14,
                                    //   ),
                                    //   children: filterlist
                                    //       .where((r) =>
                                    //           r.createdDate ==
                                    //           filterlist[i].createdDate)
                                    //       .map((o) =>
                                    //       Card(
                                    //             child: Padding(
                                    //               padding: const EdgeInsets
                                    //                   .symmetric(
                                    //                   horizontal: 10,
                                    //                   vertical: 10),
                                    //               child: Row(
                                    //                 mainAxisAlignment:
                                    //                     MainAxisAlignment
                                    //                         .spaceBetween,
                                    //                 children: [
                                    //                   Row(
                                    //                     children: [
                                    //                       Apptextwidget(
                                    //                         o.stepCount ?? "-",
                                    //                         style:
                                    //                             TxtStls.stl14,
                                    //                       ),
                                    //                       appspace(w: 5),
                                    //                       const ImageIcon(
                                    //                         AssetImage(
                                    //                             "assets/footsteps.png"),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                   Row(
                                    //                     children: [
                                    //                       Apptextwidget(
                                    //                         o.calorieIntake ?? "-",
                                    //                         style:
                                    //                             TxtStls.stl13,
                                    //                       ),
                                    //                       appspace(w: 5),
                                    //                       const Icon(Icons
                                    //                           .local_fire_department),
                                    //                     ],
                                    //                   )
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           )
                                    //           )
                                    //       .toList(),
                                    // ),
                                  ));
                            },
                            separatorBuilder: (_, k) {
                              return appspace(h: 10);
                            },
                            itemCount: ctrl.stepList
                                .where((ele) =>
                                    DateFormat("dd/MM/yyyy").format(
                                        DateTime.parse(
                                            "${ele.createdDate}Z")) ==
                                    DateFormat("dd/MM/yyyy")
                                        .format(ctrl.datetime))
                                .length))
                  ],
                ),
        );
      }),
    );
  }

  Widget _buildWeekdaySelector() {
    return Consumer<StepController>(builder: (_, ctrl, child) {
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
                    Fluttertoast.showToast(msg: "You can't check future dates");
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
