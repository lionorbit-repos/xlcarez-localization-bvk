// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'dart:developer';

import 'package:XLcarez/env/appexports.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Confirmappointment extends StatefulWidget {
  DoctorModel doctorModel;
  Confirmappointment({super.key, required this.doctorModel});

  @override
  State<Confirmappointment> createState() => _ConfirmappointmentState();
}

class _ConfirmappointmentState extends State<Confirmappointment> {
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer2<Appointmentcontroller, Authcontroller>(
          builder: (_, aptctrl, auth, child) {
        return Scaffold(
          appBar: Themeappbar(
            title: fetchlocale(context).appointmentdetails,
            leading: true,
          ),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: bgClr1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Flexible(
                                child: networkImages(
                                    url: widget.doctorModel.image == null ||
                                            widget.doctorModel.image == ""
                                        ? avtharimg
                                        : "${asseturl}Users/${widget.doctorModel.image}",
                                    size: 80.0)),
                            appspace(w: 10),
                            Flexible(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Apptextwidget(
                                    widget.doctorModel.userName ?? "",
                                    style: TxtStls.stl14,
                                  ),
                                  appspace(h: 5),
                                  Apptextwidget(
                                    widget.doctorModel.email ?? "",
                                    style: TxtStls.stl14,
                                  ),
                                  appspace(h: 5),
                                  // Text(
                                  //   dateformat(
                                  //       format: "dd MMM yyy,hh:mm a",
                                  //       vale: DateTime.parse(
                                  //           "${widget.doctorModel.createdDate}Z")),
                                  //   style: TxtStls.stl12,
                                  // ),
                                  //appspace(h: 5),
                                  Row(
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.stethoscope,
                                        color: primary,
                                      ),
                                      appspace(w: 10),
                                      Apptextwidget(
                                        aptctrl.specialityid?.specialityName ??
                                            "",
                                        style: TxtStls.stl13,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      appspace(h: 10),
                      Apptextwidget(
                         fetchlocale(context).consultationtype,
                        style: TxtStls.labelmeduin,
                      ),
                      appspace(h: 5),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: hintClr.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: hintClr.withValues(alpha: 0.1))),
                        child: Row(
                          children: [
                            Icon(
                              aptctrl.consultiontype == "yes"
                                  ? FontAwesomeIcons.video
                                  : FontAwesomeIcons.hospitalUser,
                              color: primary,
                            ),
                            appspace(w: 10),
                            Apptextwidget(
                              aptctrl.consultiontype == "yes"
                          ? fetchlocale(context).teleconsultatione
                          : fetchlocale(context).hospitalconsultation,
                              style: TxtStls.stl13,
                            )
                          ],
                        ),
                      ),
                      appspace(h: 10),
                      Apptextwidget(
                         fetchlocale(context).detailse,
                        style: TxtStls.labelmeduin,
                      ),
                      appspace(h: 5),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: hintClr.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: hintClr.withValues(alpha: 0.1))),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.medical_information,
                                  color: primary,
                                ),
                                appspace(w: 10),
                                Apptextwidget(
                                  "${auth.userData?["userId"] ?? ""}",
                                  style: TxtStls.stl13,
                                )
                              ],
                            ),
                            appspace(h: 10),
                            Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.user,
                                  color: primary,
                                ),
                                appspace(w: 10),
                                Apptextwidget(
                                  auth.userData?["userName"] ?? "",
                                  style: TxtStls.stl13,
                                )
                              ],
                            ),
                            appspace(h: 10),
                            Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.calendar,
                                  color: primary,
                                ),
                                appspace(w: 10),
                                Apptextwidget(
                                  dateformat(format: "dd/MM/yyy EEEE", vale: aptctrl.selctedte),
                                  style: TxtStls.stl13,
                                )
                              ],
                            ),
                            appspace(h: 5),
                            Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.clock,
                                  color: primary,
                                ),
                                appspace(w: 10),
                                Apptextwidget(
                                  formatslottiming(aptctrl.seletedtime),
                                  style: TxtStls.stl13,
                                )
                              ],
                            ),
                            appspace(h: 5),
                            Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.moneyBill,
                                  color: primary,
                                ),
                                appspace(w: 10),
                                Apptextwidget(
                                  "${aptctrl.consultiontype == "yes" ? 500 : 300} ₹",
                                  style: TxtStls.stl13,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      appspace(h: 15),
                      Apptextwidget(
                        fetchlocale(context).paymenttype,
                        style: TxtStls.labelmeduin,
                      ),
                      appspace(h: 5),
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: hintClr.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: hintClr.withValues(alpha: 0.1))),
                          child: Wrap(
                            children: aptctrl.payments
                                .map((v) => GestureDetector(
                                      onTap: () {
                                        aptctrl.chnagepaymentype(v);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: aptctrl.paymentype == v
                                                ? primary
                                                : hintClr,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Apptextwidget(
                                          fetchtitles(context, v),
                                          style: TxtStls.wstl13,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          )),
                    ],
                  ),
                ),
              )),
          bottomNavigationBar: bottomContainer(
              child: fillButton(context,
                  load: aptctrl.saveappointmentload,
                  title: fetchlocale(context).bookappointment, onTap: () async {
            var aptjson = {
              "appointmentId": 0,
              "startTime": "",
              "endTime": "",
              "patientId": await auth.fethuserid(),
              "clinicianId": widget.doctorModel.userId,
              "specialityId": aptctrl.specialityid?.specialityId ?? 0,
              "status": "Waitlisted",
              "addedBy": await auth.fethuserid(),
              "teleConsultation": aptctrl.consultiontype,
              "preferedGender": widget.doctorModel.gender ?? "Any",
              "preferredDate": aptctrl.selctedte.toIso8601String(),
              "transactionId": generateTxnId(11),
              "paymentStatus": aptctrl.paymentype,
              "paymentAmount": 0,
              "preferredTime": formatslottiming(aptctrl.seletedtime),
              "hospitalId": aptctrl.hospitalid?.hospitalId
            };
             log(aptjson.toString());
            aptctrl
                .appointmentsave(context,
                    name: "Dr. ${widget.doctorModel.userName}", ajson: aptjson)
                .whenComplete(() {
              aptctrl.resetappointment();
              aptctrl.getallappointments();
            });
          })),
        );
      }),
    );
  }
}
