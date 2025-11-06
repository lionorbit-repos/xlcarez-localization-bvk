// ignore_for_file: use_build_context_synchronously


import 'package:XLcarez/env/appexports.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Appointmentdetailview extends StatefulWidget {
  const Appointmentdetailview({super.key});

  @override
  State<Appointmentdetailview> createState() => _AppointmentdetailviewState();
}

class _AppointmentdetailviewState extends State<Appointmentdetailview> {
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer2<Appointmentcontroller, Authcontroller>(
          builder: (_, aptctrl, auth, child) {
        return Scaffold(
          appBar: Themeappbar(
            title: fetchlocale(context).appointmentdetail,
            leading: true,
          ),
          body: aptctrl.appointmentloadbyid || aptctrl.saveappointmentload
              ? loader()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                          color: bgClr1,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Apptextwidget(
                                      auth.userData?["roleId"] == 5
                                          ? "Dr .${aptctrl.appointmentmodel?.clinicianName ?? ""}"
                                          : aptctrl.appointmentmodel
                                                  ?.patientName ??
                                              "",
                                      style: TxtStls.stl14,
                                    ),
                                    Row(
                                      children: [
                                        Apptextwidget(
                                          "PID :",
                                          style: TxtStls.hintStl,
                                        ),
                                        appspace(w: 10),
                                        Apptextwidget(
                                          "${aptctrl.appointmentmodel?.patientId}",
                                          style: TxtStls.hintStl,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                appspace(h: 2),
                                Apptextwidget(
                                  aptctrl.appointmentmodel?.specialityName ??
                                      "",
                                  style: TxtStls.labelStlhint,
                                )
                              ],
                            ),
                          )),
                      appspace(h: 10),
                      Card(
                        color: bgClr1,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Apptextwidget(
                                    fetchlocale(context).consultationtype,
                                    style: TxtStls.hintStl,
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 15,
                                        backgroundColor: primary,
                                        child: Icon(
                                            aptctrl.appointmentmodel
                                                        ?.teleConsultation ==
                                                    "yes"
                                                ? FontAwesomeIcons.video
                                                : FontAwesomeIcons.hospitalUser,
                                            color: bgClr1,
                                            size: 15),
                                      ),
                                      appspace(w: 10),
                                      Apptextwidget(
                                        aptctrl.appointmentmodel
                                                    ?.teleConsultation ==
                                                "yes"
                                            ? fetchlocale(context)
                                                .teleconsultatione
                                            : fetchlocale(context)
                                                .hospitalconsultation,
                                        style: TxtStls.stl14,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              appspace(h: 5),
                              Divider(
                                height: 2,
                                color: hintClr.withValues(alpha: 0.5),
                              ),
                              appspace(h: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: fetcolbystatus(
                                            status: aptctrl
                                                .appointmentmodel?.status),
                                        border: Border.all(
                                            color: fetcolbystatus(
                                                status: aptctrl
                                                    .appointmentmodel?.status)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Apptextwidget(
                                      aptctrl.appointmentmodel?.status ?? "",
                                      style: fetchfontstyle(
                                          aptctrl.appointmentmodel?.status),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 15,
                                        backgroundColor: primary,
                                        child: Icon(Icons.contactless,
                                            color: bgClr1),
                                      ),
                                      appspace(w: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: aptctrl.appointmentmodel
                                                        ?.paymentAmount ==
                                                    0
                                                ? errorClr.withValues(
                                                    alpha: 0.5)
                                                : success.withValues(
                                                    alpha: 0.5),
                                            border: Border.all(
                                                color: aptctrl.appointmentmodel
                                                            ?.paymentAmount ==
                                                        0
                                                    ? errorClr.withValues(
                                                        alpha: 0.5)
                                                    : success.withValues(
                                                        alpha: 0.5)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Apptextwidget(
                                          aptctrl.appointmentmodel
                                                      ?.paymentAmount ==
                                                  0
                                              ? "Pending"
                                              : "Paid",
                                          style: aptctrl.appointmentmodel
                                                      ?.paymentAmount ==
                                                  0
                                              ? TxtStls.errorStl
                                              : TxtStls.completedstyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      appspace(h: 10),
                      Card(
                        color: bgClr1,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Apptextwidget(
                                    fetchlocale(context).date_time,
                                    style: TxtStls.labelStlhint,
                                  ),
                                  Apptextwidget(
                                    fetchlocale(context).amount,
                                    style: TxtStls.labelStlhint,
                                  )
                                ],
                              ),
                              appspace(h: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Apptextwidget(
                                    aptctrl.appointmentmodel?.status ==
                                                "Waitlisted" ||
                                            aptctrl.appointmentmodel?.status ==
                                                "Confirmed"
                                        ? "${dateformat(format: "dd/MMM/yyy", vale: DateTime.parse(aptctrl.appointmentmodel!.preferredDate!.split("T")[0]))} ${aptctrl.appointmentmodel!.preferredTime}"
                                        : dateformat(
                                            format: "dd/MMM/yyy hh:mm a",
                                            vale: aptctrl.appointmentmodel
                                                        ?.status ==
                                                    "Checkin"
                                                ? DateTime.parse(
                                                    "${aptctrl.appointmentmodel?.startTime}")
                                                : DateTime.parse(
                                                    "${aptctrl.appointmentmodel?.endTime}")),
                                    style: TxtStls.hintStl,
                                  ),
                                  Apptextwidget(
                                    "₹ ${aptctrl.appointmentmodel?.teleConsultation == "yes" ? 500 : 300}",
                                    style: TxtStls.stl13,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          bottomNavigationBar: bottomContainer(
              child: fillButton(context,
                  load: aptctrl.saveappointmentload,
                  title: aptctrl.appointmentmodel?.paymentAmount == 0
                      ? fetchlocale(context).paybalance
                      : fetchlocale(context).checkin, onTap: () {
            if (aptctrl.appointmentmodel?.paymentAmount != 0) {
              var aptjson = {
                "appointmentId": aptctrl.appointmentmodel?.appointmentId,
                "startTime": DateTime.now().toIso8601String(),
                "endTime": "",
                "patientId": aptctrl.appointmentmodel?.patientId,
                "clinicianId": aptctrl.appointmentmodel?.clinicianId,
                "specialityId": aptctrl.appointmentmodel?.specialityId,
                "status": "Checkin",
                "teleConsultation": aptctrl.appointmentmodel?.teleConsultation,
                "preferedGender": aptctrl.appointmentmodel?.preferedGender,
                "preferredDate": aptctrl.appointmentmodel?.preferredDate,
                "transactionId": aptctrl.appointmentmodel?.transactionId,
                "paymentStatus": aptctrl.paymentype,
                "paymentAmount":
                    aptctrl.appointmentmodel?.teleConsultation == "yes"
                        ? 500
                        : 300,
                "preferredTime": aptctrl.appointmentmodel?.preferredTime,
                "hospitalId": aptctrl.appointmentmodel?.hospitalId
              };
              aptctrl.appointmentsave(context, ajson: aptjson).whenComplete(() {
                aptctrl
                    .getappointbyid(id: aptctrl.appointmentmodel?.appointmentId)
                    .whenComplete(() {
                  Navigator.pop(context);
                  navigationSlide(
                      context,
                      Lontudnanalview(
                        id: aptctrl.appointmentmodel?.patientId,
                        aptid: aptctrl.appointmentmodel?.appointmentId,
                        issameuser: auth.userData?["userId"] ==
                            aptctrl.appointmentmodel?.patientId,
                      ));
                  // aptctrl.resetappointment();
                  aptctrl.getallappointments();
                });
              });
            } else {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Apptextwidget(
                        fetchlocale(context).payment,
                        style: TxtStls.stl15,
                      ),
                      content: Apptextwidget(
                        "${fetchlocale(context).areyousurewant} ₹${aptctrl.appointmentmodel?.teleConsultation == "yes" ? 500 : 300} ${fetchlocale(context).rupeese}?",
                        // "Are you sure Collect amount rupees ₹${aptctrl.appointmentmodel?.teleConsultation == "yes" ? 500 : 300}?",
                        style: TxtStls.stl13,
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              var aptjson = {
                                "appointmentId":
                                    aptctrl.appointmentmodel?.appointmentId,
                                "startTime": "",
                                "endTime": "",
                                "patientId":
                                    aptctrl.appointmentmodel?.patientId,
                                "clinicianId":
                                    aptctrl.appointmentmodel?.clinicianId,
                                "specialityId":
                                    aptctrl.appointmentmodel?.specialityId,
                                "status": "Waitlisted",
                                "teleConsultation":
                                    aptctrl.appointmentmodel?.teleConsultation,
                                "preferedGender":
                                    aptctrl.appointmentmodel?.preferedGender,
                                "preferredDate":
                                    aptctrl.appointmentmodel?.preferredDate,
                                "transactionId": generateTxnId(11),
                                "paymentStatus": aptctrl.paymentype,
                                "paymentAmount": aptctrl.appointmentmodel
                                            ?.teleConsultation ==
                                        "yes"
                                    ? 500
                                    : 300,
                                "preferredTime":
                                    aptctrl.appointmentmodel?.preferredTime,
                                "hospitalId":
                                    aptctrl.appointmentmodel?.hospitalId
                              };
                              
                              aptctrl
                                  .appointmentsave(context, ajson: aptjson)
                                  .whenComplete(() {
                                aptctrl.getappointbyid(
                                    id: aptctrl
                                        .appointmentmodel?.appointmentId);
                                aptctrl.resetappointment();
                                aptctrl.getallappointments();
                              });
                            },
                            child: Apptextwidget(
                              fetchlocale(context).yes,
                              style: TxtStls.stl12,
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Apptextwidget(
                              fetchlocale(context).no,
                              style: TxtStls.stl12,
                            )),
                      ],
                    );
                  });
            }
          })),
        );
      }),
    );
  }
}
