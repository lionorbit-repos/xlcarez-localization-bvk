// ignore_for_file: prefer_const_constructors

import 'package:XLcarez/Pages/circlespage.dart';
import 'package:XLcarez/Pages/newbot.dart';
import 'package:XLcarez/env/appexports.dart';
import 'package:url_launcher/url_launcher.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int index = 0;
  final String appUrl = 'Mediflix://home';

  Future<void> _openMediflixAppUrl() async {
    final Uri url = Uri.parse(appUrl);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        // If the app isn't installed, you might want to open the app store
        // or show an error message
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch Mediflix app')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Networkcheckwrapper(
      child: Consumer<Authcontroller>(builder: (context, ctrlc, child) {
        return Scaffold(
          backgroundColor: scaffoldbgcol,
          body: Stack(
            children: [
              _items[index]["page"] as Widget,
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Visibility(
            visible: index != 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                  backgroundColor: primary,
                  onPressed: () {
                    final cal = Provider.of<CalculationRiskController>(context,
                        listen: false);
                    final dia = Provider.of<DiabitiesController>(context,
                        listen: false);
                    final score = Provider.of<ScoreManagementController>(
                        context,
                        listen: false);
                    final ctrl =
                        Provider.of<Authcontroller>(context, listen: false);
                    ctrl.assigndata();
                    if (ctrl.heightController.text.isNotEmpty &&
                        ctrl.gender != null &&
                        ctrl.ageconteoller.text.isNotEmpty &&
                        ctrl.weightconteoller.text.isNotEmpty &&
                        ctrl.userData?["scansLimit"] != null) {
                      if (ctrl.userData?["scansLimit"] > 0) {
                        setState(() {
                          index = 2;
                          cal.reset();
                          dia.clearDiabities();
                          score.clearData();
                        });
                      } else {
                        showAdaptiveDialog(
                            context: context,
                            builder: (_) {
                              return appdailog(context,
                                  alert: Text(
                                    fetchlocale(context).alert,
                                    style: TxtStls.stl14,
                                  ),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Apptextwidget(
                                          fetchlocale(context).noscan),
                                      Apptextwidget(
                                        fetchlocale(context).advise3,
                                        style: TxtStls.stl13,
                                      ),
                                    ],
                                  ),
                                  ationtitleyes: fetchlocale(context).ok,
                                  actionsyes: () {
                                Navigator.pop(context);
                              });
                            });
                      }
                    } else {
                      showAdaptiveDialog(
                          context: context,
                          builder: (_) {
                            return appdailog(context,
                                alert: Text(
                                  fetchlocale(context).alert,
                                  style: TxtStls.stl14,
                                ),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      fetchlocale(context)
                                          .update_profile_content,
                                      style: TxtStls.stl13,
                                    ),
                                  ],
                                ),
                                ationtitleyes: fetchlocale(context).ok,
                                actionextra: () {
                                  Navigator.pop(context);
                                  navigationSlide(
                                      context, const ProfileScreen());
                                },
                                ationtitlextra: fetchlocale(context).updatenow,
                                actionsyes: () {
                                  Navigator.pop(context);
                                });
                          });
                    }
                  },
                  child: Visibility(
                    visible: ctrlc.userData?["scansLimit"] != null,
                    child: Badge(
                      backgroundColor: Colors.orange,
                      label: Apptextwidget("${ctrlc.userData?["scansLimit"]}"),
                      child: ImageIcon(
                        AssetImage(bottom3),
                        color: bgClr1,
                      ),
                    ),
                  )),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: scaffoldbgcol,
            shape: CircularNotchedRectangle(),
            child: BottomNavigationBar(
                backgroundColor: scaffoldbgcol,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                selectedItemColor: primary,
                unselectedItemColor: headerClr,
                currentIndex: index,
                onTap: (val) {
                  final cal = Provider.of<CalculationRiskController>(context,
                      listen: false);
                  final dia =
                      Provider.of<DiabitiesController>(context, listen: false);
                  final score = Provider.of<ScoreManagementController>(context,
                      listen: false);
                  
                  // Handle Mediflix button (index 1)
                  if (val == 1) {
                    _openMediflixAppUrl();
                    return;
                  }
                  
                  if (val != 2) {
                    setState(() {
                      index = val;
                    });
                  } else {
                    final ctrl =
                        Provider.of<Authcontroller>(context, listen: false);
                    ctrl.assigndata();
                    if (ctrl.heightController.text.isNotEmpty &&
                        ctrl.gender != null &&
                        ctrl.ageconteoller.text.isNotEmpty &&
                        ctrl.weightconteoller.text.isNotEmpty &&
                        ctrl.userData?["scansLimit"] != null) {
                      if (ctrl.userData?["scansLimit"] > 0) {
                        setState(() {
                          index = 2;
                          cal.reset();
                          dia.clearDiabities();
                          score.clearData();
                        });
                      } else {
                        showAdaptiveDialog(
                            context: context,
                            builder: (_) {
                              return appdailog(context,
                                  alert: Text(
                                    fetchlocale(context).alert,
                                    style: TxtStls.stl14,
                                  ),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Apptextwidget(
                                          fetchlocale(context).noscan),
                                      Apptextwidget(
                                        fetchlocale(context).advise3,
                                        style: TxtStls.stl13,
                                      ),
                                    ],
                                  ),
                                  ationtitleyes: fetchlocale(context).ok,
                                  actionsyes: () {
                                Navigator.pop(context);
                              });
                            });
                      }
                    } else {
                      showAdaptiveDialog(
                          context: context,
                          builder: (_) {
                            return appdailog(context,
                                alert: Text(
                                  fetchlocale(context).alert,
                                  style: TxtStls.stl14,
                                ),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      fetchlocale(context)
                                          .update_profile_content,
                                      style: TxtStls.stl13,
                                    ),
                                  ],
                                ),
                                ationtitleyes: fetchlocale(context).ok,
                                actionextra: () {
                                  Navigator.pop(context);
                                  navigationSlide(
                                      context, const ProfileScreen());
                                },
                                ationtitlextra: fetchlocale(context).updatenow,
                                actionsyes: () {
                                  Navigator.pop(context);
                                });
                          });
                    }
                  }
                },
                items: _items
                    .asMap()
                    .entries
                    .map((r) => BottomNavigationBarItem(
                        activeIcon: null,
                        icon: r.value["icon"] as Widget,
                        label: fetchlabels(r.key)))
                    .toList()),
          ),
        );
      }),
    );
  }

  Widget symptombot({mngCtrl}) {
    return Visibility(
      visible: index != 2,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: InkWell(
          splashColor: transparentcol,
          highlightColor: transparentcol,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const BotchatView()));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SizedBox(
                height: 50,
                width: 50,
                child: Lottie.asset("assets/mxk3H9GBpj.json")),
          ),
        ),
      ),
    );
  }

  String? fetchlabels(key) {
    var label = {
      0: fetchlocale(context).home,
      1: fetchlocale(context).records,
      2: fetchlocale(context).scan,
      3: fetchlocale(context).doctor,
      4: fetchlocale(context).family
    };
    return label[key];
  }

  final _items = [
    {
      "icon": const ImageIcon(
        AssetImage(bottom1),
        size: 18.0,
      ),
      "page": const Dashboard(),
      "label": "Home"
    },
    {
      "icon": ImageIcon(
        AssetImage(bottom8),
        size: 18.0,
      ),
      "page": const Center(child: Text('Opening Mediflix...')),
      "label": "Advice"
    },
    {
      "icon": Icon(
        null,
        size: 0.1,
      ),
      "page": const Genraldetails(),
      "label": "Scan"
    },
    {
      "icon": const ImageIcon(
        AssetImage(bottom4),
        size: 18.0,
      ),
      "page": Doctortabview(),
      "label": "Doctor"
    },
    {
      "icon": const ImageIcon(
        AssetImage(bottom5),
        size: 18.0,
      ),
      "page": MyThemeGradient(
        child: ConnectionsViewAll(
          title: "My Circle",
        ),
      ),
      "label": "Family"
    },
  ];
}