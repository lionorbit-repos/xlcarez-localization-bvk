// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:developer';

import '../../env/appexports.dart';

class HIVASESForm extends StatefulWidget {
  const HIVASESForm({super.key});

  @override
  _HIVASESFormState createState() => _HIVASESFormState();
}

class _HIVASESFormState extends State<HIVASESForm> {
  final List<String> questions = [
    "Stick to your treatment plan even when side effects interfere?",
    "Integrate your treatment into your daily routine?",
    "Take medication in front of people who don’t know you're HIV+?",
    "Stick to your treatment schedule when your routine is disrupted?",
    "Stick to your treatment schedule when you aren’t feeling well?",
    "Stick to your treatment schedule when it means changing eating habits?",
    "Continue treatment even if it interferes with daily activities?",
    "Continue treatment even if T-cell count drops significantly?",
    "Continue treatment even when feeling discouraged about health?",
    "Continue treatment when clinic visits are a hassle?",
    "Continue treatment even when people doubt its effectiveness?",
    "Find something positive in treatment, even if it doesn’t improve health?"
  ];

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      Provider.of<Assesmentcontroller>(context, listen: false).resethiv();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<Authcontroller, Assesmentcontroller>(
        builder: (context, genral, scoremgt, child) {
      return MyThemeGradient(
        child: Scaffold(
          // ignore: prefer_const_constructors
          appBar: Themeappbar(
            title: fetchlocale(context).hivasesquestiona,
            leading: true,
            lead: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: scaffoldbgcol,
                ),
                onPressed: () {
                  //genral.chnagequestionarhiv(iseverse: true);
                  Navigator.pop(context);
                }),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Apptextwidget(
                          fetchlocale(context).instructionsee,
                          style: TxtStls.stl14,
                        ),
                        appspace(h: 5),
                        Apptextwidget(
                          fetchlocale(context).foreachstatebelow,
                          style: TxtStls.stl12,
                        ),
                        appspace(h: 5),
                        Apptextwidget(
                          """ ${fetchlocale(context).cannotdoatall}
${fetchlocale(context).moderatelycertain}
${fetchlocale(context).completelycertaincando}""",
                          style: TxtStls.stl13,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          title: Apptextwidget(
                            fetchtransqourse(questions[index]),
                            style: TxtStls.stl14,
                          ),
                          // Text(questions[index]),
                          subtitle: Slider(
                            value: scoremgt.scores[index].toDouble(),
                            min: 0,
                            max: 10,
                            divisions: 10,
                            label: scoremgt.scores[index].toString(),
                            onChanged: (value) {
                              scoremgt.chnagescore(
                                  index: index, value: value.toInt());
                              // setState(() {
                              //   scores[index] = value.toInt();
                              // });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // floatingActionButton: GestureDetector(
          //   onTap: () {
          //     genral.chnagequestionarhiv();
          //     navigationSlideAndRemoveUntil(context, const DisclaimerView(),
          //         isroute: true);
          //   },
          //   child: Container(
          //     margin: const EdgeInsets.only(bottom: 10, right: 10),
          //     height: 50,
          //     width: 100,
          //     decoration: BoxDecoration(
          //         color: primary,
          //         border: Border.all(color: primary, width: 2),
          //         borderRadius: BorderRadius.circular(20)),
          //     child: Center(
          //         child: Apptextwidget(fetchlocale(context).skipe,
          //             style: TxtStls.wstl13)),
          //   ),
          // ),
          bottomNavigationBar: bottomContainer(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Apptextwidget(
                "${fetchlocale(context).fatiguetotalscore} : ${scoremgt.calculateTotalScore().toStringAsFixed(2)}",
                style: TxtStls.stl14,
              ),
              Apptextwidget(
                "${fetchlocale(context).integrationscore} : ${scoremgt.calculateIntegrationScore().toStringAsFixed(2)}",
                style: TxtStls.stl14,
              ),
              Apptextwidget(
                "${fetchlocale(context).perseverencescore} : ${scoremgt.calculatePerseveranceScore().toStringAsFixed(2)}",
                style: TxtStls.stl14,
              ),
              fillButton(context,
                  load: scoremgt.saveloading,
                  title: fetchlocale(context).save, onTap: () async {
                var hivpaylod = {
                  "hivId": 0,
                  "hiv1": scoremgt.getscore(1),
                  "userId": await genral.fethuserid(),
                  "hiv2": scoremgt.getscore(2),
                  "hiv3": scoremgt.getscore(3),
                  "hiv4": scoremgt.getscore(4),
                  "hiv5": scoremgt.getscore(5),
                  "hiv6": scoremgt.getscore(6),
                  "hiv7": scoremgt.getscore(7),
                  "hiv8": scoremgt.getscore(8),
                  "hiv9": scoremgt.getscore(9),
                  "hiv10": scoremgt.getscore(10),
                  "hiv11": scoremgt.getscore(11),
                  "hiv12": scoremgt.getscore(12),
                  "hivtotal": scoremgt.calculateTotalScore().toStringAsFixed(2),
                  "hivinteragration":
                      scoremgt.calculateIntegrationScore().toStringAsFixed(2),
                  "hivperseverencescore":
                      scoremgt.calculatePerseveranceScore().toStringAsFixed(2)
                };
                log(hivpaylod.toString());
                scoremgt.savedata(context,
                    endpoint: "Question/SaveHiv", payload: hivpaylod);
              }),
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: ElevatedButton(
              //       onPressed: () {
              //         scoremgt.savedata(context);
              //       },
              //       child: Apptextwidget(
              //         fetchlocale(context).next,
              //         style: TxtStls.wstl13,
              //       )),
              // )
            ],
          )),
        ),
      );
    });
  }

  String fetchtransqourse(val) {
    var ques = {
      "Stick to your treatment plan even when side effects interfere?":
          fetchlocale(context).hivquestionary1,
      "Integrate your treatment into your daily routine?":
          fetchlocale(context).hivquestionary2,
      "Take medication in front of people who don’t know you're HIV+?":
          fetchlocale(context).hivquestionary3,
      "Stick to your treatment schedule when your routine is disrupted?":
          fetchlocale(context).hivquestionary4,
      "Stick to your treatment schedule when you aren’t feeling well?":
          fetchlocale(context).hivquestionary5,
      "Stick to your treatment schedule when it means changing eating habits?":
          fetchlocale(context).hivquestionary6,
      "Continue treatment even if it interferes with daily activities?":
          fetchlocale(context).hivquestionary7,
      "Continue treatment even if T-cell count drops significantly?":
          fetchlocale(context).hivquestionary8,
      "Continue treatment even when feeling discouraged about health?":
          fetchlocale(context).hivquestionary9,
      "Continue treatment when clinic visits are a hassle?":
          fetchlocale(context).hivquestionary10,
      "Continue treatment even when people doubt its effectiveness?":
          fetchlocale(context).hivquestionary11,
      "Find something positive in treatment, even if it doesn’t improve health?":
          fetchlocale(context).hivquestionary12
    };
    return ques[val] ?? "";
  }
}
