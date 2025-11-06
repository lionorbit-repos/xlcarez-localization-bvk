// ignore_for_file: deprecated_member_use, use_build_context_synchronously

// ignore: unused_import
import 'dart:developer';
import 'package:XLcarez/env/appexports.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer<Authcontroller>(builder: (context, authCtrl, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomScrollView(
              primary: true,
              slivers: [
                SliverAppBar(
                  stretch: false,
                  floating: true,
                  pinned: true,
                  elevation: 0.0,
                  scrolledUnderElevation: 0.0,
                  leading: authCtrl.userData?["roleId"] == 5
                      ? IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: scaffoldbgcol,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                      : null,
                  backgroundColor: transparentcol,
                  title: Apptextwidget(fetchlocale(context).profile,
                      style: TxtStls.wstl16),
                  centerTitle: false,
                ),
                appheader(
                  minHeight: authCtrl.userData?["roleId"] == 4 ? 120.0 : 210.0,
                  maxHeight: authCtrl.userData?["roleId"] == 4 ? 120.0 : 210.0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    //color: bgClr1,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                authCtrl.pickImage(context);
                              },
                              child: Stack(
                                children: [
                                  networkImages(
                                      size: 50.0,
                                      url: authCtrl.userData?["image"] == "" ||
                                              authCtrl.userData?["image"] ==
                                                  null
                                          ? avtharimg
                                          : "${asseturl}Users/${authCtrl.userData?["image"]}"),
                                  Positioned(
                                      right: 2,
                                      bottom: 2,
                                      child: CircleAvatar(
                                        backgroundColor: primary,
                                        radius: 10,
                                        child: Icon(
                                          Icons.camera,
                                          color: bgClr1,
                                          size: 10,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            appspace(w: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Visibility(
                                        visible:
                                            authCtrl.userData?["roleId"] == 4,
                                        child: Apptextwidget("Dr.",
                                            style: TxtStls.wstl14)),
                                    Apptextwidget(
                                        authCtrl.userData?["userName"] ??
                                            "${authCtrl.userData?["firstName"]} ${authCtrl.userData?["lastName"]}",
                                        style: TxtStls.wstl14),
                                  ],
                                ),
                                appspace(h: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: genratemediaquery(context)
                                              .size
                                              .width /
                                          2,
                                      child: Apptextwidget(
                                        authCtrl.userData?["roleId"] == 5
                                            ? fetchlocale(context).caption2
                                            : fetchlocale(context).caption,
                                        style: TxtStls.wstl12,
                                      ),
                                    ),
                                    appspace(w: 5),
                                    const Icon(
                                      Icons.thumb_up,
                                      size: 20,
                                      color: scaffoldbgcol,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Visibility(
                              visible: authCtrl.userData?["roleId"] == 5 ||
                                  authCtrl.userData?["roleId"] == 4,
                              child: CircleAvatar(
                                backgroundColor: scaffoldbgcol,
                                radius: 20,
                                child: IconButton(
                                    onPressed: () async {
                                      var data = await authCtrl.fethuserid();
                                      var roleid = await authCtrl.fethroleid();
                                      if (roleid == 5 || roleid == 4) {
                                        _showBottomSheet(context, data);
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.qr_code_2_outlined,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    iconSize: 35),
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: authCtrl.userData?["roleId"] != 5,
                          child: myListTile(
                              onTap: () {
                                showSheet(
                                    context: context, child: chnagelanguage());
                              },
                              iconData: Icons.language,
                              title: fetchlocale(context).lng),
                        ),
                        Visibility(
                          visible: authCtrl.userData?["roleId"] == 5,
                          child: Container(
                            decoration: BoxDecoration(
                                color: scaffoldbgcol,
                                borderRadius: BorderRadius.circular(10)),
                            height: 90,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            width: genratemediaquery(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Apptextwidget(
                                        fetchlocale(context).advise,
                                        style: TxtStls.stl20,
                                      ),
                                      appspace(h: 5),
                                      Row(
                                        mainAxisAlignment: authCtrl
                                                    .heightController
                                                    .text
                                                    .isNotEmpty &&
                                                authCtrl.gender != null &&
                                                authCtrl.ageconteoller.text
                                                    .isNotEmpty &&
                                                authCtrl.weightconteoller.text
                                                    .isNotEmpty
                                            ? MainAxisAlignment.end
                                            : MainAxisAlignment.start,
                                        children: [
                                          Apptextwidget(
                                            authCtrl.heightController.text
                                                        .isNotEmpty &&
                                                    authCtrl.gender != null &&
                                                    authCtrl.ageconteoller.text
                                                        .isNotEmpty &&
                                                    authCtrl.weightconteoller
                                                        .text.isNotEmpty
                                                ? "100%"
                                                : "20%",
                                            style: TxtStls.stl12,
                                          )
                                        ],
                                      ),
                                      LinearProgressIndicator(
                                        borderRadius: BorderRadius.circular(15),
                                        minHeight: 18,
                                        value: authCtrl.heightController.text
                                                    .isNotEmpty &&
                                                authCtrl.gender != null &&
                                                authCtrl.ageconteoller.text
                                                    .isNotEmpty &&
                                                authCtrl.weightconteoller.text
                                                    .isNotEmpty
                                            ? 1.0
                                            : 0.1,
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                                Color(0XFFF3B14E)),
                                        color: const Color(0XFFFFCE51),
                                      )
                                    ],
                                  ),
                                ),
                                appspace(w: 5),
                                GestureDetector(
                                    onTap: () {
                                      navigationSlide(
                                          context,
                                          Signup(
                                            id: authCtrl.userData?["userId"],
                                          ));
                                      authCtrl.assigndata();
                                    },
                                    child: const CircleAvatar(
                                      radius: 30,
                                      backgroundColor: fillcor,
                                      child: Icon(
                                        FontAwesomeIcons.userPen,
                                        color: primary,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                            visible: authCtrl.userData?["roleId"] == 5,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: scaffoldbgcol,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                spacing: 5,
                                children: [
                                  Expanded(
                                    child: textfiled(
                                        controller:
                                            authCtrl.couponcodecontroller,
                                        hintText: fetchlocale(context).coupfield
                                        // "Enter Coupon Code to Reedem Scan's"
                                        ),
                                  ),
                                  //appspace(w: 5),
                                  SizedBox(
                                      width: 70,
                                      height: 30,
                                      child: fillButton(context,
                                          load: authCtrl.couponloading,
                                          title: fetchlocale(context).apply_btn,
                                          btncol: primary,
                                          stle: TxtStls.wstl10,
                                          onTap: () async {
                                        var payload = {
                                          "couponCode": authCtrl
                                              .couponcodecontroller.text,
                                          "userId":
                                              authCtrl.userData?["userId"],
                                          "organizationId":
                                              authCtrl.currentorganization
                                        };
                                        //log(payload.toString());
                                        authCtrl.couponcodes(context,
                                            payload: payload);
                                      })),
                                  appspace(w: 5),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                // SliverToBoxAdapter(
                //   child: Visibility(
                //       visible: authCtrl.userData?["roleId"] == 5,
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: 10, vertical: 10),
                //         child: textfiled(
                //             controller: TextEditingController(), labelText: ""),
                //       )),
                // ),
                SliverToBoxAdapter(
                  child: Visibility(
                      visible: authCtrl.hospitalist.isNotEmpty,
                      child: Wrap(
                        spacing: 5.0,
                        children: authCtrl.hospitalist
                            .map((y) => Chip(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                avatar: Icon(
                                  FontAwesomeIcons.hospital,
                                  color: bgClr2,
                                ),
                                label: Apptextwidget(
                                  y.hospitalName ?? "",
                                )))
                            .toList(),
                      )),
                ),
                SliverToBoxAdapter(
                  child: Visibility(
                      visible: authCtrl.userData?["organizationName"] != null &&
                          authCtrl.userData?["organizationName"] != "",
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Chip(
                          avatar: const Icon(
                            Icons.corporate_fare,
                            color: scaffoldbgcol,
                          ),
                          label: Apptextwidget(
                              authCtrl.userData?["organizationName"] ?? ""),
                        ),
                      )),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      communication(authCtrl),
                      appspace(h: 15),
                    ],
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: bottomContainer(
            child: GestureDetector(
              onTap: () {
                logOutBox(context);
              },
              child: Container(
                margin: const EdgeInsets.only(right: 2),
                height: 50,
                width: genratemediaquery(context).size.width,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: scaffoldbgcol,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Apptextwidget(
                  fetchlocale(context).logout,
                  style: TxtStls.themestyle16,
                )),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget communication(auth) {
    return Visibility(
      visible: auth.userData?["roleId"] == 5,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                myListTile(
                    onTap: () async {
                      navigationSlide(
                          context,
                          Lontudnanalview(
                            id: await auth.fethuserid(),
                            aptid: 0,
                            issameuser: true,
                          ));
                    },
                    iconData: Icons.receipt_outlined,
                    title: fetchlocale(context).myreport),
                // const Divider(),
                // myListTile(onTap: (){
                //   navigationSlide(context, Calculatordasboard());
                // },iconData: Icons.calculate,title: "Health Assessment"),
                //const Divider(color: transparentcol,),
                //  myListTile(
                //   onTap: (){
                //     navigationSlide(context, const Blocklistview());
                //   },
                //     iconData: Icons.block, title: "Block List"),
                myListTile(
                    onTap: () async {
                      showAdaptiveDialog(
                          context: context,
                          builder: (_) {
                            return Consumer<Authcontroller>(
                                builder: (_, auth, child) {
                              return appdailog(context,
                                  alert: Apptextwidget(
                                    //"Delete Account",
                                    fetchlocale(context).deleteac,
                                    style: TxtStls.stl16,
                                  ),
                                  content: auth.isdeleteload
                                      ? SizedBox(
                                          height: 200,
                                          width: genratemediaquery(context)
                                              .size
                                              .width,
                                          child: const Center(
                                            child: CupertinoActivityIndicator(),
                                          ),
                                        )
                                      : Apptextwidget(
                                          fetchlocale(context).dltconfirmation,
                                          // "Are you sure you want to delete the account?",
                                          style: TxtStls.stl15),
                                  actionno: () {
                                    Navigator.pop(context);
                                  },
                                  ationtitleno: fetchlocale(context).no,
                                  ationtitleyes: fetchlocale(context).yes,
                                  actionsyes: () async {
                                    var rjson = {
                                      "status": "Inactive",
                                      "userId": await auth.fethuserid()
                                    };
                                    auth.deleteprofile(context, rjon: rjson);
                                    //Fluttertoast.showToast(msg: "Your account has been deactivated and is scheduled for permanent deletion in 45 days.");
                                  });
                            });
                          });
                    },
                    iconData: Icons.delete_forever,
                    title: fetchlocale(context).deleteac),
                myListTile(
                    onTap: () {
                      navigationSlide(context, const Faqview());
                    },
                    iconData: Icons.question_mark_sharp,
                    title: "FAQ"),
                myListTile(
                    onTap: () {
                      showSheet(context: context, child: chnagelanguage());
                    },
                    iconData: Icons.language,
                    title: fetchlocale(context).lng),

                // const Divider(),
                // myListTile(
                //     iconData: Icons.share_outlined, title: "Refer App"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget chnagelanguage() {
    return Consumer<Localizationcontroller>(builder: (context, loc, child) {
      return DraggableScrollableSheet(
        maxChildSize: 0.8,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.separated(
                    separatorBuilder: (_, i) => const Divider(),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: scrollController,
                    itemCount: loc.langugelist.length,
                    itemBuilder: (_, i) {
                      final aptModel = loc.langugelist[i];
                      return InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Apptextwidget(aptModel["lable"]),
                              aptModel["loc"] == loc.locale
                                  ? const Icon(Icons.check_circle)
                                  : const SizedBox.shrink()
                            ],
                          ),
                        ),
                        onTap: () {
                          loc.setLocale(aptModel["loc"]);
                          loc.selectLanguageid(language: 1);
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }

  Widget myListTile({iconData, title, onTap}) {
    return ListTile(
      leading: Icon(
        iconData,
        color: scaffoldbgcol,
      ),
      title: Apptextwidget(
        title,
        style: TxtStls.wstl14,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: scaffoldbgcol,
      ),
      onTap: onTap,
    );
  }

  void _showBottomSheet(BuildContext context, data) {
    showModalBottomSheet(
      isDismissible: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (BuildContext context) {
        return Consumer<Authcontroller>(builder: (context, authCtrl, child) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.45,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.cancel),
                      iconSize: 30,
                      color: primary,
                    )),
                appspace(h: 15),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.27,
                  child: PrettyQrView(
                    qrImage: QrImage(QrCode(
                      10,
                      QrErrorCorrectLevel.H,
                    )..addData(data.toString())),
                    decoration: const PrettyQrDecoration(
                        shape: PrettyQrSmoothSymbol(
                          color: primary,
                        ),
                        image: PrettyQrDecorationImage(
                            position: PrettyQrDecorationImagePosition.embedded,
                            image: AssetImage(logo))),
                  ),
                ),
                appspace(h: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                        visible: authCtrl.userData["roleId"] == 4,
                        child: const Icon(
                          FontAwesomeIcons.userDoctor,
                          color: primary,
                        )),
                    appspace(w: 10),
                    Apptextwidget(authCtrl.userData["userName"].toString(),
                        style: TxtStls.stl16),
                  ],
                )
              ],
            ),
          );
        });
      },
    );
  }

//   Future<void> showNotification() async {
//   try {
//     // Android Notification Details
//   const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
//     'channel_id', // Unique ID
//     'General Notifications', // Channel Name
//     importance: Importance.high, // High visibility
//     priority: Priority.high, // Immediate attention
//   );

//   // iOS Notification Details
//   const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(presentAlert: true,presentBadge: true,);

//   // Combine Android & iOS settings
//   const NotificationDetails notificationDetails = NotificationDetails(
//     android: androidDetails,
//     iOS: iosDetails,
//   );

//   // Show the notification
//   await flutterLocalNotificationsPlugin.show(
//     0, // Notification ID
//     'New Notification', // Title
//     'This notification works on both Android and iOS!', // Body
//     notificationDetails,
//   );
//   } catch (e) {
//   log(e.toString());
//   }
// }

  void logOutBox(BuildContext context) {
    Consumer<Authcontroller> alert =
        Consumer<Authcontroller>(builder: (context, authCtrl, child) {
      return appdailog(context,
          alert:
              Apptextwidget(fetchlocale(context).logout, style: TxtStls.stl16),
          content: Apptextwidget(fetchlocale(context).logoutconfirmation,
              style: TxtStls.stl15),
          actionno: () {
            Navigator.pop(context);
          },
          ationtitleno: fetchlocale(context).no,
          ationtitleyes: fetchlocale(context).yes,
          actionsyes: () {
            authCtrl.logOut(context);
          });
    });
    showAdaptiveDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

/*
AlertDialog(
        surfaceTintColor: hintClr,
        backgroundColor: bgClr1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        titlePadding: const EdgeInsets.all(15),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        actionsPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        title: Text("Logout", style: TxtStls.stl16),
        content: Text("Are you sure want to logout?", style: TxtStls.stl15),
        actions: [
          TextButton(
              onPressed: () {
                authCtrl.logOut(context);
              },
              child: Text(
                "Yes",
                style: TxtStls.stl14,
              )),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "No",
                style: TxtStls.stl14,
              )),
        ],
      );
*/
