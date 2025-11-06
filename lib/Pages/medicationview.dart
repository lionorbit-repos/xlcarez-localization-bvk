// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, use_build_context_synchronously
import 'package:XLcarez/env/appexports.dart';

class Medicationview extends StatefulWidget {
  var from;
  Medicationview({
    super.key,
    this.from = "",
  });

  @override
  State<Medicationview> createState() => _MedicationviewState();
}

class _MedicationviewState extends State<Medicationview> {
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      color: widget.from == "Long" ? [transparentcol, transparentcol] : null,
      child: Consumer2<Authcontroller, Medicationcontroller>(
          builder: (_, auth, mctrl, child) {
        return Scaffold(
          appBar: widget.from == "Long"
              ? null
              : Themeappbar(
                  title: fetchlocale(context).medication,
                  leading: true,
                ),
          body: mctrl.medicationload || mctrl.savemedicationload
              ? loader()
              : Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Visibility(
                          visible: auth.userData?["roleId"] == 4,
                          child: ElevatedButton.icon(
                              icon: Icon(
                                Icons.add,
                                color: bgClr1,
                              ),
                              onPressed: () {
                                mctrl.resetmedication();
                                navigationSlide(context, const Addmedication());
                              },
                              label: Apptextwidget(
                                "${fetchlocale(context).add} ${fetchlocale(context).medication}",
                                style: TxtStls.wstl12,
                              ))),
                    ),
                    appspace(h: 10),
                    mctrl.medicationlist.isEmpty
                        ? const Expanded(child: Nodatafound())
                        : Expanded(
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: checkscreenwidth(
                                                    genratemediaquery(context)
                                                        .size
                                                        .width) ==
                                                "Small"
                                            ? 1
                                            : checkscreenwidth(
                                                        genratemediaquery(
                                                                context)
                                                            .size
                                                            .width) ==
                                                    "Medium"
                                                ? 2
                                                : 3,
                                        childAspectRatio: 2.0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                itemBuilder: (_, i) {
                                  final data = mctrl.medicationlist[i];
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    color: bgClr1,
                                    surfaceTintColor: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Apptextwidget(
                                                    "#ID${data.medicationId}",
                                                    style: TxtStls.stl14,
                                                  ),
                                                  Visibility(
                                                      visible: data.addedBy ==
                                                          auth.userData?[
                                                              "userId"],
                                                      child: IconButton(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          onPressed: () {
                                                            mctrl
                                                                .assignmedication(
                                                                    data);
                                                            mctrl.changeusrrid(
                                                                data.userId);
                                                            navigationSlide(
                                                                context,
                                                                const Addmedication());
                                                          },
                                                          icon: const Icon(
                                                            Icons.edit_note,
                                                            size: 20.0,
                                                            color: primary,
                                                          ))),
                                                ],
                                              ),
                                              Apptextwidget(
                                                dateformat(
                                                    format: "dd/MMM/yyy",
                                                    vale: DateTime.parse(
                                                        "${data.createdDate}Z")),
                                                style: TxtStls.stl12,
                                              ),
                                            ],
                                          ),
                                          appspace(h: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Apptextwidget(
                                                "${fetchlocale(context).medicine}:",
                                                style: TxtStls.labelStl,
                                              ),
                                              appspace(w: 15),
                                              Apptextwidget(
                                                data.medicineName?.text ?? "",
                                                style: TxtStls.stl13,
                                              )
                                            ],
                                          ),
                                          appspace(h: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Apptextwidget(
                                                "${fetchlocale(context).dosage}:",
                                                style: TxtStls.labelStl,
                                              ),
                                              appspace(w: 15),
                                              Apptextwidget(
                                                data.dosage ?? "",
                                                style: TxtStls.stl13,
                                              )
                                            ],
                                          ),
                                          appspace(h: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Apptextwidget(
                                                "${fetchlocale(context).duration}:",
                                                style: TxtStls.labelStl,
                                              ),
                                              appspace(w: 15),
                                              Apptextwidget(
                                                data.days ?? "",
                                                style: TxtStls.stl13,
                                              )
                                            ],
                                          ),
                                          //appspace(h: 5),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: mctrl.medicationlist.length))
                  ],
                ),
        );
      }),
    );
  }

  // showmedicationdailog() {
  //   Consumer3<Medicationcontroller, Authcontroller, Appointmentcontroller>
  //       alert = Consumer3(builder: (_, ctrl, auth, aptctrl, child) {
  //     return appdailog(context,
  //         alert: Apptextwidget(
  //           "${ctrl.medication.medicationId != 0 ? "Edit" : "Add"} Medication",
  //           style: TxtStls.stl15,
  //         ),
  //         content: SizedBox(
  //           height: genratemediaquery(context).size.height/2,
  //           width: genratemediaquery(context).size.width,
  //           child:Scaffold(
  //             body: Form(
  //                 key: key,
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     ctrl.savemedicationload
  //                         ? loader()
  //                         : const SizedBox.shrink(),
  //                     nameField(
  //                       controller: ctrl.medication.medicineName,
  //                       labelText: "Medication Name",
  //                       col: headerClr,
  //                       hintText: "Enter medication name",
  //                     ),
  //                     appspace(h: 10),
  //                     textfiled(
  //                       controller: ctrl.medication.dosage,
  //                       col: headerClr,
  //                       labelText: "Medication Dosage",
  //                       hintText: "Enter medication dosage",
  //                     ),
  //                     appspace(h: 10),
  //                     textfiled(
  //                       //maxLength: 3,
  //                       col: headerClr,
  //                       controller: ctrl.medication.days,
  //                       labelText: "Days",
  //                       hintText: "Enter days",
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //           ),
  //         ),
  //         actionno: () {
  //           Navigator.pop(context);
  //           ctrl.resetmedication();
  //         },
  //         ationtitleno: "Cancel",
  //         ationtitleyes: "Save",
  //         actionsyes: () async {
  //           if (key.currentState!.validate()) {
  //             Medication mymedication = ctrl.medication;
  //             mymedication.addedBy = await auth.fethuserid();
  //             mymedication.userId = ctrl.userid;
  //             mymedication.appointmentId =
  //                 aptctrl.appointmentmodel?.appointmentId;
  //             Navigator.pop(context);
  //             ctrl
  //                 .savemedication(mjson: mymedication.toJson())
  //                 .whenComplete(() {
  //               ctrl
  //                   .getmedications(id: aptctrl.appointmentmodel?.appointmentId)
  //                   .whenComplete(() {
  //                 ctrl.resetmedication();
  //               });
  //             });
  //             // log(mymedication.toJson().toString());
  //           }
  //         });
  //   });

  //   showAdaptiveDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
}
