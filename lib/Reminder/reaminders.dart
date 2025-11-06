// ignore_for_file: non_constant_identifier_names


import 'package:XLcarez/env/appexports.dart';
import 'package:flutter/cupertino.dart';

class Reaminders extends StatefulWidget {
  const Reaminders({super.key});

  @override
  State<Reaminders> createState() => _ReamindersState();
}

class _ReamindersState extends State<Reaminders> {
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      Provider.of<Medicationcontroller>(context, listen: false)
          .fethcmedications();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final medctionctrl =
        Provider.of<Medicationcontroller>(context, listen: false);
    final data = medctionctrl.istriger;
    if (data == 'Custom') {
      medctionctrl.triggerreste();
      //log(medctionctrl.triggers.map((val)=>val.toString()).toList().toString());
      showcustomDraggableSheet(context);
      //navigationSlide(context, const Customreminder());
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Medicationcontroller>(builder: (context, med, child) {
      return MyThemeGradient(
        child: Scaffold(
          appBar: Themeappbar(
            title: fetchlocale(context).remindere,
            leading: true,
            act: [
              IconButton(
                  onPressed: () {
                    med.clearnotifocations();
                  },
                  icon: const Icon(
                    Icons.clear_all,
                    color: scaffoldbgcol,
                  ))
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                med.list.isEmpty
                    ? Column(
                        children: [
                          const Icon(Icons.alarm, size: 100, color: primary),
                          appspace(h: 10),
                          Apptextwidget(
                            fetchlocale(context).noreminders,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: scaffoldbgcol),
                          )
                        ],
                      )
                    : Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            itemCount: med.list.length,
                            itemBuilder: (_, i) {
                              final data = med.list[i];
                              return Card(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Apptextwidget("${data.id}",
                                            style: TxtStls.stl14),
                                        IconButton(
                                            onPressed: () {
                                              _showDraggableSheet(context,
                                                  id: data.id);
                                            },
                                            icon: const Icon(Icons.edit_note))
                                      ],
                                    ),
                                    Apptextwidget("${data.title}",
                                        style: TxtStls.stl14),
                                    Apptextwidget(data.body ?? "",
                                        style: TxtStls.stl14),
                                    Apptextwidget(dateformat(
                                        format: "dd/MM/yyyy hh:mm a",
                                        vale: DateTime.parse(
                                            "${data.payload?.split("+")[0]}Z"))),
                                  ],
                                ),
                              ));
                            }))
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: () async {
              _showDraggableSheet(context);
            },
            child: const Icon(
              Icons.add,
              size: 25,
              color: scaffoldbgcol,
            ),
          ),
        ),
      );
    });
  }

  void _showDraggableSheet(BuildContext context, {id}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Consumer<Medicationcontroller>(
                builder: (context, med, child) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Container(
                          height: 4,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        appspace(h: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  med.resedata();
                                  Navigator.pop(context);
                                },
                                child: Text(fetchlocale(context).cancel,
                                    style: TxtStls.stl14)),
                            Text(
                                "${id == null ? fetchlocale(context).neww : fetchlocale(context).edit} ${fetchlocale(context).remindere}",
                                style: TxtStls.stl16),
                            TextButton(
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    if (med.triggers.length > 6) {
                                      med.checkscedhulerepeat(context, id: id);
                                    } else {
                                      if (id != null) {
                                        med.editreminder(context, id: id);
                                      } else {
                                        med.addreminder(context);
                                      }
                                    }
                                    // showcustomenotification(body: 'The test',id: 0,title: 'Cool',date: med.medicatiopndate,trigger: med.istriger);
                                    // print(med.medicatiopndate.toIso8601String());
                                    // if (id != null) {
                                    //   med.editreminder(context, id: id);
                                    // } else {
                                    //   med.addreminder(context);
                                    // }
                                  }
                                  // print(med.checkindex().toString());
                                },
                                child: Text(fetchlocale(context).donee,
                                    style: TxtStls.stl14)),
                          ],
                        ),
                        appspace(h: 20),
                        SizedBox(
                            height: 100,
                            child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.dateAndTime,
                                onDateTimeChanged: (vsl) {
                                  med.chnagedateTime(vsl);
                                })),
                        appspace(h: 20),
                        DropdownButtonFormField2<String>(
                          decoration: InputDecoration(
                            labelText: fetchlocale(context).selectmedicinee,
                            border: const OutlineInputBorder(),
                          ),
                          validator: (val) {
                            if (val == null) {
                              return fetchlocale(context).pleaseselectmedicine;
                            } else {
                              return null;
                            }
                          },
                          value: med.selectedMedicine,
                          items: [
                            DropdownMenuItem(
                                value: "Other",
                                child:
                                    Apptextwidget(fetchlocale(context).othere)),
                            ...med.medicationlist.map((el) => DropdownMenuItem(
                                value: el.medicineName?.text,
                                child: Apptextwidget(
                                    el.medicineName?.text ?? "-"))),
                          ],
                          onChanged: (String? newValue) {
                            med.chnagemedicne(newValue);
                          },
                        ),
                        appspace(h: 10),
                        Visibility(
                            visible: med.selectedMedicine == "Other",
                            child: Appscalemedia(
                              child: TextFormField(
                                style: TxtStls.stl13,
                                enabled: true,
                                maxLines: 1,
                                inputFormatters: [
                                  NoLeadingTrailingSpaceFormatter()
                                ],
                                autofocus: false,
                                controller: med.othermedicationcontroller,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 0),
                                  labelStyle: TxtStls.stl15,
                                  hintStyle: TxtStls.hintStl,
                                  fillColor: fillcor,
                                  filled: true,
                                  counterText: "",
                                  errorStyle: TxtStls.errorStl,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: borderclr),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: borderclr),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: borderclr),
                                  ),
                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                validator: (name) {
                                  if (name!.isEmpty) {
                                    return fetchlocale(context).otherisnotempty;
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            )),
                        appspace(h: 10),
                        Row(
                          children: [
                            const Icon(Icons.repeat),
                            Expanded(
                              child: DropdownButton2(
                                  underline: const SizedBox.shrink(),
                                  hint: Apptextwidget(
                                    "${fetchlocale(context).selecte} ${fetchlocale(context).doctor}",
                                    style: TxtStls.hintStl,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                      maxHeight: 200,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  value: med.istriger,
                                  items: [
                                    ...med.triggers.map((val) =>
                                        DropdownMenuItem(
                                            value: val,
                                            child: Apptextwidget(repeat(val)))),
                                    DropdownMenuItem(
                                        value: 'Custom',
                                        child: Apptextwidget(
                                            fetchlocale(context).custome)),
                                  ],
                                  onChanged: (val) {
                                    med.chnagetrigger(val);
                                    didChangeDependencies();
                                  }),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
          },
        );
      },
    );
  }

  void showcustomDraggableSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.7,
          maxChildSize: 0.9,
          shouldCloseOnMinExtent: false,
          expand: false,
          builder: (context, scrollController) {
            return Consumer<Medicationcontroller>(
                builder: (context, med, child) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 4,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      appspace(h: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                med.chnagetrigger('Does not repeat');
                                Navigator.pop(context);
                              },
                              child: Apptextwidget(fetchlocale(context).cancel,
                                  style: TxtStls.stl14)),
                          Apptextwidget(fetchlocale(context).customreference,
                              overflow: TextOverflow.ellipsis,
                              style: TxtStls.stl14),
                          TextButton(
                              onPressed: () {
                                med.addval();
                                Navigator.pop(context);
                                // print(med.checkindex().toString());
                              },
                              child: Apptextwidget(fetchlocale(context).donee,
                                  style: TxtStls.stl14)),
                        ],
                      ),
                      appspace(h: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.repeat,
                            color: headerClr,
                          ),
                          appspace(w: 10),
                          Apptextwidget(
                              "${fetchlocale(context).repeatevery} ${med.interval} ${med.interval > 1 ? "${repeat("${med.mode}'s")}" : "${repeat(med.mode)}"}"),
                        ],
                      ),
                      appspace(h: 10),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButton2(
                                underline: const SizedBox.shrink(),
                                dropdownStyleData: DropdownStyleData(
                                    maxHeight: 200,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                value: med.interval,
                                items: med.listinterval
                                    .map((val) => DropdownMenuItem(
                                        value: val,
                                        child: Apptextwidget("$val")))
                                    .toList(),
                                onChanged: (val) {
                                  med.chnageinterval(val);
                                }),
                          ),
                          Expanded(
                            child: DropdownButton2(
                                underline: const SizedBox.shrink(),
                                dropdownStyleData: DropdownStyleData(
                                    maxHeight: 200,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                value: med.mode,
                                items: [
                                  DropdownMenuItem(
                                      value: "Day",
                                      child: Apptextwidget(med.interval > 1
                                          ? fetchlocale(context).daysee
                                          : fetchlocale(context).dayse)),
                                  DropdownMenuItem(
                                      value: "Month",
                                      child: Apptextwidget(med.interval > 1
                                          ? fetchlocale(context).monthsee
                                          : fetchlocale(context).monthse)),
                                  DropdownMenuItem(
                                      value: "Year",
                                      child: Apptextwidget(med.interval > 1
                                          ? fetchlocale(context).yearse
                                          : fetchlocale(context).yeare))
                                ],
                                onChanged: (val) {
                                  med.changemodel(val);
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
          },
        );
      },
    );
  }

  dynamic repeat(value) {
    if (value.toString().startsWith('Repeat every')) {
      String text = value;
      List<String> parts = text.split(" "); // Splitting by space

      // String firstPart = parts[0]; // "Repeat"
      // String secondPart = parts[1]; // "every"
      String thirdPart = parts[2]; // "1"
      String fourthPart = parts[3]; // "Month"
      var rp =
          "${fetchlocale(context).repeatevery} $thirdPart ${repeat(fourthPart)}";
      return rp;
    } else {
      var data = {
        "Repeat every": fetchlocale(context).repeatevery,
        "Day": fetchlocale(context).dayse,
        "Month": fetchlocale(context).monthse,
        "Year": fetchlocale(context).yeare,
        "Day's": fetchlocale(context).daysee,
        "Month's": fetchlocale(context).monthsee,
        "Year's": fetchlocale(context).yearse,
        "Does not repeat": fetchlocale(context).doesnotrepeat,
        "Every day": fetchlocale(context).everyday,
        "Every week": fetchlocale(context).everyweek,
        "Every fortnightly": fetchlocale(context).everyfornightly,
        "Every month": fetchlocale(context).everymonth,
        "Every year": fetchlocale(context).everyyear
      };
      return data[value] ?? value;
    }
  }
}
