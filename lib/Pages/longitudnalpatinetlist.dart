// ignore_for_file: deprecated_member_use

import 'package:XLcarez/env/appexports.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Longitudnalpatinetlist extends StatefulWidget {
  const Longitudnalpatinetlist({super.key, required this.appointmentdata});
  final Appointmentmodel appointmentdata;

  @override
  State<Longitudnalpatinetlist> createState() => _LongitudnalpatinetlistState();
}

class _LongitudnalpatinetlistState extends State<Longitudnalpatinetlist> {
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer<Appointmentcontroller>(builder: (_, ctrl, child) {
        return Scaffold(
          appBar: Themeappbar(
            title: (widget.appointmentdata.patientName ?? "")
                .toString()
                .capitalize(),
            leading: true,
          ),
          body: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (_, i) {
                final data = ctrl.appointmentlist
                    .where((el) =>
                        el.patientId == widget.appointmentdata.patientId)
                    .toList()[i];
                return Card(
                  elevation: 2,
                  surfaceTintColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: bgClr1,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Apptextwidget(
                                "#XLcarez${data.appointmentId.toString().length < 2 ? "0${data.appointmentId}" : data.appointmentId}",
                                style: TxtStls.labelStlhint,
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 2),
                                height: 30,
                                width: 150,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: fetcolbystatus(status: data.status),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Apptextwidget(
                                  fetchloacalestatus(context, data.status) ??
                                      "",
                                  style: fetchfontstyle(data.status),
                                )),
                              ),
                            ],
                          ),
                          appspace(h: 10),
                          Row(
                            children: [
                              const Icon(FontAwesomeIcons.stethoscope),
                              appspace(w:10),
                              Apptextwidget(
                                data.specialityName ?? "",
                                style: TxtStls.themestyle14,
                              ),
                            ],
                          ),
                          appspace(h: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.calendar,
                                    color: headerClr,
                                    size: 15,
                                  ),
                                  appspace(w: 10),
                                   SizedBox(
                            width: 200,
                            child: Apptextwidget(
                              data.status == "Waitlisted" ||
                                      data.status == "Confirmed"
                                  ? "${dateformat(format: "dd/MMM/yyy", vale: DateTime.parse(data.preferredDate!.split("T")[0]))} ${data.preferredTime}"
                                  : dateformat(
                                      format: "dd/MMM/yyy hh:mm a",
                                      vale: data.status == "Checkin"
                                          ? DateTime.parse("${data.startTime}")
                                          : DateTime.parse("${data.endTime}")),
                              style: TxtStls.hintStl,
                            ),
                          )
                                ],
                              ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Visibility(
                                          visible: 
                                              data.status == "Waitlisted",
                                          child: Container(
                                            height: 35,
                                            width: 35,
                                            margin: const EdgeInsets.only(right: 5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: hintClr.withOpacity(0.1)),
                                            child: IconButton(
                                                onPressed: () {
                                                  ctrl.getappointbyid(
                                                      id: data.appointmentId);
                                                  navigationSlide(context,
                                                      const Appointmentdetailview());
                                                },
                                                icon: const Icon(
                                                  FontAwesomeIcons.eye,
                                                  size: 18,
                                                  color: primary,
                                                )),
                                          )),

                                      Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: hintClr.withOpacity(0.1)),
                                          child: IconButton(
                                              onPressed: data.teleConsultation ==
                                                      "yes"
                                                  ? () {
                                                      if (data.status ==
                                                          "Checkin") {
                                                        checkAndRequestPermissions(
                                                            hospitalid:
                                                                data.hospitalId,
                                                            aptid: data
                                                                .appointmentId);
                                                      }
                                                      //jionmeet(hospitalid: data.hospitalId,aptid: data.appointmentId);
                                                    }
                                                  : null,
                                              icon: Icon(
                                                size: 18,
                                                data.teleConsultation == "yes"
                                                    ? FontAwesomeIcons.video
                                                    : FontAwesomeIcons.hospitalUser,
                                                color: primary,
                                              ))),
                                      //  Icon(data.teleConsultation=="yes"?FontAwesomeIcons.video:FontAwesomeIcons.hospitalUser,color: bgClr1,size: 20,),
                                      appspace(w: 10),
                                      Visibility(
                                          visible: data.status == "Checkin" ||
                                              data.status == "Completed",
                                          child: Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: hintClr.withOpacity(0.1)),
                                            child: IconButton(
                                                onPressed: () {
                                                  navigationSlide(
                                                      context,
                                                      Lontudnanalview(
                                                        aptid: data.appointmentId,
                                                        id: data.patientId,
                                                        issameuser: false,
                                                      ));
                                                  // if (auth.userData?["roleId"] == 4) {
                                                  //   navigationSlide(
                                                  //       context,
                                                  //       Lontudnanalview(
                                                  //         aptid: data.appointmentId,
                                                  //         id: data.patientId,
                                                  //         issameuser: auth.userData?["userId"]==data.patientId,
                                                  //       ));
                                                  // } else {
                                                  //   medication.getmedications(
                                                  //       id: data.appointmentId);
                                                  //   navigationSlide(
                                                  //       context, Medicationview());
                                                  // }
                                                },
                                                icon: const Icon(
                                                  size: 18,
                                                  FontAwesomeIcons.filePrescription,
                                                  color: primary,
                                                )),
                                          )),
                                    ],
                                  ),
                            ],
                          ),
                        ],
                      )),
                );
              },
              separatorBuilder: (_, j) => appspace(h: 5),
              itemCount: ctrl.appointmentlist
                  .where(
                      (el) => el.patientId == widget.appointmentdata.patientId)
                  .toList()
                  .length),
        );
      }),
    );
  }
}
