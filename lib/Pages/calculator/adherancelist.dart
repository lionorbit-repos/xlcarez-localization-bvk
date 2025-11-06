import 'dart:io';

import 'package:XLcarez/env/appexports.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Hivlonglist extends StatefulWidget {
  const Hivlonglist({super.key});

  @override
  State<Hivlonglist> createState() => _HivlonglistState();
}

class _HivlonglistState extends State<Hivlonglist> {
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer<Assesmentcontroller>(builder: (_, ctrl, child) {
        return Scaffold(
          appBar: Themeappbar(
            title: "List",
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
                    date: ctrl.adherencedate,
                    arrowback: () {
                      var date =
                          ctrl.adherencedate.subtract(const Duration(days: 7));
                      ctrl.chnagesleepdate(date);
                    },
                    arrowup: () {
                      var data =
                          ctrl.adherencedate.add(const Duration(days: 7));
                      if (data.isAfter(getLastDateOfWeek())) {
                        // print("control");
                      } else {
                        var date = ctrl.adherencedate.subtract(
                            Duration(days: ctrl.adherencedate.weekday - 1));
                        ctrl.chnageadherncedate(date);
                        var date2 =
                            ctrl.adherencedate.add(const Duration(days: 7));
                        ctrl.chnageadherncedate(date2);
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
                                      ctrl.chnageadherncedate(picked);
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
                          ctrl.chnageadherncedate(picked);
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
                  child: ctrl.adherlist
                          .where((ele) =>
                              DateFormat("dd/MM/yyyy").format(
                                  DateTime.parse("${ele.createdDate}Z")) ==
                              DateFormat("dd/MM/yyyy")
                                  .format(ctrl.adherencedate))
                          .isEmpty
                      ? const Nodatafound()
                      : const SizedBox.shrink()),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverList.separated(
                    itemCount: ctrl.adherlist
                        .where((ele) =>
                            DateFormat("dd/MM/yyyy").format(
                                DateTime.parse("${ele.createdDate}Z")) ==
                            DateFormat("dd/MM/yyyy").format(ctrl.adherencedate))
                        .length,
                    itemBuilder: (_, i) {
                      final filterlist = ctrl.adherlist
                          .where((ele) =>
                              DateFormat("dd/MM/yyyy").format(
                                  DateTime.parse("${ele.createdDate}Z")) ==
                              DateFormat("dd/MM/yyyy")
                                  .format(ctrl.adherencedate))
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

  Widget sleepitem(ctrl, AdherenceModel data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          adherence(
              ques: fetchlocale(context).hivquestionary1, answer: data.hiv1),
          adherence(
              ques: fetchlocale(context).hivquestionary2, answer: data.hiv2),
          adherence(
              ques: fetchlocale(context).hivquestionary3, answer: data.hiv3),
          adherence(
              ques: fetchlocale(context).hivquestionary4, answer: data.hiv4),
          adherence(
              ques: fetchlocale(context).hivquestionary5, answer: data.hiv5),
          adherence(
              ques: fetchlocale(context).hivquestionary6, answer: data.hiv6),
          adherence(
              ques: fetchlocale(context).hivquestionary7, answer: data.hiv7),
          adherence(
              ques: fetchlocale(context).hivquestionary8, answer: data.hiv8),
          adherence(
              ques: fetchlocale(context).hivquestionary9, answer: data.hiv9),
          adherence(
              ques: fetchlocale(context).hivquestionary10, answer: data.hiv10),
          adherence(
              ques: fetchlocale(context).hivquestionary11, answer: data.hiv11),
          adherence(
              ques: fetchlocale(context).hivquestionary12, answer: data.hiv12),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Apptextwidget(
                "${fetchlocale(context).fatiguetotalscore} : ${data.hivtotal}",
                style: TxtStls.stl14,
              ),
              Apptextwidget(
                "${fetchlocale(context).integrationscore} : ${data.hivinteragration}",
                style: TxtStls.stl14,
              ),
              Apptextwidget(
                "${fetchlocale(context).perseverencescore} : ${data.hivperseverencescore}",
                style: TxtStls.stl14,
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
      DateTime weekStart = ctrl.adherencedate
          .subtract(Duration(days: ctrl.adherencedate.weekday - 1));
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
                    ctrl.chnageadherncedate(currentDate);
                    // setState(() {
                    //   _dateTime = currentDate;
                    // });
                  },
            child: Container(
              height: 70,
              width: 40,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color:
                    ctrl.adherencedate == currentDate ? primary : scaffoldbgcol,
                border: Border.all(
                    color: ctrl.adherencedate == currentDate
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
                    style: ctrl.adherencedate == currentDate
                        ? TxtStls.wstl12
                        : TxtStls.stl12,
                  ),
                  appspace(h: 2),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: ctrl.adherencedate == currentDate
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

  Widget adherence({ques, answer}) {
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
          Slider(
            value: double.tryParse(answer) ?? 0,
            min: 0,
            max: 10,
            divisions: 10,
            label: answer ?? 0,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}
