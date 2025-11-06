// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:XLcarez/env/appexports.dart';
import 'package:XLcarez/model/fatiguemodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Fatiguelonglist extends StatefulWidget {
  const Fatiguelonglist({
    super.key,
  });

  @override
  State<Fatiguelonglist> createState() => _FatiguelonglistState();
}

class _FatiguelonglistState extends State<Fatiguelonglist> {
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer<Assesmentcontroller>(builder: (context, ctrl, child) {
        return Scaffold(
          appBar: Themeappbar(
            title: fetchlocale(context).fatiguelist,
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
                    date: ctrl.fatiguedate,
                    arrowback: () {
                      var date = ctrl.fatiguedate.subtract(const Duration(days: 7));
                      ctrl.chnagefatiguedate(date);
                    },
                    arrowup: () {
                      var data = ctrl.fatiguedate.add(const Duration(days: 7));
                      if (data.isAfter(getLastDateOfWeek())) {
                        // print("control");
                      } else {
                        var date = ctrl.fatiguedate.subtract(
                            Duration(days: ctrl.fatiguedate.weekday - 1));
                        ctrl.chnagefatiguedate(date);
                        var date2 = ctrl.fatiguedate.add(const Duration(days: 7));
                        ctrl.chnagefatiguedate(date2);
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
                                      ctrl.chnagefatiguedate(picked);
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
                          ctrl.chnagefatiguedate(picked);
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
                expandedHeight: 60.0,
                pinned: true,
                title: _buildWeekdaySelector(),
              ),
              SliverToBoxAdapter(
                  child: ctrl.listloading ? loader() : const SizedBox.shrink()),
              SliverToBoxAdapter(
                  child: ctrl.fatiguelist
                          .where((ele) =>
                              DateFormat("dd/MM/yyyy").format(
                                  DateTime.parse("${ele.createdDate}Z")) ==
                              DateFormat("dd/MM/yyyy").format(ctrl.fatiguedate))
                          .isEmpty
                      ? const Nodatafound()
                      : const SizedBox.shrink()),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverList.separated(
                    itemCount: ctrl.fatiguelist
                        .where((ele) =>
                            DateFormat("dd/MM/yyyy").format(
                                DateTime.parse("${ele.createdDate}Z")) ==
                            DateFormat("dd/MM/yyyy").format(ctrl.fatiguedate))
                        .length,
                    itemBuilder: (_, i) {
                      final filterlist = ctrl.fatiguelist
                          .where((ele) =>
                              DateFormat("dd/MM/yyyy").format(
                                  DateTime.parse("${ele.createdDate}Z")) ==
                              DateFormat("dd/MM/yyyy").format(ctrl.fatiguedate))
                          .toList();
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

  Widget _buildWeekdaySelector() {
    return Consumer<Assesmentcontroller>(builder: (_, ctrl, child) {
      List<Widget> dayButtons = [];
      DateTime weekStart = ctrl.fatiguedate
          .subtract(Duration(days: ctrl.fatiguedate.weekday - 1));
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
                    ctrl.chnagefatiguedate(currentDate);
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
                    ctrl.fatiguedate == currentDate ? primary : scaffoldbgcol,
                border: Border.all(
                    color: ctrl.fatiguedate == currentDate
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
                    style: ctrl.fatiguedate == currentDate
                        ? TxtStls.wstl12
                        : TxtStls.stl12,
                  ),
                  appspace(h: 2),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: ctrl.fatiguedate == currentDate
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

  Widget sleepitem(ctrl, FatigueModel data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          sleep(
              ques: fetchlocale(context).fatigueques1,
              answer: fetchlocaloptionfatigue(context, data.motivationfatigue)),
          sleep(
              ques: fetchlocale(context).fatigueques2,
              answer: data.exercisefatigue),
          sleep(
              ques: fetchlocale(context).fatigueques3,
              answer: fetchlocaloptionfatigue(context, data.easilyfatigued)),
          sleep(
              ques: fetchlocale(context).fatigueques4,
              answer: fetchlocaloptionfatigue(
                  context, data.physicalfunctioningfatigue)),
          sleep(
              ques: fetchlocale(context).fatigueques5,
              answer: fetchlocaloptionfatigue(context, data.causesfatigue)),
          sleep(
              ques: fetchlocale(context).fatigueques6,
              answer: fetchlocaloptionfatigue(context, data.myfatigueprevents)),
          sleep(
              ques: fetchlocale(context).fatigueques7,
              answer: data.fatiguedutiesandresponsibilities),
          sleep(
              ques: fetchlocale(context).fatigueques8,
              answer: fetchlocaloptionfatigue(context, data.fatiguesymtoms)),
          sleep(
              ques: fetchlocale(context).fatigueques9,
              answer: fetchlocaloptionfatigue(context, data.fatiguesocial)),
          Row(
            children: [
              Apptextwidget(
                fetchlocale(context).scoreint,
                style: TxtStls.appstyle14,
              ),
              const SizedBox(
                width: 5,
              ),
              Apptextwidget(
                "${data.fatiguescore}",
                style: ctrl.handlevalue(data.fatiguescore)
                    ? TxtStls.errorStl
                    : TxtStls.appstyle14,
              ),
            ],
          ),
          Apptextwidget(
            "${fetchlocale(context).youare} ${ctrl.handlevalue(data.fatiguescore) ? fetchlocale(context).not : ""} ${fetchlocale(context).leveltext}",
            style: TxtStls.wstl14,
          ),
        ],
      ),
    );
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
