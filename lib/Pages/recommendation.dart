import 'dart:convert';

import 'package:XLcarez/env/appexports.dart';

class Recommendationview extends StatefulWidget {
  const Recommendationview({super.key});

  @override
  State<Recommendationview> createState() => _RecommendationviewState();
}

class _RecommendationviewState extends State<Recommendationview> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      final aptctrl = Provider.of<Authcontroller>(context, listen: false);
      final auth = Provider.of<Appointmentcontroller>(context, listen: false);
      if (auth.specilatyid != null) {
        aptctrl.getallspecilatyies(id: auth.specilatyid);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<Authcontroller, Appointmentcontroller>(
        builder: (context, auth, aptctrl, child) {
      return Scaffold(
        body: auth.specilatyload
            ? loader()
            : Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton2(
                          underline: const SizedBox.shrink(),
                          hint: Apptextwidget(
                            "${fetchlocale(context).selecte} ${fetchlocale(context).speciliaty}",
                            style: TxtStls.hintStl,
                          ),
                          dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10))),
                          value: aptctrl.specilatyid,
                          items: auth.allspecilatylist
                              .where((e) =>
                                  e.specialityId !=
                                  aptctrl.appointmentmodel?.specialityId)
                              .map((e) => DropdownMenuItem(
                                  value: e.specialityId,
                                  child: Apptextwidget(e.specialityName ?? "")))
                              .toList(),
                          onChanged: auth.userData?["roleId"] == 5
                              ? null
                              : (val) {
                                  aptctrl.chnagespecialityid(val);
                                  auth.getallspecilatyies(id: val);
                                  aptctrl.chnagedoctor(null);
                                }),
                      DropdownButton2(
                          underline: const SizedBox.shrink(),
                          hint: Apptextwidget(
                            "${fetchlocale(context).selecte} ${fetchlocale(context).doctor}",
                            style: TxtStls.hintStl,
                          ),
                          dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10))),
                          value: aptctrl.doctorid,
                          items: auth.specilatylist
                              .map((e) => DropdownMenuItem(
                                  value: e.userId,
                                  child: Apptextwidget(e.doctorName ?? "")))
                              .toList(),
                          onChanged: auth.userData?["roleId"] == 5
                              ? null
                              : (val) {
                                  aptctrl.chnagedoctor(val);
                                }),
                      appspace(h: 10),
                      Apptextwidget(
                        fetchlocale(context).commentse,
                        style: TxtStls.stl16,
                      ),
                      textfiled(
                          maxlines: 5,
                          controller: aptctrl.commentscontroller,
                          readOnly: auth.userData?["roleId"] == 5,
                          labelText: "",
                          hintText:
                              "${fetchlocale(context).enter} ${fetchlocale(context).commentse}"),
                      appspace(h: 10),
                      Visibility(
                        visible: auth.userData?["roleId"] == 5 &&
                            aptctrl.doctorid != null,
                        child: GestureDetector(
                          onTap: () {
                            navigationSlideAndReplace(
                                context,
                                Doctorprofile(
                                  doctorModel: aptctrl.doctorid,
                                ));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 2),
                            height: 40,
                            width: genratemediaquery(context).size.width,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: primary.withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Apptextwidget(
                              fetchlocale(context).bookappointment,
                              style: TxtStls.apnttextstl,
                            )),
                          ),
                        ),
                      ),
                      Visibility(
                        // visible: aptctrl.appointmentmodel?.addedBy == null &&
                        //     auth.userData?["roleId"] == 4,
                        visible: auth.userData?["roleId"] == 4,
                        child: fillButton(context,
                            load: aptctrl.saveappointmentload ||
                                aptctrl.appointmentloadbyid,
                            title: fetchlocale(context).submit, onTap: () {
                          var aptjson = {
                            "appointmentId":
                                aptctrl.appointmentmodel?.appointmentId,
                            "startTime": aptctrl.appointmentmodel?.startTime,
                            "endTime": aptctrl.appointmentmodel?.endTime,
                            "patientId": aptctrl.appointmentmodel?.patientId,
                            "clinicianId":
                                aptctrl.appointmentmodel?.clinicianId,
                            "specialityId":
                                aptctrl.appointmentmodel?.specialityId,
                            "status": aptctrl.appointmentmodel?.status,
                            "teleConsultation":
                                aptctrl.appointmentmodel?.teleConsultation,
                            "preferedGender":
                                aptctrl.appointmentmodel?.preferedGender,
                            "preferredDate":
                                aptctrl.appointmentmodel?.preferredDate,
                            "transactionId":
                                aptctrl.appointmentmodel?.transactionId,
                            "paymentStatus": aptctrl.paymentype,
                            "paymentAmount":
                                aptctrl.appointmentmodel?.paymentAmount,
                            "preferredTime":
                                aptctrl.appointmentmodel?.preferredTime,
                            "hospitalId": aptctrl.appointmentmodel?.hospitalId,
                            "clinicalNotes": jsonEncode({
                              "head": aptctrl.controller1.text,
                              "left_arm": aptctrl.controller2.text,
                              "right_arm": aptctrl.controller3.text,
                              "left_leg": aptctrl.controller4.text,
                              "right_leg": aptctrl.controller5.text,
                              "notes": aptctrl.controller6.text,
                              "coronaryartery": aptctrl.coronaryartery,
                              "cerebrovascular": aptctrl.cerebrovascular,
                              "peripheralartery": aptctrl.peripheralartery,
                              "macrocontroller": aptctrl.macrocontroller.text,
                              "retinopathy": aptctrl.retinopathy,
                              "neuropathy": aptctrl.neuropathy,
                              "nephropathy": aptctrl.nephropathy,
                              "microcontroller": aptctrl.microcontroller.text,
                              "skin": aptctrl.skin,
                              "sensation": aptctrl.sensation,
                              "vibration": aptctrl.vibration,
                              "deformity": aptctrl.deformity,
                              "ulcer": aptctrl.ulcer,
                              "footcontroller": aptctrl.footcontroller.text,
                              "slectVisittype": aptctrl.slectVisittype,
                              "sbpcontroller": aptctrl.sbpcontroller.text,
                              "dbpcontroller": aptctrl.dbpcontroller.text,
                              "accontroller": aptctrl.accontroller.text,
                              "pccontroller": aptctrl.pccontroller.text,
                              "heightcontroller": aptctrl.heightcontroller.text,
                              "weightDueDatecontroller":
                                  aptctrl.weightDueDatecontroller.text,
                              "bmicontroller": aptctrl.bmicontroller.text,
                              "selecttobacco": aptctrl.selecttobacco,
                              "nonlabcontroller": aptctrl.nonlabcontroller.text,
                              "labBasedcontroller":
                                  aptctrl.labBasedcontroller.text,
                              "hbA1Ccontroller": aptctrl.hbA1Ccontroller.text,
                              "tCcontroller": aptctrl.tCcontroller.text,
                              "tGLcontroller": aptctrl.tGLcontroller.text,
                              "hDLcontroller": aptctrl.hDLcontroller.text,
                              "lDLcontroller": aptctrl.lDLcontroller.text,
                              "vlDLcontroller": aptctrl.vlDLcontroller.text,
                              "ureacontroller": aptctrl.ureacontroller.text,
                              "creatininecontroller":
                                  aptctrl.creatininecontroller.text,
                              "eGFRcontroller": aptctrl.eGFRcontroller.text,
                              "uACRcontroller": aptctrl.uACRcontroller.text,
                              "tSHcontroller": aptctrl.tSHcontroller.text,
                              "fT4controller": aptctrl.fT4controller.text,
                              "fT3controller": aptctrl.fT3controller.text,
                              "funduscontroller": aptctrl.funduscontroller.text,
                              "eCHOcontroller": aptctrl.eCHOcontroller.text,
                              "eCGcontroller": aptctrl.eCGcontroller.text,
                              "visitDuedatacontroller":
                                  aptctrl.visitDuedatacontroller.text,
                              "invDueDatecontroller":
                                  aptctrl.invDueDatecontroller.text,
                              "acPCDueDatecontroller":
                                  aptctrl.acPCDueDatecontroller.text
                            }),
                            "appointmentReferral": jsonEncode({
                              "specid": aptctrl.specilatyid,
                              "doctorid": aptctrl.doctorid,
                              "comments": aptctrl.commentscontroller.text
                            })
                          };
                          //log(aptjson.toString());
                          aptctrl
                              .appointmentsave(context, ajson: aptjson)
                              .whenComplete(() {
                            aptctrl
                                .getappointbyid(id: aptctrl.aptid)
                                .whenComplete(() {
                              aptctrl.getallappointments().whenComplete(() {
                                // Navigator.pop(context);
                              });
                            });
                          });
                        }),
                      )
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
