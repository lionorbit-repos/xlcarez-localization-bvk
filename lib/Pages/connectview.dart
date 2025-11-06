// ignore_for_file: use_build_context_synchronously

import 'package:XLcarez/env/appexports.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Connectview extends StatefulWidget {
  const Connectview({super.key});

  @override
  State<Connectview> createState() => _ConnectviewState();
}

class _ConnectviewState extends State<Connectview> {
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer2<Authcontroller, ConnectivityController>(
          builder: (_, ctrl, connect, child) {
        return Scaffold(
          body: ctrl.isloadscan||connect.connectionLoading
              ? loader()
              : ctrl.userscandata == null
                  ? const Nodatafound()
                  : SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          networkImages(
                              url: ctrl.userscandata?["image"] == null ||
                                      ctrl.userscandata?["image"] == ""
                                  ? avtharimg
                                  : "${asseturl}Users/${ctrl.userscandata?["image"]}",
                              size: 120.0),
                          appspace(h: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Apptextwidget(
                                  ctrl.userscandata?["userName"],
                                  style: TxtStls.wstl14,
                                ),
                                appspace(w: 10),
                                Row(
                                  children: [
                                    Icon(
                                      ctrl.userscandata?["roleId"] == 4
                                          ? FontAwesomeIcons.stethoscope
                                          : Icons.medical_information,
                                      color: scaffoldbgcol,
                                    ),
                                    appspace(w: 10),
                                    Apptextwidget(
                                      "${ctrl.userscandata?["userId"]}",
                                      style: TxtStls.wstl20,
                                    )
                                  ],
                                )
                              ]),
                          appspace(h: 15),
                          myrow(
                              icon: Icons.email,
                              value: ctrl.userscandata?["email"]),
                          appspace(h: 15),
                          // Visibility(
                          //     visible: ctrl.userscandata?["phone"] != null&&ctrl.userData?["roleId"]!=5,
                          //     child: myrow(
                          //         icon: Icons.phone_android,
                          //         value: ctrl.userscandata?["phone"] ?? "")),
                          // appspace(h: 15),
                          myrow(
                              icon: FontAwesomeIcons.venusMars,
                              value: ctrl.userscandata?["gender"]),
                          appspace(h: 15),
                          myrow(
                              icon: FontAwesomeIcons.calendar,
                              value: "${ethdate(ctrl)} days"),
                          appspace(h: 10),
                          ElevatedButton.icon(
                              icon: Icon(
                                Icons.link,
                                color: bgClr1,
                              ),
                              onPressed: () async {
                                var fromid = await ctrl.fethuserid();
                                if (!connect.checkalreadyexistconnectin(
                                    fromid: fromid,
                                    toid: ctrl.userscandata?["userId"])) {
                                  connect
                                      .sendRequest(context,
                                          fromUserId: fromid,
                                          toUserId: ctrl.userscandata?["userId"])
                                      .whenComplete(() {
                                        connect.getAllConnections();
                                      });
                                }
                                else{
                                   Fluttertoast.showToast(msg: fetchlocale(context).connectrequsetsent);
                                }
                              },
                              label: Apptextwidget(
                                "Connect",
                                style: TxtStls.wstl13,
                              )),
                          // Center(
                          //   child: Text(ctrl.userscandata.toString()),
                          // ),
                        ],
                      ),
                    ),
          bottomNavigationBar: bottomContainer(
              child: fillButton(context, load: false, title: "Back to Home",
                  onTap: () {
            navigationSlideAndRemoveUntil(context, const Landing());
          })),
        );
      }),
    );
  }

  Widget myrow({icon, value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: scaffoldbgcol,
        ),
        appspace(w: 10),
        Apptextwidget(
          value ?? "-",
          style: TxtStls.wstl14,
        ),
      ],
    );
  }

  Object ethdate(authCtrl) {
    try {
      return DateTime.now()
          .difference(
              DateTime.parse(authCtrl?.userscandata["createdDate"] + "Z"))
          .inDays;
    } catch (ex) {
      return "";
    }
  }
}









// Row(
                    
//                       children: [
//                         Expanded(
//                           flex: 1,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Icon(Icons.email),
//                             ],
//                           ),
//                         ),
//                         appspace(w: 10),
//                         Expanded(
//                           flex: 1,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("test@gmail.com"),
                            
//                             ],
//                           ),
//                         )
                        
//                       ],
//                     ),
//                     Row(
                    
//                       children: [
//                         Expanded(
//                           flex: 1,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Icon(Icons.email),
//                             ],
//                           ),
//                         ),
//                         appspace(w: 10),
//                         Expanded(
//                           flex: 1,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("test@gmail.com"),
                            
//                             ],
//                           ),
//                         )
                        
//                       ],
//                     ),