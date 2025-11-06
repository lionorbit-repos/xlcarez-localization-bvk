// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, use_build_context_synchronously, library_private_types_in_public_api
import 'dart:convert';
import 'dart:developer';

import 'package:XLcarez/env/appexports.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Lontudnanalview extends StatefulWidget {
  var id;
  var aptid;
  bool issameuser;
  Lontudnanalview(
      {super.key,
      required this.id,
      required this.aptid,
      required this.issameuser});

  @override
  State<Lontudnanalview> createState() => _LontudnanalviewState();
}

class _LontudnanalviewState extends State<Lontudnanalview>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int index = 0;
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) async {
      final auth = Provider.of<Authcontroller>(context, listen: false);
      var userid = await auth.fethuserid();
      final vitak = Provider.of<Vitalscontroller>(context, listen: false);
      final aptctrl =
          Provider.of<Appointmentcontroller>(context, listen: false);
      final ftrl = Provider.of<FoodSearchController>(context, listen: false);
      final conn = Provider.of<Medicationcontroller>(context, listen: false);
      aptctrl.resetappointment();
      vitak.getallvitalslist(id: widget.id);
      if (widget.id != userid) {
        ftrl.getall(id: widget.id);
      }
      conn.getmedications(id: widget.aptid == 0 ? widget.id : widget.aptid);
      conn.changeusrrid(widget.id);
      if (widget.aptid != 0) {
        aptctrl.getappointbyid(id: widget.aptid);
      }
    });
    super.initState();
    tabController = widget.issameuser
        ? TabController(length: 3, vsync: this, initialIndex: index)
        : TabController(vsync: this, length: items.length, initialIndex: index);
  }

  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer2<Authcontroller, Appointmentcontroller>(
          builder: (context, auth, aptctrl, child) {
        return Scaffold(
          appBar: Themeappbar(
            title: fetchlocale(context).records,
            lead: IconButton(
                onPressed: () async {
                  final xtrl =
                      Provider.of<Authcontroller>(context, listen: false);
                  final vitak =
                      Provider.of<Vitalscontroller>(context, listen: false);
                  final ftrl =
                      Provider.of<FoodSearchController>(context, listen: false);
                  if (xtrl.userData["roleId"] == 5) {
                    vitak.getallvitalslist(id: await xtrl.fethuserid());
                    ftrl.getall(id: await xtrl.fethuserid());
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: scaffoldbgcol,
                )),
            leading: true,
            act: [
              IconButton(
                  onPressed: () {
                    final vitak =
                        Provider.of<Vitalscontroller>(context, listen: false);
                    final ftrl = Provider.of<FoodSearchController>(context,
                        listen: false);
                    final conn = Provider.of<Medicationcontroller>(context,
                        listen: false);
                    final auth =
                        Provider.of<Authcontroller>(context, listen: false);
                    vitak.getallvitalslist(id: widget.id);
                    ftrl.getall(id: widget.id);
                    conn.getmedications(
                        id: widget.aptid == 0 ? widget.id : widget.aptid);
                    if (widget.aptid != 0) {
                      aptctrl.getappointbyid(id: widget.aptid).whenComplete(() {
                        if (aptctrl.specilatyid != null) {
                          auth.getallspecilatyies(id: aptctrl.specilatyid);
                        }
                      });
                      auth.getallspecilatyies();
                    }
                    conn.changeusrrid(widget.id);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.arrowsRotate,
                    color: scaffoldbgcol,
                  ))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: TabBar(
                    onTap: (val) {
                      setState(() {
                        index = val;
                      });
                      //ctrl.change(val);
                    },
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    indicatorWeight: 2,
                    indicatorColor: scaffoldbgcol,
                    dividerColor: Colors.transparent,
                    unselectedLabelColor: scaffoldbgcol,
                    controller: tabController,
                    tabs: widget.issameuser
                        ? items
                            .take(3)
                            .toList()
                            .asMap()
                            .entries
                            .map((r) => Container(
                                  margin: const EdgeInsets.only(bottom: 2),
                                  decoration: BoxDecoration(
                                      color: tabController.index == r.key
                                          ? scaffoldbgcol
                                          : transparentcol,
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Apptextwidget(
                                    fetchlabel(context, r.value["header"]),
                                    style: tabController.index == r.key
                                        ? TxtStls.themestyle13
                                        : TxtStls.wstl13,
                                  ),
                                ))
                            .toList()
                        : items
                            .asMap()
                            .entries
                            .map((r) => Container(
                                  margin: const EdgeInsets.only(bottom: 2),
                                  decoration: BoxDecoration(
                                      color: tabController.index == r.key
                                          ? scaffoldbgcol
                                          : transparentcol,
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Apptextwidget(
                                    fetchlabel(context, r.value["header"]),
                                    style: tabController.index == r.key
                                        ? TxtStls.themestyle13
                                        : TxtStls.wstl13,
                                  ),
                                ))
                            .toList(),
                  ),
                ),
                appspace(h: 10),
                Expanded(child: items[tabController.index]["page"] as Widget),
              ],
            ),
          ),
          bottomNavigationBar: Visibility(
            visible: aptctrl.appointmentmodel?.clinicianId ==
                    auth.userData?["userId"] &&
                aptctrl.appointmentmodel?.status != "Completed" &&
                index == 4,
            child: bottomContainer(
                child: fillButton(context,
                    load: aptctrl.saveappointmentload ||
                        aptctrl.appointmentloadbyid,
                    title: "Checkout", onTap: () {
              var aptjson = {
                "appointmentId": aptctrl.appointmentmodel?.appointmentId,
                "startTime": aptctrl.appointmentmodel?.startTime,
                "endTime": DateTime.now().toIso8601String(),
                "patientId": aptctrl.appointmentmodel?.patientId,
                "clinicianId": aptctrl.appointmentmodel?.clinicianId,
                "specialityId": aptctrl.appointmentmodel?.specialityId,
                "status": "Completed",
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
                  "labBasedcontroller": aptctrl.labBasedcontroller.text,
                  "hbA1Ccontroller": aptctrl.hbA1Ccontroller.text,
                  "tCcontroller": aptctrl.tCcontroller.text,
                  "tGLcontroller": aptctrl.tGLcontroller.text,
                  "hDLcontroller": aptctrl.hDLcontroller.text,
                  "lDLcontroller": aptctrl.lDLcontroller.text,
                  "vlDLcontroller": aptctrl.vlDLcontroller.text,
                  "ureacontroller": aptctrl.ureacontroller.text,
                  "creatininecontroller": aptctrl.creatininecontroller.text,
                  "eGFRcontroller": aptctrl.eGFRcontroller.text,
                  "uACRcontroller": aptctrl.uACRcontroller.text,
                  "tSHcontroller": aptctrl.tSHcontroller.text,
                  "fT4controller": aptctrl.fT4controller.text,
                  "fT3controller": aptctrl.fT3controller.text,
                  "funduscontroller": aptctrl.funduscontroller.text,
                  "eCHOcontroller": aptctrl.eCHOcontroller.text,
                  "eCGcontroller": aptctrl.eCGcontroller.text,
                  "visitDuedatacontroller": aptctrl.visitDuedatacontroller.text,
                  "invDueDatecontroller": aptctrl.invDueDatecontroller.text,
                  "acPCDueDatecontroller": aptctrl.acPCDueDatecontroller.text
                }),
                "appointmentReferral": jsonEncode({
                  "specid": aptctrl.specilatyid,
                  "doctorid": aptctrl.doctorid,
                  "comments": aptctrl.commentscontroller.text
                })
              };
              aptctrl
                  .appointmentsave(context, ajson: aptjson, showtoast: true)
                  .whenComplete(() {
                aptctrl.getappointbyid(id: widget.aptid);
                aptctrl.getallappointments().whenComplete(() {
                  Navigator.pop(context);
                });
              });
            })),
          ),
        );
      }),
    );
  }

  var items = [
    {
      "header": "Vitals",
      "page": VitalList(
        from: "Long",
      )
    },
    {
      "header": "Food Log",
      "page": FoodLogList(
        from: "Long",
      )
    },
    {
      "header": "Medication",
      "page": Medicationview(
        from: "Long",
      )
    },
    {"header": "Clinician Notes", "page": const IndicatorWithTextFields()},
    {
      "header": "Recommendation",
      "page": const Recommendationview(),
    },
  ];
}

