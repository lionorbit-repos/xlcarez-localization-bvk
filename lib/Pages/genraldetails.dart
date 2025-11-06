import 'package:XLcarez/env/appexports.dart';

class Genraldetails extends StatefulWidget {
  const Genraldetails({super.key});

  @override
  State<Genraldetails> createState() => _GenraldetailsState();
}

class _GenraldetailsState extends State<Genraldetails> {
  final key = GlobalKey<FormState>();
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      Provider.of<ScoreManagementController>(context, listen: false)
          .updateCardio3(value: null);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer3<Authcontroller, DiabitiesController,
              ScoreManagementController>(
          builder: (context, auth, mngCtrl, scorectrl, child) {
        return Scaffold(
          appBar: Themeappbar(
            title: fetchlocale(context).genral,
            lead: IconButton(
                onPressed: () {
                  navigationSlideAndRemoveUntil(context, const Landing());
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: scaffoldbgcol,
                )),
            leading: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //appspace(h: 5),
                      Form(
                        key: key,
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Apptextwidget(
                                      auth.merticweight == "kg"
                                          ? fetchlocale(context).wgtin
                                          : fetchlocale(context).wgtinlb,
                                      style: TxtStls.stl16,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (_) {
                                                return appdailog(context,
                                                    ationtitleyes:
                                                        fetchlocale(context).ok,
                                                    actionsyes: () {
                                                  Navigator.pop(context);
                                                },
                                                    alert: Apptextwidget(
                                                        fetchlocale(context)
                                                            .alert),
                                                    content: Column(
                                                      children: [
                                                        Apptextwidget(
                                                          fetcherrortext(
                                                            context,
                                                            "Weight in kg should be within the range of 40 to 150 kg",
                                                          ),
                                                          style: TxtStls.stl14,
                                                        ),
                                                        Apptextwidget(
                                                          fetcherrortext(
                                                              context,
                                                              "Weight in lbs should be within the range of 88 to 330 lbs"),
                                                          style: TxtStls.stl14,
                                                        ),
                                                      ],
                                                    ));
                                              });
                                        },
                                        icon: const Icon(Icons.info))
                                  ],
                                ),
                                // Apptextwidget(
                                //   auth.merticweight == "kg"
                                //       ? fetchlocale(context).wgtin
                                //       : fetchlocale(context).wgtinlb,
                                //   style: TxtStls.stl14,
                                // ),
                                appspace(h: 5),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: weightField(context,
                                          isblack: false,
                                          controller: auth.merticweight == "kg"
                                              ? auth.weightconteoller
                                              : auth.weightconteollerlbs,
                                          labelText: auth.merticweight == "kg"
                                              ? fetchlocale(context).wgtin
                                              : fetchlocale(context).wgtinlb,
                                          hintText: fetchlocale(context).wgtin,
                                          maxLength: 3,
                                          col: transparentcol),
                                    ),
                                    appspace(w: 5),
                                    Expanded(
                                        child: dropdowndynamic(
                                            onchnage: (val) {
                                              auth.changeweight(val: val);
                                            },
                                            hint: fetchlocale(context).selecte,
                                            val: auth.merticweight,
                                            list: ["kg", "lb"]
                                                .map((k) => DropdownMenuItem(
                                                    value: k,
                                                    child: Apptextwidget(
                                                      k,
                                                      style: TxtStls.stl13,
                                                    )))
                                                .toList()))
                                  ],
                                ),
                              ],
                            ),
                            appspace(h: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Apptextwidget(
                                      auth.metricheight == "cms"
                                          ? fetchlocale(context).hgt
                                          : fetchlocale(context).hgtf,
                                      style: TxtStls.stl15,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (_) {
                                                return appdailog(context,
                                                    ationtitleyes:
                                                        fetchlocale(context).ok,
                                                    actionsyes: () {
                                                  Navigator.pop(context);
                                                },
                                                    alert: Apptextwidget(
                                                        fetchlocale(context)
                                                            .alert),
                                                    content: Apptextwidget(
                                                      fetchlocale(context)
                                                          .heightmax,
                                                      style: TxtStls.stl14,
                                                    ));
                                              });
                                        },
                                        icon: const Icon(Icons.info))
                                  ],
                                ),
                                appspace(h: 5),
                                auth.metricheight == "cms"
                                    ? Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: heightField(context,
                                                maxLength: 3,
                                                decoration: inputDecoration(
                                                    //labelText: labelText,
                                                    hintText:
                                                        fetchlocale(context)
                                                            .hgt,
                                                    col: transparentcol,
                                                    isbalck: false),
                                                controller:
                                                    auth.heightController,
                                                hintText:
                                                    fetchlocale(context).hgtin),
                                          ),
                                          appspace(w: 5),
                                          Expanded(
                                              child: dropdowndynamic(
                                                  onchnage: (val) {
                                                    auth.changeheight(val: val);
                                                  },
                                                  hint: fetchlocale(context)
                                                      .selecte,
                                                  val: auth.metricheight,
                                                  list: ["cms", "feet/inch"]
                                                      .map((k) =>
                                                          DropdownMenuItem(
                                                              value: k,
                                                              child:
                                                                  Apptextwidget(
                                                                k,
                                                                style: TxtStls
                                                                    .stl13,
                                                              )))
                                                      .toList()))
                                        ],
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Apptextwidget(
                                                      fetchlocale(context).feet,
                                                      style: TxtStls.stl13,
                                                    ),
                                                    dropdowndynamic(
                                                        validatemode:
                                                            AutovalidateMode
                                                                .onUserInteraction,
                                                        validate: false,
                                                        onchnage: (val) {
                                                          auth.changefeet(val);
                                                        },
                                                        hint:
                                                            fetchlocale(context)
                                                                .selecte,
                                                        val: auth.feet,
                                                        list: [
                                                          "1",
                                                          "2",
                                                          "3",
                                                          "4",
                                                          "5",
                                                          "6",
                                                          "7",
                                                          "8"
                                                        ]
                                                            .map((k) =>
                                                                DropdownMenuItem(
                                                                    value: k,
                                                                    child:
                                                                        Apptextwidget(
                                                                      k,
                                                                      style: TxtStls
                                                                          .stl13,
                                                                    )))
                                                            .toList()),
                                                  ],
                                                ),
                                              ),
                                              appspace(w: 5),
                                              Flexible(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Apptextwidget(
                                                      fetchlocale(context).inch,
                                                      style: TxtStls.stl13,
                                                    ),
                                                    dropdowndynamic(
                                                        validate: false,
                                                        validatemode:
                                                            AutovalidateMode
                                                                .onUserInteraction,
                                                        onchnage: (val) {
                                                          auth.changeinchec(
                                                              val);
                                                        },
                                                        hint:
                                                            fetchlocale(context)
                                                                .selecte,
                                                        val: auth.inch,
                                                        list: [
                                                          "0",
                                                          "1",
                                                          "2",
                                                          "3",
                                                          "4",
                                                          "5",
                                                          "6",
                                                          "7",
                                                          "8",
                                                          "9",
                                                          "10",
                                                          "11",
                                                          "12"
                                                        ]
                                                            .map((k) =>
                                                                DropdownMenuItem(
                                                                    value: k,
                                                                    child:
                                                                        Apptextwidget(
                                                                      k,
                                                                      style: TxtStls
                                                                          .stl13,
                                                                    )))
                                                            .toList()),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          appspace(h: 5),
                                          dropdowndynamic(
                                              onchnage: (val) {
                                                auth.changeheight(val: val);
                                              },
                                              hint:
                                                  fetchlocale(context).selecte,
                                              val: auth.metricheight,
                                              list: ["cms", "feet/inch"]
                                                  .map((k) => DropdownMenuItem(
                                                      value: k,
                                                      child: Apptextwidget(
                                                        k,
                                                        style: TxtStls.stl13,
                                                      )))
                                                  .toList())
                                        ],
                                      )
                              ],
                            ),
                          ],
                        ),
                      ),
                      appspace(h: 10),
                      questionAnswer(context,
                          header: fetchlocale(context).doyouhavesmoking,
                          groupValue: scorectrl.cardio3,
                          list: ["Yes", "No"], onChanged: (value) {
                        scorectrl.updateCardio3(value: value);
                      }),
                      appspace(h: 10),
                      Apptextwidget(
                        fetchlocale(context).drsq,
                        style: TxtStls.stl13,
                      ),
                      questionAnswer(context,
                          header: fetchlocale(context).wiyeb,
                          groupValue: mngCtrl.diabities3,
                          list: ["Only white European", "Other ethnic group"],
                          onChanged: (value) {
                        mngCtrl.updateDiabities3(value: value);
                      }),
                      const SizedBox(height: 15),
                      questionAnswer(context,
                          header: fetchlocale(context).doyouhafather,
                          groupValue: mngCtrl.diabities4,
                          list: ["Yes", "No"], onChanged: (value) {
                        mngCtrl.updateDiabities4(value: value);
                      }),
                      const SizedBox(height: 15),
                      questionAnswer(context,
                          header: fetchlocale(context).mesuretheperson,
                          groupValue: mngCtrl.diabities5,
                          list: [
                            "<90cm (35.3in)",
                            "90-99.9cm (35.4-39.3in)",
                            "100-109.9cm (39.4in-42.9in)",
                            "110cm (43in) or above"
                          ], onChanged: (value) {
                        mngCtrl.updateDiabities5(value: value);
                      }),
                      const SizedBox(height: 15),
                      questionAnswer(context,
                          header: fetchlocale(context).haveyoubeengivenmedicine,
                          groupValue: mngCtrl.diabities7,
                          list: ["Yes", "No"], onChanged: (value) {
                        mngCtrl.updateDiabities7(value: value);
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: GestureDetector(
            onTap: () {
              final error = validateHeightFeetAndInches(auth.feet, auth.inch);
              if (error != null) {
                Fluttertoast.showToast(
                  msg: fetchlocale(context).heightmax,
                );
              } else {
                if (key.currentState!.validate()) {
                  if (scorectrl.cardio3 != null) {
                    auth.chnagequestionaredai();
                    navigationSlideAndRemoveUntil(
                        context, const CardioQuestionary(),
                        isroute: true);
                  } else {
                    Fluttertoast.showToast(
                        msg: auth.weightconteoller.text.isEmpty
                            ? fetchlocale(context).weihtfielscanttempty
                            : auth.heightController.text.isEmpty
                                ? fetchlocale(context).heightfieldcantempty
                                : fetchlocale(context).pleaseansweraboveconti);
                  }
                }
              }
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10, right: 10),
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: primary,
                  border: Border.all(color: transparentcol, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Apptextwidget(
                fetchlocale(context).skip,
                style: TxtStls.wstl13,
              )),
            ),
          ),
          bottomNavigationBar: bottomContainer(
            child: fillButton(context,
                load: false, title: fetchlocale(context).next, onTap: () {
              final error = validateHeightFeetAndInches(auth.feet, auth.inch);
              if (error != null) {
                Fluttertoast.showToast(
                  msg: fetchlocale(context).heightmax,
                );
              } else {
                if (key.currentState!.validate()) {
                  if (scorectrl.cardio3 != null) {
                    var cardioProperties = [
                      mngCtrl.diabities3,
                      mngCtrl.diabities4,
                      mngCtrl.diabities5,
                      mngCtrl.diabities7,
                    ];

                    bool allFilled = true;
                    for (var cardio in cardioProperties) {
                      if (cardio == null) {
                        Fluttertoast.showToast(
                            msg: fetchlocale(context).pleaseanswerallquestions,
                            toastLength: Toast.LENGTH_SHORT,
                            textColor: Colors.white);
                        allFilled = false;
                        break;
                      }
                    }

                    if (allFilled) {
                      auth.chnagequestionaredai(iseverse: true);
                      navigationSlide(context, const CardioQuestionary());
                    }
                  } else {
                    Fluttertoast.showToast(
                        msg: auth.weightconteoller.text.isEmpty
                            ? fetchlocale(context).weihtfielscanttempty
                            : auth.heightController.text.isEmpty
                                ? fetchlocale(context).heightfieldcantempty
                                : fetchlocale(context).pleaseansweraboveconti);
                  }
                }

                // if (auth.weightconteoller.text.isNotEmpty &&
                //     auth.heightController.text.isNotEmpty &&
                //     scorectrl.cardio3 != null) {
                //   var cardioProperties = [
                //     mngCtrl.diabities3,
                //     mngCtrl.diabities4,
                //     mngCtrl.diabities5,
                //     mngCtrl.diabities7,
                //   ];

                //   bool allFilled = true;
                //   for (var cardio in cardioProperties) {
                //     if (cardio == null) {
                //       Fluttertoast.showToast(
                //           msg: fetchlocale(context).pleaseanswerallquestions,
                //           toastLength: Toast.LENGTH_SHORT,
                //           textColor: Colors.white);
                //       allFilled = false;
                //       break;
                //     }
                //   }

                //   if (allFilled) {
                //     auth.chnagequestionaredai(iseverse: true);
                //     navigationSlide(context, const CardioQuestionary());
                //   }
                // } else {
                //   Fluttertoast.showToast(
                //       msg: auth.weightconteoller.text.isEmpty
                //           ? fetchlocale(context).weihtfielscanttempty
                //           : auth.heightController.text.isEmpty
                //               ? fetchlocale(context).heightfieldcantempty
                //               : fetchlocale(context).pleaseansweerquestion);
                // }
              }
            }),
          ),
        );
      }),
    );
  }
}
