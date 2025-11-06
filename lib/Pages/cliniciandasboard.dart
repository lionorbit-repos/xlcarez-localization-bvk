// ignore_for_file: prefer_const_constructors

import 'package:XLcarez/Pages/longitudnalpatinetlist.dart';
import 'package:XLcarez/env/appexports.dart';

class Cliniciandasboard extends StatefulWidget {
  const Cliniciandasboard({super.key});

  @override
  State<Cliniciandasboard> createState() => _CliniciandasboardState();
}

class _CliniciandasboardState extends State<Cliniciandasboard> {
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer<Appointmentcontroller>(builder: (_, aptctrl, chil) {
        return Scaffold(
          appBar: Themeappbar(title: fetchlocale(context).patientse),
          body: aptctrl.appointmentsload
              ? loader()
              : RefreshIndicator(
                  onRefresh: () async {
                    aptctrl.getallappointments();
                  },
                  child: Column(
                    children: [
                      Visibility(
                        visible: aptctrl.patinetlist.isEmpty,
                        child: Expanded(
                          child: Center(
                            child: Apptextwidget(
                              fetchlocale(context).no_data,
                              style: TxtStls.wstl14,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Visibility(
                          visible: aptctrl.patinetlist.isNotEmpty,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: fillcor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Appscalemedia(
                                    child: TextField(
                                      onChanged: (val) {
                                        aptctrl.searchpatinet(val);
                                      },
                                      controller:
                                          aptctrl.searchpatientcontroller,
                                      decoration: InputDecoration(
                                          fillColor: fillcor,
                                          contentPadding:
                                              const EdgeInsets.all(10),
                                          filled: true,
                                          hintText:
                                              "${fetchlocale(context).search} ...",
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              appspace(w: 5),
                              RotatedBox(
                                quarterTurns: 2,
                                child: GestureDetector(
                                  onTap: () async {
                                    aptctrl.searchpatientcontroller.clear();
                                    aptctrl.searchpatinet("");
                                    //ctrl.foodpick(source: ImageSource.camera,lanughe: await loc.fetchlanguage());
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: const BoxDecoration(
                                        color: primary,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: const RotatedBox(
                                      quarterTurns: 2,
                                      child: Icon(
                                        Icons.clear,
                                        color: fillcor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            itemBuilder: (_, i) {
                              final data = aptctrl.patinetlist[i];
                              return Card(
                                elevation: 2,
                                surfaceTintColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: bgClr1,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      onTap: () {
                                        navigationSlide(context, Longitudnalpatinetlist(appointmentdata: data,));
                                      },
                                      trailing: CircleAvatar(
                                        backgroundColor: primary,
                                        child: Icon(Icons.arrow_forward_ios,color: scaffoldbgcol,),
                                      ),
                                      leading: networkImages2(
                                          url:
                                              "${asseturl}Users/${data.patientImage}",
                                          size: 50.0),
                                      title: Apptextwidget(
                                        (data.patientName ?? "")
                                            .toString()
                                            .capitalize(),
                                        style: TxtStls.stl15,
                                      ),
                                    )),
                              );
                            },
                            separatorBuilder: (_, j) {
                              return appspace(h: 5);
                            },
                            itemCount: aptctrl.patinetlist.length),
                      )
                    ],
                  ),
                ),
        );
      }),
    );
  }
}


/*
// child: GridView(
                  //   physics: AlwaysScrollableScrollPhysics(),
                  //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  //   gridDelegate:
                  //       const SliverGridDelegateWithFixedCrossAxisCount(
                  //           childAspectRatio: 1, crossAxisCount: 2),
                  //   children: [
                  //     aptstauscards(
                  //         txtclr: Color(0xFFB24900),
                  //         col: Color(0xFFFFF0E4),
                  //         value: aptctrl.appointmentlist
                  //             .where((e) => e.status == "Waitlisted")
                  //             .toList()
                  //             .length,
                  //         title: fetchlocale(context).waitlisted,
                  //         img: waitlistedimg),
                  //     aptstauscards(
                  //         txtclr: Color(0xFF008194),
                  //         col: Color(0xFFE2F7FA),
                  //         value: aptctrl.appointmentlist
                  //             .where((e) => e.status == "Checkin")
                  //             .toList()
                  //             .length,
                  //         title: fetchlocale(context).checkin,
                  //         img: checkinimg),
                  //     aptstauscards(
                  //         txtclr: Color(0xFF1F5E00),
                  //         col: Color(0xFFEBF1E8),
                  //         value: aptctrl.appointmentlist
                  //             .where((e) => e.status == "Completed")
                  //             .toList()
                  //             .length,
                  //         title: fetchlocale(context).completed,
                  //         img: completedimg),
                  //   ],
                  // ),
*/