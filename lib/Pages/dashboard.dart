// ignore_for_file: use_build_context_synchronously

import 'package:XLcarez/env/appexports.dart';
import 'package:XLcarez/env/sliverstack.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<bool> iselected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    //print(checkscreenwidth(genratemediaquery(context).size.width));
    return MyThemeGradient(
      child: Consumer5<Authcontroller, Vitalscontroller, FoodSearchController,
              StepController, Assesmentcontroller>(
          builder: (context, ctrl, vital, foodctrl, foot, assment, child) {
        return ctrl.isload || vital.getallvitalsload
            ? loader()
            : Scaffold(
                body: SafeArea(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      final vitak =
                          Provider.of<Vitalscontroller>(context, listen: false);
                      final assctrl = Provider.of<Assesmentcontroller>(context,
                          listen: false);
                      final ftrl = Provider.of<FoodSearchController>(context,
                          listen: false);
                      final conn = Provider.of<ConnectivityController>(context,
                          listen: false);
                      final aptctrl = Provider.of<Appointmentcontroller>(
                          context,
                          listen: false);
                      final strl =
                          Provider.of<StepController>(context, listen: false);
                      final mptrl = Provider.of<Medicationcontroller>(context,
                          listen: false);
                      ctrl.getbyid();
                      ctrl.getallsoctors(id: await ctrl.fethuserid());
                      strl.getStepsCount();
                      assctrl.fetchdata(
                          id: await ctrl.fethuserid(),
                          endpoint: "Question/SleepGetAll");
                      assctrl.fetchdata(
                          id: await ctrl.fethuserid(),
                          endpoint: "Question/FatigueGetAll");
                      //ctrl.currentlocation();
                      vitak.getallvitalslist(id: await ctrl.fethuserid());
                      vitak.getlatesvitalscore(id: await ctrl.fethuserid());
                      ftrl.getall(id: await ctrl.fethuserid());
                      conn.getAllConnections();
                      aptctrl.getallappointments();
                      mptrl.getmedications(id: await ctrl.fethuserid());
                    },
                    child: CustomScrollView(
                      slivers: [
                        SliverStack(children: [
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: 70.0,
                              // height: checkscreenwidth(
                              //             genratemediaquery(context)
                              //                 .size
                              //                 .width) ==
                              //         "Small"
                              //     ? genratemediaquery(context).size.height / 3.9
                              //     : checkscreenwidth(genratemediaquery(context)
                              //                 .size
                              //                 .width) ==
                              //             "Medium"
                              //         ? genratemediaquery(context).size.height /
                              //             4.7
                              //         : genratemediaquery(context).size.height /
                              //             3,
                              width: genratemediaquery(context).size.width,
                              child: CustomScrollView(
                                physics: const NeverScrollableScrollPhysics(),
                                slivers: [
                                  mySliverAppBar(context),
                                  SliverToBoxAdapter(
                                    child: Visibility(
                                      visible: ctrl
                                              .heightController.text.isEmpty ||
                                          ctrl.gender == null ||
                                          ctrl.ageconteoller.text.isEmpty ||
                                          ctrl.weightconteoller.text.isEmpty,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: SizedBox(
                                          height: 20,
                                          width: genratemediaquery(context)
                                                  .size
                                                  .width /
                                              1.9,
                                          child: Marquee(
                                            text: fetchlocale(context)
                                                .complete_profile,
                                            //"To access the app's scanning feature, completing your profile is mandatory. You won't be able to use the scanning option until your profile is fully completed.",
                                            style: TxtStls.wstl13,
                                            scrollAxis: Axis.horizontal,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // SliverPadding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       horizontal: 10),
                                  //   sliver: SliverGrid.count(
                                  //     crossAxisCount: 3,
                                  //     childAspectRatio: checkscreenwidth(
                                  //                 genratemediaquery(context)
                                  //                     .size
                                  //                     .width) ==
                                  //             "Small"
                                  //         ? 0.7
                                  //         : checkscreenwidth(
                                  //                     genratemediaquery(context)
                                  //                         .size
                                  //                         .width) ==
                                  //                 "Medium"
                                  //             ? 1.5
                                  //             : 1.9,
                                  //     crossAxisSpacing: 5,
                                  //     children: [
                                  //       dashboardcard(
                                  //           url: "assets/stepcount.png",
                                  //           title: fetchlocale(context)
                                  //               .calariesburnt,
                                  //           value:
                                  //               ctrl.userData?["weight"] != ""
                                  //                   ? foot.totalcal
                                  //                       .toStringAsFixed(2)
                                  //                   : "-",
                                  //           extra: "kcal"),
                                  //       dashboardcard(
                                  //           url: "assets/bodymass.png",
                                  //           title: fetchlocale(context).bmi,
                                  //           value: ctrl.bmicontroller.text,
                                  //           extra: ""),
                                  //       const StepCounterPage()
                                  //       //const FootstepTrack(),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Card(
                              //elevation: 0,
                              color: scaffoldbgcol,
                              //color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Apptextwidget(
                                        fetchlocale(context).medicationreminder,
                                        style: TxtStls.stl15,
                                      ),
                                    ),
                                    SizedBox(
                                        width: 70,
                                        height: 30,
                                        child: fillButton(context,
                                            load: false,
                                            title: fetchlocale(context).add,
                                            onTap: () {
                                         navigationSlide(context, const Reaminders());
                                        }))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Card(
                              //elevation: 0,
                              color: scaffoldbgcol,
                              //color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Apptextwidget(
                                        fetchlocale(context).healthassesment,
                                        style: TxtStls.stl15,
                                      ),
                                    ),
                                    SizedBox(
                                        width: 70,
                                        height: 30,
                                        child: fillButton(context,
                                            load: false,
                                            title: fetchlocale(context).start,
                                            onTap: () {
                                          navigationSlide(context,
                                              const Calculatordasboard());
                                        }))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Visibility(
                              visible: vital.getallvitals.isNotEmpty,
                              child: vital.getallvitals.isEmpty
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: checkui(
                                          context, vital.getallvitals[0]),
                                    )),
                        ),
                         SliverToBoxAdapter(
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  height: 300,
                                  //decoration: BoxDecoration(color: primary),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Column(
                                        children: [
                                          mynewdashcard(
                                              image: "assets/foodtrack.png",
                                              htitle: fetchlocale(context).flog,
                                              ontap: () {
                                                navigationSlide(
                                                    context, FoodLogList());
                                              },
                                              bottom: Apptextwidget(
                                                  '${fetchlocale(context).clintake} - ${foodctrl.foodcal??"0"} ${fetchlocale(context).kcal}',
                                                  //"Calorie ${foodctrl.foodcal} kcal",
                                                  style: TxtStls.mynewstyle)),
                                                   mynewdashcard(
                                              image: "assets/fatigue.jpg",
                                              htitle: fetchlocale(context)
                                                  .fatigescore,
                                              ontap: () {
                                                 assment.fatiguelist.isEmpty
                                                ? navigationSlide(context,
                                                    const Calculatordasboard())
                                                : navigationSlide(
                                                    context, const Fatiguelonglist());
                                              },
                                              bottom: Apptextwidget(
                                                assment.fatiguelist.isEmpty
                                                    ? ""
                                                    : "${fetchlocale(context).youare} ${assment.handlevalue(assment.fatiguelist[0].fatiguescore) ? fetchlocale(context).not : ""} ${fetchlocale(context).leveltext}",
                                                // "you are ${assment.handlevalue(assment.fatiguelist[0].fatiguescore) ? "not" : ""} experiencing clinically \nsignificant fatigue level.",
                                                style: TxtStls.stl13,
                                              ),
                                            ),
                                        ],
                                      )),
                                      Expanded(
                                        child: Column(
                                          children: [
                                           mynewdashcard(
                                              image: "assets/sleepscale.png",
                                              htitle: fetchlocale(context)
                                                  .sleepscore,
                                              ontap: () {
                                                assment.sleeplist.isEmpty
                                                    ? navigationSlide(context,
                                                        const Calculatordasboard())
                                                    : navigationSlide(context,
                                                        const Sleeplonglist());
                                              },
                                              bottom: Apptextwidget(
                                                  assment.sleeplist.isEmpty
                                                      ? ""
                                                      : "${assment.checkriskscore(context, int.parse(assment.sleeplist[0].sleepscore!))}",
                                                  style: TxtStls.mynewstyle)),
                                            mynewdashcard(
                                                image: "assets/hivassesment.jpg",
                                                htitle: fetchlocale(context).hivasesquestiona,
                                                ontap: () {
                                                  assment.adherlist.isEmpty
                                                      ? navigationSlide(context,
                                                          const Calculatordasboard())
                                                      : navigationSlide(context,
                                                          const Hivlonglist());
                                                },
                                                bottom: Apptextwidget(
                                                    "",
                                                    style: TxtStls.mynewstyle)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                        // Risk Score
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          sliver: SliverStack(
                            positionedAlignment: Alignment.center,
                            insetOnOverlap: true,
                            children: [
                              SliverToBoxAdapter(
                                  child: Visibility(
                                      visible: vital
                                              .lastestviatlscore?["diabetes"] !=
                                          null,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Apptextwidget(
                                                  fetchlocale(context)
                                                      .riskscore,
                                                  style: TxtStls.wstl16,
                                                ),
                                              ),
                                              toggle1(context,
                                                  titl1: fetchlocale(context)
                                                      .diabetic,
                                                  title2: fetchlocale(context)
                                                      .obesity,
                                                  title3: fetchlocale(context)
                                                      .cardiac,
                                                  isSelected: iselected,
                                                  tap: (val) {
                                                setState(() {
                                                  for (int index = 0;
                                                      index < iselected.length;
                                                      index++) {
                                                    if (index == val) {
                                                      iselected[index] = true;
                                                      vital.chnagerisckscore(
                                                          val == 0
                                                              ? "Diabetic"
                                                              : val == 1
                                                                  ? "Obesity"
                                                                  : "Cardiac");
                                                    } else {
                                                      iselected[index] = false;
                                                    }
                                                  }
                                                });
                                              })
                                            ],
                                          ),
                                          appspace(h: 10),
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                      // blurRadius: 6,
                                                      color: scaffoldbgcol)
                                                ],
                                                color: scaffoldbgcol,
                                                border: Border.all(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                //  appspace(h: 10),
                                                Apptextwidget(
                                                  //${vital.riskvalue}
                                                  "${fetchrisktitles(context, vital.riskvalue)}  ${fetchlocale(context).score}",
                                                  style: TxtStls.stl15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    vital.ftchincator(context),
                                                    SizedBox(
                                                        height: 120,
                                                        width: 150,
                                                        child: guage(
                                                            lowstartvalue: 0.0,
                                                            lowendvalue: vital
                                                                        .riskvalue ==
                                                                    "Diabetic"
                                                                ? 6.0
                                                                : vital.riskvalue ==
                                                                        "Cardiac"
                                                                    ? 5.0
                                                                    : 24.9,
                                                            mediumstartvalue: vital
                                                                        .riskvalue ==
                                                                    "Diabetic"
                                                                ? 6.1
                                                                : vital.riskvalue ==
                                                                        "Cardiac"
                                                                    ? 5.1
                                                                    : 25.0,
                                                            mediumendvalue: vital
                                                                        .riskvalue ==
                                                                    "Diabetic"
                                                                ? 15.0
                                                                : vital.riskvalue ==
                                                                        "Cardiac"
                                                                    ? 20.0
                                                                    : 29.9,
                                                            highstartvalue: vital
                                                                        .riskvalue ==
                                                                    "Diabetic"
                                                                ? 15.1
                                                                : vital.riskvalue ==
                                                                        "Cardiac"
                                                                    ? 20.1
                                                                    : 30.0,
                                                            highendvalue: vital
                                                                .fetchmeter(vital
                                                                    .riskvalue),
                                                            max: vital.fetchmeter(
                                                                vital.riskvalue),
                                                            min: 0.0,
                                                            value: vital.ftechvalue(vital.riskvalue))),
                                                  ],
                                                ),
                                                //getLinearGauge(),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ))),
                              // SliverPositioned.fill(
                              //   child: Container(
                              //       decoration: const BoxDecoration(
                              //           //color: Colors.red.withOpacity(0.5),
                              //           image: DecorationImage(
                              //               image:
                              //                   AssetImage("assets/rdmk.png"),
                              //               fit: BoxFit.fitWidth))
                              //       //child: const Center(child: Text("Overlaying Positioned Container")),
                              //       ),
                              // ),
                            ],
                          ),
                        ),
                        // SliverToBoxAdapter(
                        //   child: GestureDetector(
                        //       onTap: () {
                        //         navigationSlide(context, const Healthymepage());
                        //       },
                        //       child: Container(
                        //         margin: const EdgeInsets.symmetric(
                        //           horizontal: 10,
                        //         ),
                        //         height: 180,
                        //         decoration: BoxDecoration(
                        //             image: const DecorationImage(
                        //                 image: AssetImage(
                        //                     "assets/bannerhealth.png"),
                        //                 fit: BoxFit.fitWidth),
                        //             borderRadius: BorderRadius.circular(15)),
                        //       )),
                        // )
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
