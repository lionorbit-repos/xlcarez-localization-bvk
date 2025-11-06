// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable
import 'dart:io';

import 'package:XLcarez/env/appexports.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class FoodLogList extends StatefulWidget {
  var from;
  FoodLogList({
    super.key,
    this.from = "",
  });

  @override
  State<FoodLogList> createState() => _FoodLogListState();
}

class _FoodLogListState extends State<FoodLogList> {
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      color: widget.from == "Long" ? [transparentcol, transparentcol] : null,
      child: Scaffold(
        appBar: widget.from == "Long"
            ? null
            : Themeappbar(
                title: fetchlocale(context).foodlog,
                centtile: true,
                leading: true,
              ),
        body: Consumer2<FoodSearchController, Authcontroller>(
            builder: (_, ctrl, auth, child) {
          return ctrl.isload
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/foodtrack.png",
                                        height: 70,
                                        width: 70,
                                      ),
                                      appspace(w: 15),
                                      // Column(
                                      //   children: [
                                      //     Apptextwidget(
                                      //       fetchlocale(context).clorieintake,
                                      //       style: TxtStls.hintStl,
                                      //     ),
                                      //     appspace(h: 2),
                                      //     unitcard(
                                      //         val: "${ctrl.foodcal}",
                                      //         style: TxtStls.stl14,
                                      //         unit: fetchlocale(context).kcal)
                                      //   ],
                                      // ),
                                      //appspace(w: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Apptextwidget(
                                            fetchlocale(context).daycal,
                                            style: TxtStls.hintStl,
                                          ),
                                          appspace(h: 2),
                                          unitcard(
                                              val: (ctrl.foodlist
                                                  .where((ele) =>
                                                      DateFormat("dd/MM/yyyy")
                                                          .format(DateTime.parse(
                                                              "${ele.createdDate}Z")) ==
                                                      DateFormat("dd/MM/yyyy")
                                                          .format(
                                                              ctrl.datetime))
                                                  .fold(
                                                      0.0,
                                                      (pr, ele) =>
                                                          double.parse(
                                                              ele.calorie ??
                                                                  "0.0") +
                                                          pr)).toStringAsFixed(2),
                                              style: TxtStls.stl14,
                                              unit: fetchlocale(context).kcal)
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: widget.from != "Long",
                                child: CircleAvatar(
                                    backgroundColor: success,
                                    child: IconButton(
                                        onPressed: () {
                                          navigationSlide(context,
                                              const Foodsearchscreen());
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: scaffoldbgcol,
                                        ))),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: scaffoldbgcol,
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
                    Container(
                      color: scaffoldbgcol,
                      child: _buildWeekdaySelector(),
                    ),
                    ctrl.foodlist
                            .where((ele) =>
                                DateFormat("dd/MM/yyyy").format(
                                    DateTime.parse("${ele.createdDate}Z")) ==
                                DateFormat("dd/MM/yyyy").format(ctrl.datetime))
                            .isEmpty
                        ? Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Nodatafound(
                              content: ctrl.foodlist.isEmpty
                                  ? fetchlocale(context).startrecording
                                  : fetchlocale(context).nofoodlog,
                                                        ),
                            ))
                        : Expanded(
                            child: GridView.builder(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                itemCount: ctrl.foodlist
                                    .where((ele) =>
                                        DateFormat("dd/MM/yyyy").format(DateTime.parse("${ele.createdDate}Z")) ==
                                        DateFormat("dd/MM/yyyy")
                                            .format(ctrl.datetime))
                                    .length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: checkscreenwidth(
                                                    genratemediaquery(context)
                                                        .size
                                                        .width) ==
                                                "Small"
                                            ? 2
                                            : checkscreenwidth(genratemediaquery(context).size.width) ==
                                                    "Medium"
                                                ? 3
                                                : 5,
                                        childAspectRatio:
                                            checkscreenwidth(genratemediaquery(context).size.width) ==
                                                    "Small"
                                                ? 1
                                                : checkscreenwidth(genratemediaquery(context).size.width) == "Medium"
                                                    ? 1.5
                                                    : 1.0,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10),
                                itemBuilder: (_, i) {
                                  var data = ctrl.foodlist
                                      .where((ele) =>
                                          DateFormat("dd/MM/yyyy").format(
                                              DateTime.parse(
                                                  "${ele.createdDate}Z")) ==
                                          DateFormat("dd/MM/yyyy")
                                              .format(ctrl.datetime))
                                      .toList()[i];
                                  //log(data.createdDate.toString());
                                  return foodcard(data);
                                })),
                  ],
                );
        }),
        //bottomNavigationBar:
        //     Consumer<Authcontroller>(builder: (context, auth, child) {
        //   return Visibility(
        //     visible: !(auth.userData?["userId"] == userid),
        //     child: bottomContainer(
        //         child: fillButton(context, load: false, title: "Add More Foods",
        //             onTap: () {
        //       navigationSlide(context, const Foodsearchscreen());
        //     })),
        //   );
        // }),
      ),
    );
  }

  Widget _buildWeekdaySelector() {
    return Consumer<FoodSearchController>(builder: (_, ctrl, child) {
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

  Widget foodcard(FoodLogModel food) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Apptextwidget(
                  food.itemName != null
                      ? food.itemName.toString().replaceAll("-", "")
                      : "",
                  style: TxtStls.themestyle14,
                ),
                appspace(h: 10),
                Row(
                  children: [
                    Apptextwidget(
                      fetchlocale(context).energee,
                      style: TxtStls.labelStlhint,
                    ),
                    appspace(w: 10),
                    Apptextwidget(
                      "${food.calorie} ${fetchlocale(context).kcal}",
                      style: TxtStls.themestyle16,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: -5,
            left: -10,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: scaffoldbgcol,
              backgroundImage: checkimage(food.foodImage) as ImageProvider?,
            )),
        Positioned(
            right: 10,
            top: 10,
            child: Hero(
                tag: food.itemName.toString(),
                child: CircleAvatar(
                  backgroundColor: success,
                  child: IconButton(
                      onPressed: () {
                        navigationSlide(context, Fooddetailscreen(model: food));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: scaffoldbgcol,
                      )),
                )))
      ],
    );
  }
}