class IndicatorWithTextFields extends StatefulWidget {
  const IndicatorWithTextFields({super.key});

  @override
  _IndicatorWithTextFieldsState createState() =>
      _IndicatorWithTextFieldsState();
}

class _IndicatorWithTextFieldsState extends State<IndicatorWithTextFields> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<Appointmentcontroller, Authcontroller>(
        builder: (context, aptctrl, auth, child) {
      return Scaffold(
        body: SizedBox(
          height: genratemediaquery(context).size.height,
          width: genratemediaquery(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   spacing: 10.0,
                  //   children: [
                  //     SizedBox(
                  //       height: genratemediaquery(context).size.height / 2.1,
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //         spacing: 10.0,
                  //         children: [
                  //           mycustwid(context,
                  //               label: fetchlocale(context).head,
                  //               controller: aptctrl.controller1,
                  //               enable: auth.userData?["roleId"] == 5),
                  //           mycustwid(context,
                  //               label: fetchlocale(context).rightarm,
                  //               controller: aptctrl.controller3,
                  //               enable: auth.userData?["roleId"] == 5),
                  //           mycustwid(context,
                  //               label: fetchlocale(context).rightleg,
                  //               controller: aptctrl.controller5,
                  //               enable: auth.userData?["roleId"] == 5),
                  //           // SizedBox(
                  //           //     width: checkscreenwidth(genratemediaquery(context)
                  //           //                 .size
                  //           //                 .width) ==
                  //           //             "Small"
                  //           //         ? 70
                  //           //         : checkscreenwidth(genratemediaquery(context)
                  //           //                     .size
                  //           //                     .width) ==
                  //           //                 "Medium"
                  //           //             ? 180
                  //           //             : 200,
                  //           //     child: textfiled(
                  //           //         maxlines: 2,
                  //           //         mOBSTYLE: checkscreenwidth(
                  //           //                     genratemediaquery(context)
                  //           //                         .size
                  //           //                         .width) ==
                  //           //                 "Small"
                  //           //             ? TxtStls.stl12
                  //           //             : null,
                  //           //         labelText: "Head",
                  //           //         controller: _controller1)),
                  //           // SizedBox(
                  //           //     width: checkscreenwidth(genratemediaquery(context)
                  //           //                 .size
                  //           //                 .width) ==
                  //           //             "Small"
                  //           //         ? 70
                  //           //         : checkscreenwidth(genratemediaquery(context)
                  //           //                     .size
                  //           //                     .width) ==
                  //           //                 "Medium"
                  //           //             ? 180
                  //           //             : 200,
                  //           //     child: textfiled(
                  //           //       labelText: "Right Arm",
                  //           //       controller: _controller3,
                  //           //       maxlines: 2,
                  //           //     )),
                  //           // SizedBox(
                  //           //     width: checkscreenwidth(genratemediaquery(context)
                  //           //                 .size
                  //           //                 .width) ==
                  //           //             "Small"
                  //           //         ? 70
                  //           //         : checkscreenwidth(genratemediaquery(context)
                  //           //                     .size
                  //           //                     .width) ==
                  //           //                 "Medium"
                  //           //             ? 180
                  //           //             : 200,
                  //           //     child: textfiled(
                  //           //       labelText: "Right Leg",
                  //           //       controller: _controller5,
                  //           //       maxlines: 2,
                  //           //     )),
                  //         ],
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: genratemediaquery(context).size.height / 2.1,
                  //       child: Image.asset("assets/body.png"),
                  //     ),
                  //     Container(
                  //       height: genratemediaquery(context).size.height / 2.1,
                  //       color: Colors.white,
                  //     ),
                  //     SizedBox(
                  //       height: genratemediaquery(context).size.height / 2.1,
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //         //spacing: 10.0,
                  //         children: [
                  //           mycustwid(context,
                  //               label: fetchlocale(context).leftarm,
                  //               controller: aptctrl.controller2,
                  //               enable: auth.userData?["roleId"] == 5),
                  //           mycustwid(context,
                  //               label: fetchlocale(context).leftleg,
                  //               controller: aptctrl.controller4,
                  //               enable: auth.userData?["roleId"] == 5),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Apptextwidget(fetchlocale(context).cconsultione,
                      style: TxtStls.stl20),
                  const Divider(
                    color: scaffoldbgcol,
                  ),
                  Apptextwidget(fetchlocale(context).visittypee,
                      style: TxtStls.stl16),
                  Column(
                      children: aptctrl.visitList
                          .map((e) => Row(
                                children: [
                                  Radio<dynamic>(
                                      fillColor:
                                          WidgetStateProperty.resolveWith(
                                              (Set states) {
                                        return headerClr;
                                      }),
                                      value: e,
                                      groupValue: aptctrl.slectVisittype,
                                      onChanged: auth.userData?["roleId"] == 5
                                          ? null
                                          : (value) {
                                              aptctrl.changevisit(value);
                                            }),
                                  Apptextwidget(fetchlocalmylist(context, e),
                                      style: TxtStls.stl14),
                                ],
                              ))
                          .toList()),
                  Apptextwidget(
                    "SBP ${aptctrl.slectVisittype == "Patient" ? "*" : ""}",
                    style: TxtStls.stl16,
                  ),
                  numberField(
                      enabled: auth.userData?["roleId"] == 5,
                      maxLength: 3,
                      controller: aptctrl.sbpcontroller,
                      labelText: "",
                      hintText: fetchlocale(context).enter),
                  appspace(h: 5),
                  Apptextwidget(
                    "DBP ${aptctrl.slectVisittype == "Patient" ? "*" : ""}",
                    style: TxtStls.stl16,
                  ),
                  numberField(
                      enabled: auth.userData?["roleId"] == 5,
                      maxLength: 3,
                      controller: aptctrl.dbpcontroller,
                      labelText: "",
                      hintText: fetchlocale(context).enter),
                  appspace(h: 5),
                  Apptextwidget(
                    "AC",
                    style: TxtStls.stl16,
                  ),
                  numberField(
                      enabled: auth.userData?["roleId"] == 5,
                      maxLength: 3,
                      controller: aptctrl.accontroller,
                      labelText: "",
                      hintText: fetchlocale(context).enter),
                  appspace(h: 5),
                  Apptextwidget(
                    "PC",
                    style: TxtStls.stl16,
                  ),
                  numberField(
                      enabled: auth.userData?["roleId"] == 5,
                      maxLength: 3,
                      controller: aptctrl.pccontroller,
                      labelText: "",
                      hintText: fetchlocale(context).enter),
                  appspace(h: 10),
                  Apptextwidget(fetchlocale(context).follwwupe,
                      style: TxtStls.stl16),
                  appspace(h: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Apptextwidget(fetchlocale(context).visitduedate,
                          style: TxtStls.stl16),
                      AbsorbPointer(
                        absorbing: auth.userData?["roleId"] == 5,
                        child: dateField(context,
                            labelText: "",
                            controller: aptctrl.visitDuedatacontroller,
                            hintText: "DD/MM/YYYY"),
                      ),
                    ],
                  ),
                  appspace(h: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Apptextwidget(fetchlocale(context).invduedate,
                          style: TxtStls.stl16),
                      AbsorbPointer(
                        absorbing: auth.userData?["roleId"] == 5,
                        child: dateField(context,
                            labelText: "",
                            controller: aptctrl.invDueDatecontroller,
                            hintText: "DD/MM/YYYY"),
                      ),
                    ],
                  ),
                  appspace(h: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Apptextwidget(fetchlocale(context).acpcduedate,
                          style: TxtStls.stl16),
                      AbsorbPointer(
                        absorbing: auth.userData?["roleId"] == 5,
                        child: dateField(context,
                            labelText: "",
                            controller: aptctrl.acPCDueDatecontroller,
                            hintText: "DD/MM/YYYY"),
                      ),
                    ],
                  ),
                  appspace(h: 10),
                  Apptextwidget(fetchlocale(context).cvdrisk,
                      style: TxtStls.stl20),
                  const Divider(
                    color: scaffoldbgcol,
                  ),

                  Apptextwidget(
                    fetchlocale(context).anthropometrye,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  appspace(h: 5),
                  Apptextwidget(
                    fetchlocale(context).heighte,
                    style: TxtStls.stl16,
                  ),
                  numberField(
                    enabled: auth.userData?["roleId"] == 5,
                    labelText: "",
                    hintText: fetchlocale(context).enter,
                    maxLength: 3,
                    controller: aptctrl.heightcontroller,
                  ),
                  Apptextwidget(
                    fetchlocale(context).weighte,
                    style: TxtStls.stl16,
                  ),
                  numberField(
                    enabled: auth.userData?["roleId"] == 5,
                    labelText: "",
                    hintText: fetchlocale(context).enter,
                    maxLength: 3,
                    controller: aptctrl.weightDueDatecontroller,
                  ),
                  Apptextwidget(
                    "BMI",
                    style: TxtStls.stl16,
                  ),
                  numberField(
                    enabled: auth.userData?["roleId"] == 5,
                    labelText: "",
                    hintText: fetchlocale(context).enter,
                    maxLength: 2,
                    controller: aptctrl.bmicontroller,
                  ),
                  appspace(h: 5),
                  questionAnswer(context,
                      header: fetchlocale(context).toboccousee,
                      groupValue: aptctrl.selecttobacco,
                      list: aptctrl.yeslist,
                      onChanged: auth.userData?["roleId"] == 5
                          ? null
                          : (value) {
                              aptctrl.changetobacco(value);
                            }),

                  Apptextwidget(
                    fetchlocale(context).whocvdriskscore,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Apptextwidget(
                    fetchlocale(context).nonlabbasedcvdriskscore,
                    style: TxtStls.stl16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: numberField(
                          enabled: auth.userData?["roleId"] == 5,
                          labelText: "",
                          hintText: fetchlocale(context).enter,
                          maxLength: 3,
                          controller: aptctrl.nonlabcontroller,
                        ),
                      ),
                      appspace(w: 2),
                      Expanded(
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: scaffoldbgcol,
                              borderRadius: BorderRadius.circular(10)),
                          child: calcvdwidget(
                              val: aptctrl.nonlabcontroller.text.isEmpty
                                  ? "0"
                                  : aptctrl.nonlabcontroller.text),
                        ),
                      )
                    ],
                  ),
                  Apptextwidget(
                    fetchlocale(context).labbasedcvdriskscore,
                    style: TxtStls.stl16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: numberField(
                          enabled: auth.userData?["roleId"] == 5,
                          labelText: "",
                          hintText: fetchlocale(context).enter,
                          maxLength: 2,
                          controller: aptctrl.labBasedcontroller,
                        ),
                      ),
                      appspace(w: 2),
                      Expanded(
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: scaffoldbgcol,
                              borderRadius: BorderRadius.circular(10)),
                          child: calcvdwidget(
                              val: aptctrl.labBasedcontroller.text.isEmpty
                                  ? "0"
                                  : aptctrl.labBasedcontroller.text),
                        ),
                      )
                    ],
                  ),
                  appspace(h: 5),
                  Apptextwidget(fetchlocale(context).labinvestigation,
                      style: TxtStls.stl20),
                  const Divider(
                    color: scaffoldbgcol,
                  ),
                  appspace(h: 5),

                  commonWidget(
                      readonly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.hbA1Ccontroller,
                      length: 2,
                      hinttext: fetchlocale(context).enter,
                      title: "HbA1C"),
                  appspace(h: 5),
                  commonWidget(
                      readonly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.tCcontroller,
                      length: 3,
                      hinttext: fetchlocale(context).enter,
                      title: "TC"),
                  appspace(h: 5),
                  commonWidget(
                      readonly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.tGLcontroller,
                      length: 3,
                      hinttext: fetchlocale(context).enter,
                      title: "TGL"),
                  appspace(h: 5),
                  commonWidget(
                      readonly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.hDLcontroller,
                      length: 2,
                      hinttext: fetchlocale(context).enter,
                      title: "HDL"),
                  appspace(h: 5),
                  commonWidget(
                      readonly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.lDLcontroller,
                      length: 3,
                      hinttext: fetchlocale(context).enter,
                      title: "LDL"),
                  appspace(h: 5),
                  commonWidget(
                      readonly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.vlDLcontroller,
                      length: 2,
                      hinttext: fetchlocale(context).enter,
                      title: "VLDL"),
                  appspace(h: 5),
                  commonWidget(
                      readonly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.ureacontroller,
                      length: 2,
                      hinttext: fetchlocale(context).enter,
                      title: fetchlocale(context).ureae),
                  appspace(h: 5),
                  commonWidget(
                      readonly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.creatininecontroller,
                      length: 1,
                      hinttext: fetchlocale(context).enter,
                      title: fetchlocale(context).creatininee),
                  appspace(h: 5),
                  commonWidget(
                      readonly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.eGFRcontroller,
                      length: 100,
                      hinttext: fetchlocale(context).enter,
                      title: "eGFR"),
                  appspace(h: 5),
                  commonWidget(
                      readonly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.uACRcontroller,
                      length: 100,
                      hinttext: fetchlocale(context).enter,
                      title: "uACR"),
                  appspace(h: 5),
                  commonWidget(
                      readonly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.tSHcontroller,
                      length: 2,
                      hinttext: fetchlocale(context).enter,
                      title: "TSH"),
                  appspace(h: 5),
                  commonWidget(
                      readonly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.fT4controller,
                      length: 1,
                      hinttext: fetchlocale(context).enter,
                      title: "fT4"),
                  appspace(h: 5),
                  commonWidget(
                      readonly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.fT3controller,
                      length: 1,
                      hinttext: fetchlocale(context).enter,
                      title: "fT3"),
                  appspace(h: 5),
                  Apptextwidget(
                    fetchlocale(context).funduse,
                    style: TxtStls.stl16,
                  ),
                  appspace(h: 10),
                  textfiled(
                      readOnly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.funduscontroller,
                      hintText: "",
                      maxlines: 5,
                      action: TextInputAction.done),
                  appspace(h: 5),

                  Apptextwidget(
                    "ECHO",
                    style: TxtStls.stl16,
                  ),
                  appspace(h: 10),
                  textfiled(
                      readOnly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.eCHOcontroller,
                      labelText: "",
                      hintText: "",
                      maxlines: 5,
                      action: TextInputAction.done),
                  appspace(h: 5),

                  Apptextwidget(
                    "ECG",
                    style: TxtStls.stl16,
                  ),
                  appspace(h: 10),
                  textfiled(
                      readOnly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.eCGcontroller,
                      labelText: "",
                      hintText: "",
                      maxlines: 5,
                      action: TextInputAction.done),

                  Apptextwidget(
                    fetchlocale(context).complication,
                    style: TxtStls.stl16,
                  ),
                  const Divider(
                    color: scaffoldbgcol,
                  ),
                  Apptextwidget(
                    "a)${fetchlocale(context).macrovascular}",
                    style: TxtStls.stl15,
                  ),
                  questionAnswer(context,
                      header: fetchlocale(context).coronaryartery,
                      groupValue: aptctrl.coronaryartery,
                      list: aptctrl.yeslist,
                      onChanged: auth.userData?["roleId"] == 5
                          ? null
                          : (value) {
                              aptctrl.updatecornoryartery(value);
                            }),
                  questionAnswer(context,
                      header: fetchlocale(context).cerebrovascular,
                      groupValue: aptctrl.cerebrovascular,
                      list: aptctrl.yeslist,
                      onChanged: auth.userData?["roleId"] == 5
                          ? null
                          : (value) {
                              aptctrl.updatecerebrovascular(value);
                            }),
                  questionAnswer(context,
                      header: fetchlocale(context).peripheral,
                      groupValue: aptctrl.peripheralartery,
                      list: aptctrl.yeslist,
                      onChanged: auth.userData?["roleId"] == 5
                          ? null
                          : (value) {
                              aptctrl.updateperipheralartery(value);
                            }),

                  Apptextwidget(
                    fetchlocale(context).remark,
                    style: TxtStls.stl16,
                  ),
                  appspace(h: 10),
                  textfiled(
                      readOnly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.macrocontroller,
                      labelText: "",
                      maxlines: 5,
                      action: TextInputAction.done),
                  appspace(h: 20),
                  Apptextwidget(
                    "b)${fetchlocale(context).microvascular}",
                    style: TxtStls.stl15,
                  ),
                  questionAnswer(context,
                      header: fetchlocale(context).retinopathy,
                      groupValue: aptctrl.retinopathy,
                      list: aptctrl.yeslist,
                      onChanged: auth.userData?["roleId"] == 5
                          ? null
                          : (value) {
                              aptctrl.updateretinopathy(value);
                            }),
                  questionAnswer(context,
                      header: fetchlocale(context).nephropathy,
                      groupValue: aptctrl.nephropathy,
                      list: aptctrl.yeslist,
                      onChanged: auth.userData?["roleId"] == 5
                          ? null
                          : (value) {
                              aptctrl.updatenephropathy(value);
                            }),
                  questionAnswer(context,
                      header: fetchlocale(context).neuropathy,
                      groupValue: aptctrl.neuropathy,
                      list: aptctrl.yeslist,
                      onChanged: auth.userData?["roleId"] == 5
                          ? null
                          : (value) {
                              aptctrl.updateneuropathy(value);
                            }),

                  Apptextwidget(
                    fetchlocale(context).remark,
                    style: TxtStls.stl16,
                  ),
                  appspace(h: 10),
                  textfiled(
                      readOnly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.microcontroller,
                      labelText: "",
                      maxlines: 5,
                      action: TextInputAction.done),
                  appspace(h: 20),
                  Apptextwidget(
                    "c)Foot complications",
                    style: TxtStls.stl15,
                  ),
                  questionAnswer(context,
                      header: fetchlocale(context).skin,
                      groupValue: aptctrl.skin,
                      list: aptctrl.yeslist,
                      onChanged: auth.userData?["roleId"] == 5
                          ? null
                          : (value) {
                              aptctrl.updateskin(value);
                            }),
                  questionAnswer(context,
                      header: fetchlocale(context).sensation,
                      groupValue: aptctrl.sensation,
                      list: aptctrl.yeslist,
                      onChanged: auth.userData?["roleId"] == 5
                          ? null
                          : (value) {
                              aptctrl.updatesensation(value);
                            }),
                  questionAnswer(context,
                      header: fetchlocale(context).vibration,
                      groupValue: aptctrl.vibration,
                      list: aptctrl.yeslist,
                      onChanged: auth.userData?["roleId"] == 5
                          ? null
                          : (value) {
                              aptctrl.updatevibration(value);
                            }),
                  questionAnswer(context,
                      header: fetchlocale(context).deformity,
                      groupValue: aptctrl.deformity,
                      list: aptctrl.yeslist,
                      onChanged: auth.userData?["roleId"] == 5
                          ? null
                          : (value) {
                              aptctrl.updatedeformity(value);
                            }),
                  questionAnswer(context,
                      header: fetchlocale(context).ulcer,
                      groupValue: aptctrl.ulcer,
                      list: aptctrl.yeslist,
                      onChanged: auth.userData?["roleId"] == 5
                          ? null
                          : (value) {
                              aptctrl.updateulcer(value);
                            }),

                  Apptextwidget(
                    fetchlocale(context).remark,
                    style: TxtStls.stl16,
                  ),
                  appspace(h: 10),
                  textfiled(
                      readOnly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.footcontroller,
                      labelText: "",
                      maxlines: 5,
                      action: TextInputAction.done),
                  appspace(h: 20),
                  Apptextwidget(
                    fetchlocale(context).clinicainnotes,
                    style: TxtStls.stl16,
                  ),
                  appspace(h: 10),
                  textfiled(
                      readOnly: auth.userData?["roleId"] == 5,
                      controller: aptctrl.controller6,
                      labelText: "",
                      maxlines: 5,
                      action: TextInputAction.done)
                ],
              ),
            ),
          ),
          //decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/body.png"))),
        ),
        bottomNavigationBar: Visibility(
          //visible: aptctrl.appointmentmodel?.addedBy==null&&auth.userData?["roleId"]==4,
          visible: auth.userData?["roleId"] == 4,
          child: bottomContainer(
              child: fillButton(context,
                  load: aptctrl.saveappointmentload ||
                      aptctrl.appointmentloadbyid,
                  title: fetchlocale(context).submit, onTap: () {
            var check = checkvisitype(context);
            if (check) {
              var aptjson = {
                "appointmentId": aptctrl.appointmentmodel?.appointmentId,
                "startTime": aptctrl.appointmentmodel?.startTime,
                "endTime": aptctrl.appointmentmodel?.endTime,
                "patientId": aptctrl.appointmentmodel?.patientId,
                "clinicianId": aptctrl.appointmentmodel?.clinicianId,
                "specialityId": aptctrl.appointmentmodel?.specialityId,
                "status": aptctrl.appointmentmodel?.status,
                "teleConsultation": aptctrl.appointmentmodel?.teleConsultation,
                "preferedGender": aptctrl.appointmentmodel?.preferedGender,
                "preferredDate": aptctrl.appointmentmodel?.preferredDate,
                "transactionId": aptctrl.appointmentmodel?.transactionId,
                "paymentStatus": aptctrl.paymentype,
                "paymentAmount": aptctrl.appointmentmodel?.paymentAmount,
                "preferredTime": aptctrl.appointmentmodel?.preferredTime,
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
                  "labBasedcontroller": aptctrl.labBasedcontroller.text,
                  "hbA1Ccontroller": aptctrl.hbA1Ccontroller.text,
                  "tCcontroller": aptctrl.tCcontroller.text,
                  "tGLcontroller": aptctrl.tGLcontroller.text,
                  "hDLcontroller": aptctrl.hDLcontroller.text,
                  "lDLcontroller": aptctrl.lDLcontroller.text,
                  "vlDLcontroller": aptctrl.vlDLcontroller.text,
                  "ureacontroller": aptctrl.ureacontroller.text,
                  "creatininecontroller": aptctrl.creatininecontroller.text,
                  "eGFRcontroller": aptctrl.eGFRcontroller.text,
                  "uACRcontroller": aptctrl.uACRcontroller.text,
                  "tSHcontroller": aptctrl.tSHcontroller.text,
                  "fT4controller": aptctrl.fT4controller.text,
                  "fT3controller": aptctrl.fT3controller.text,
                  "funduscontroller": aptctrl.funduscontroller.text,
                  "eCHOcontroller": aptctrl.eCHOcontroller.text,
                  "eCGcontroller": aptctrl.eCGcontroller.text,
                  "visitDuedatacontroller": aptctrl.visitDuedatacontroller.text,
                  "invDueDatecontroller": aptctrl.invDueDatecontroller.text,
                  "acPCDueDatecontroller": aptctrl.acPCDueDatecontroller.text
                }),
                "appointmentReferral": jsonEncode({
                  "specid": aptctrl.specilatyid,
                  "doctorid": aptctrl.doctorid,
                  "comments": aptctrl.commentscontroller.text
                })
              };
              log(aptjson.toString());
              aptctrl.appointmentsave(context, ajson: aptjson).whenComplete(() {
                aptctrl.getappointbyid(id: aptctrl.aptid).whenComplete(() {
                  aptctrl.getallappointments().whenComplete(() {
                    // Navigator.pop(context);
                  });
                });
              });
            } else {
              Fluttertoast.showToast(msg: fetchlocale(context).mandatoryfields);
            }
          })),
        ),
      );
    });
  }
}

