// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:XLcarez/env/appexports.dart';
import 'package:XLcarez/model/sleepmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Sleeplonglist extends StatefulWidget {
  const Sleeplonglist({super.key});

  @override
  State<Sleeplonglist> createState() => _SleeplonglistState();
}

class _SleeplonglistState extends State<Sleeplonglist> {
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer<Assesmentcontroller>(builder: (context, ctrl, child) {
        return Scaffold(
          appBar: Themeappbar(
            title: fetchlocale(context).sleppscorelist,
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
                    date: ctrl.sleepdate,
                    arrowback: () {
                      var date = ctrl.sleepdate.subtract(const Duration(days: 7));
                      ctrl.chnagesleepdate(date);
                    },
                    arrowup: () {
                      var data = ctrl.sleepdate.add(const Duration(days: 7));
                      if (data.isAfter(getLastDateOfWeek())) {
                        // print("control");
                      } else {
                        var date = ctrl.sleepdate.subtract(
                            Duration(days: ctrl.sleepdate.weekday - 1));
                        ctrl.chnagesleepdate(date);
                        var date2 = ctrl.sleepdate.add(const Duration(days: 7));
                        ctrl.chnagesleepdate(date2);
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
                                      ctrl.chnagesleepdate(picked);
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
                          ctrl.chnagesleepdate(picked);
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
                expandedHeight: 70.0,
                pinned: true,
                title: _buildWeekdaySelector(),
              ),
              SliverToBoxAdapter(
                  child: ctrl.listloading ? loader() : const SizedBox.shrink()),
              SliverToBoxAdapter(
                  child: ctrl.sleeplist
                          .where((ele) =>
                              DateFormat("dd/MM/yyyy").format(
                                  DateTime.parse("${ele.createdDate}Z")) ==
                              DateFormat("dd/MM/yyyy").format(ctrl.sleepdate))
                          .isEmpty
                      ? const Nodatafound()
                      : const SizedBox.shrink()),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverList.separated(
                    itemCount: ctrl.sleeplist
                        .where((ele) =>
                            DateFormat("dd/MM/yyyy").format(
                                DateTime.parse("${ele.createdDate}Z")) ==
                            DateFormat("dd/MM/yyyy").format(ctrl.sleepdate))
                        .length,
                    itemBuilder: (_, i) {
                      final filterlist = ctrl.sleeplist
                          .where((ele) =>
                              DateFormat("dd/MM/yyyy").format(
                                  DateTime.parse("${ele.createdDate}Z")) ==
                              DateFormat("dd/MM/yyyy").format(ctrl.sleepdate))
                          .toList();
                      return Theme(
                          data: ThemeData(dividerColor: Colors.transparent),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: ExpansionTile(
                             // initiallyExpanded: i == 0,
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
                                  .map((o) => sleepitem(ctrl, o))
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

  Widget sleepitem(ctrl, SleepModel data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          sleep(
              ques: fetchlocale(context).sleep_q1,
              answer: fetchlocaloptionsleep(context, data.sittingandreading)),
          sleep(
              ques: fetchlocale(context).sleep_q2,
              answer: fetchlocaloptionsleep(context, data.watchingtv)),
          sleep(
              ques: fetchlocale(context).sleep_q3,
              answer: fetchlocaloptionsleep(
                  context, data.sittinginactiveinpublicplace)),
          sleep(
              ques: fetchlocale(context).sleep_q4,
              answer: fetchlocaloptionsleep(context, data.passengerinacar)),
          sleep(
              ques: fetchlocale(context).sleep_q5,
              answer: fetchlocaloptionsleep(context, data.lyingdown)),
          sleep(
              ques: fetchlocale(context).sleep_q7,
              answer: fetchlocaloptionsleep(
                  context, data.sittingandtalkingtosomeone)),
          sleep(
              ques: fetchlocale(context).sleep_q8,
              answer: fetchlocaloptionsleep(
                  context, data.sittingquietlyafterlunch)),
          sleep(
              ques: fetchlocale(context).sleep_q9,
              answer: fetchlocaloptionsleep(
                  context, data.inacarwhenstoppedintraffic)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Apptextwidget(
                    fetchlocale(context).riskscore,
                    style: TxtStls.wstl14,
                  ),
                  Apptextwidget(
                    "${ctrl.checkriskscore(context, int.parse(data.sleepscore!))}",
                    style: TxtStls.wstl13,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Apptextwidget(
                    fetchlocale(context).fatiguetotalscore,
                    style: TxtStls.wstl14,
                  ),
                  Apptextwidget(
                    "${data.sleepscore} Pts",
                    style: TxtStls.appstyle20,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeekdaySelector() {
    return Consumer<Assesmentcontroller>(builder: (_, ctrl, child) {
      List<Widget> dayButtons = [];
      DateTime weekStart =
          ctrl.sleepdate.subtract(Duration(days: ctrl.sleepdate.weekday - 1));
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
                    ctrl.chnagesleepdate(currentDate);
                    // setState(() {
                    //   _dateTime = currentDate;
                    // });
                  },
            child: Container(
              height: 70,
              width: 40,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ctrl.sleepdate == currentDate ? primary : scaffoldbgcol,
                border: Border.all(
                    color: ctrl.sleepdate == currentDate
                        ? primary
                        : scaffoldbgcol),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  appspace(h: 5),
                  Apptextwidget(
                    DateFormat('EEE').format(currentDate).substring(0, 1),
                    style: ctrl.sleepdate == currentDate
                        ? TxtStls.wstl12
                        : TxtStls.stl12,
                  ),
                  appspace(h: 2),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: ctrl.sleepdate == currentDate
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

  Widget sleep({ques, answer}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              child: Apptextwidget(
            ques ?? "",
            style: TxtStls.wstl14,
          )),
          // const SizedBox(height: 10,),
          Apptextwidget(
            answer ?? "-",
            style: TxtStls.wstl12,
          ),
        ],
      ),
    );
  }
}