bool checkvisitype(context) {
  final aptctrl = Provider.of<Appointmentcontroller>(context, listen: false);
  if (aptctrl.slectVisittype == "Proxy") {
    return true;
  } else if (aptctrl.slectVisittype == "Patient") {
    if (aptctrl.sbpcontroller.text.isNotEmpty &&
        aptctrl.dbpcontroller.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
  //if(aptctrl.slectVisittype=="Patient"&&aptctrl.sbpcontroller.text.isNotEmpty&&aptctrl.dbpcontroller.text.isNotEmpty){}
}

dynamic calcvdwidget({val}) {
  final v = double.parse(val);
  if (v <= 5.0) {
    return cvdwidget(color: Colors.green, label: "No risk(<5%)");
  } else if (v > 5.0 && v <= 10.0) {
    return cvdwidget(color: Colors.green, label: "Low Risk(5% to 10%)");
  } else if (v > 10.0 && v <= 20.0) {
    return cvdwidget(color: Colors.amber, label: "Moderate Risk(10% to 20%)");
  } else if (v > 20.0 && v <= 30.0) {
    return cvdwidget(color: Colors.red, label: "High Risk(20% to 30%)");
  } else if (v > 30) {
    return cvdwidget(color: Colors.red, label: "Very High Risk(>=30%)");
  } else {
    return const SizedBox.shrink();
  }
}

Row cvdwidget({color, label}) {
  return Row(
    children: [
      Container(
        height: 15,
        width: 15,
        color: color,
      ),
      Apptextwidget(
        label,
        style: TxtStls.hintStl,
        overflow: TextOverflow.ellipsis,
      )
    ],
  );
}

SizedBox mycustwid(context, {controller, label, enable = false}) {
  return SizedBox(
      width: checkscreenwidth(genratemediaquery(context).size.width) == "Small"
          ? 70
          : checkscreenwidth(genratemediaquery(context).size.width) == "Medium"
              ? 200
              : 350,
      child: textfiled(
          readOnly: enable,
          maxlines: 2,
          mOBSTYLE:
              checkscreenwidth(genratemediaquery(context).size.width) == "Small"
                  ? TxtStls.stl10
                  : null,
          labelText: label ?? "-",
          controller: controller));
}

Widget commonWidget(
    {required controller,
    required readonly,
    required title,
    required length,
    hinttext}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TxtStls.stl16),
      numberField(
          enabled: readonly,
          maxLength: length,
          controller: controller,
          labelText: "",
          hintText: hinttext),
    ],
  );
}
