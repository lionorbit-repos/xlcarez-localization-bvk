// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_typing_uninitialized_variables
import 'package:XLcarez/env/appexports.dart';
import 'package:XLcarez/model/availblitymodel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class Doctorprofile extends StatefulWidget {
  var doctorModel;
  Doctorprofile({super.key, required this.doctorModel});

  @override
  State<Doctorprofile> createState() => _DoctorprofileState();
}

class _DoctorprofileState extends State<Doctorprofile> {
  List<bool> iselected = [true, false];
  @override
  void initState() {
    //log(widget.doctorModel.toJson().toString());
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      final aptctrl =
          Provider.of<Appointmentcontroller>(context, listen: false);
      aptctrl.resetappointment();
      aptctrl.getdoctorscanbyid(id: widget.doctorModel);
      aptctrl.getdoctoravailblity(id: widget.doctorModel).whenComplete(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer2<Appointmentcontroller, Authcontroller>(
          builder: (context, aptctrl, auth, child) {
        return Scaffold(
          appBar: Themeappbar(
            leading: true,
            title: "Dr. ${aptctrl.userscandata.userName??""}",
            act: [
              IconButton(
                  onPressed: () async {
                    var data = aptctrl.userscandata.userId;
                    _showBottomSheet(
                        context, data, aptctrl.userscandata.userName);
                  },
                  icon: const Icon(
                    Icons.qr_code_2_outlined,
                    color: scaffoldbgcol,
                  ),
                  iconSize: 35),
            ],
          ),
          body: aptctrl.doctoravailblityload || aptctrl.isloadscan
              ? loader()
              : RefreshIndicator(
                  onRefresh: () async {
                    aptctrl.resetappointment();
                    aptctrl.getdoctorscanbyid(id: widget.doctorModel);
                    aptctrl.getdoctoravailblity(id: widget.doctorModel);
                  },
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        expandedHeight: 180,
                        automaticallyImplyLeading: false,
                        flexibleSpace: Container(
                          decoration: BoxDecoration(
                              image: aptctrl.userscandata.image == null||aptctrl.userscandata.image==""
                                  ? DecorationImage(
                                      image: AssetImage(avtharimg),
                                      fit: BoxFit.fill,
                                      filterQuality: FilterQuality.medium)
                                  : DecorationImage(
                                      image: NetworkImage(
                                          "${asseturl}Users/${aptctrl.userscandata.image}"),
                                      fit: BoxFit.fill,
                                      filterQuality: FilterQuality.medium)),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(top: 5, left: 5),
                        sliver: SliverToBoxAdapter(
                          child: Visibility(
                            visible: aptctrl.docttoravaliblitylist.isNotEmpty,
                            child: Wrap(
                              spacing: 2.0,
                              children: aptctrl.userscandata.hospitalist!
                                  .map((r) => GestureDetector(
                                      onTap: () {
                                        aptctrl.changehospitalid(r);
                                        if (aptctrl.docttoravaliblitylist
                                            .where((e) =>
                                                e.hospitalId ==
                                                    aptctrl.hospitalid
                                                        ?.hospitalId &&
                                                e.activity == "Available")
                                            .isNotEmpty) {
                                          List<Avaliblity> list = aptctrl
                                              .docttoravaliblitylist
                                              .where((e) =>
                                                  e.hospitalId ==
                                                      aptctrl.hospitalid
                                                          ?.hospitalId &&
                                                  e.activity == "Available")
                                              .toList();
                                          aptctrl.genratedatelist(
                                              startdate: DateTime.parse(list
                                                  .first.startActivity!
                                                  .split("T")[0]),
                                              endate: DateTime.parse(list
                                                  .last.endActivity!
                                                  .split("T")[0]));
                                          aptctrl.genratetimeslots(list);
                                        } else {
                                          aptctrl.datelist.clear();
                                          aptctrl.timeSlots.clear();
                                        }
                                      },
                                      child: Chip(
                                          backgroundColor:
                                              r == aptctrl.hospitalid
                                                  ? primary
                                                  : bgClr1,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          avatar: Icon(
                                            FontAwesomeIcons.hospital,
                                            size: 18,
                                            color: r == aptctrl.hospitalid
                                                ? bgClr1
                                                : headerClr,
                                          ),
                                          label: Apptextwidget(
                                            r.hospitalName ?? "",
                                            style: r == aptctrl.hospitalid
                                                ? TxtStls.wstl12
                                                : TxtStls.stl12,
                                          ))))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(top: 5, left: 5),
                        sliver: SliverToBoxAdapter(
                          child: Wrap(
                            spacing: 2.0,
                            children: aptctrl.userscandata.specialitylist!
                                .map((r) => GestureDetector(
                                    onTap: () {
                                      aptctrl.changespecilaity(r);
                                    },
                                    child: Chip(
                                        backgroundColor:
                                            r == aptctrl.specialityid
                                                ? primary
                                                : bgClr1,
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        avatar: Icon(
                                          FontAwesomeIcons.userDoctor,
                                          size: 18,
                                          color: r == aptctrl.specialityid
                                              ? bgClr1
                                              : headerClr,
                                        ),
                                        label: Apptextwidget(
                                          r.specialityName ?? "",
                                          style: r == aptctrl.specialityid
                                              ? TxtStls.wstl12
                                              : TxtStls.stl12,
                                        ))))
                                .toList(),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                        sliver: SliverToBoxAdapter(
                          child: Row(
                            children: [
                              Apptextwidget(
                                fetchlocale(context).typee,
                                style: TxtStls.stl13,
                              ),
                              appspace(w: 10),
                              toggle(
                                context,
                                isSelected: iselected,
                                tap: (val) {
                                  setState(() {
                                    for (int index = 0;
                                        index < iselected.length;
                                        index++) {
                                      if (index == val) {
                                        iselected[index] = true;
                                      } else {
                                        iselected[index] = false;
                                      }
                                    }
                                  });
                                  aptctrl
                                      .chnageconsult(val == 0 ? "yes" : "no");
                                },
                                titlw1: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: iselected[0]
                                          ? primary
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10)),
                                  margin: EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.video,
                                        color:
                                            iselected[0] ? bgClr1 : headerClr,
                                        size: 15,
                                      ),
                                      appspace(w: 10),
                                      Apptextwidget(
                                        fetchlocale(context).telecon,
                                        style: iselected[0]
                                            ? TxtStls.wstl12
                                            : TxtStls.stl12,
                                      )
                                    ],
                                  ),
                                ),
                                titlew2: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: iselected[1]
                                          ? primary
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.hospitalUser,
                                        color:
                                            iselected[1] ? bgClr1 : headerClr,
                                        size: 15,
                                      ),
                                      appspace(w: 10),
                                      Apptextwidget(
                                        fetchlocale(context).hospitalvisit,
                                        style: iselected[1]
                                            ? TxtStls.wstl12
                                            : TxtStls.stl12,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                            height: 100,
                            child: aptctrl.datelist.isEmpty
                                ? Center(
                                    child: Apptextwidget(
                                      fetchlocale(context).noslotsavailable,
                                      style: TxtStls.stl12,
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: aptctrl.datelist.length,
                                    physics: ClampingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (_, i) {
                                      final data = aptctrl.datelist[i];
                                      return GestureDetector(
                                        onTap: () {
                                          aptctrl.changedate(data);
                                          //log(data.toString());
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          margin: EdgeInsets.only(
                                              right: 5,
                                              top: 5,
                                              left: 5,
                                              bottom: 5),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      aptctrl.selctedte == data
                                                          ? primary
                                                          : headerClr),
                                              color: aptctrl.selctedte == data
                                                  ? primary
                                                  : bgClr1,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Apptextwidget(
                                                "${data.day.toString().length > 1 ? data.day : "0${data.day}"}",
                                                style: aptctrl.selctedte == data
                                                    ? TxtStls.wstl14
                                                    : TxtStls.stl14,
                                              ),
                                              appspace(h: 5),
                                              Apptextwidget(
                                                dateformat(
                                                    format: "EEE", vale: data),
                                                style: aptctrl.selctedte == data
                                                    ? TxtStls.wstl12
                                                    : TxtStls.stl12,
                                              ),
                                              appspace(h: 5),
                                              Apptextwidget(
                                                "${data.year}",
                                                style: aptctrl.selctedte == data
                                                    ? TxtStls.wstl12
                                                    : TxtStls.stl12,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    })),
                      ),
                      // SliverToBoxAdapter(
                      //   child: Visibility(
                      //       visible: aptctrl.timeSlots
                      //           .where((e) =>
                      //               DateTime.parse(e.startActivity!.split("T")[0])
                      //                   .isAtSameMomentAs(aptctrl.selctedte) ||
                      //               DateTime.parse(e.endActivity!.split("T")[0])
                      //                   .isAtSameMomentAs(aptctrl.selctedte))
                      //           .isEmpty,
                      //       child: Center(
                      //           child: Text(
                      //         "No slots available !!",
                      //         style: TxtStls.stl13,
                      //       ))), s
                      // ),
                      SliverGrid.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 5.0,
                                  crossAxisSpacing: 5.0,
                                  crossAxisCount: 2,
                                  childAspectRatio: 3.5),
                          itemCount: aptctrl.timeSlots
                              .where((e) =>
                                  DateTime.parse(e.startActivity!.split("T")[0])
                                      .isAtSameMomentAs(aptctrl.selctedte) ||
                                  DateTime.parse(e.endActivity!.split("T")[0])
                                      .isAtSameMomentAs(aptctrl.selctedte))
                              .length,
                          itemBuilder: (_, i) {
                            final data = aptctrl.timeSlots
                                .where((e) =>
                                    DateTime.parse(
                                            e.startActivity!.split("T")[0])
                                        .isAtSameMomentAs(aptctrl.selctedte) ||
                                    DateTime.parse(e.endActivity!.split("T")[0])
                                        .isAtSameMomentAs(aptctrl.selctedte))
                                .toList()[i];
                            return GestureDetector(
                                onTap: () {
                                  aptctrl.chnagetimeslot(data);
                                },
                                child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 2),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: aptctrl.seletedtime == data
                                                ? primary
                                                : headerClr),
                                        color: aptctrl.seletedtime == data
                                            ? primary
                                            : bgClr1,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: Apptextwidget(
                                      formatslottiming(data),
                                      style: aptctrl.seletedtime == data
                                          ? TxtStls.wstl13
                                          : TxtStls.stl13,
                                    ))));
                          })
                    ],
                  ),
                ),
          bottomNavigationBar: bottomContainer(
              child: fillButton(context,
                  load: false,
                  title: fetchlocale(context).confirmee, onTap: () {
            if (aptctrl.specialityid?.specialityId != null &&
                aptctrl.seletedtime?.startActivity != null &&
                aptctrl.hospitalid != null) {
              navigationSlide(
                  context,
                  Confirmappointment(
                    doctorModel: aptctrl.userscandata,
                  ));
            } else {
              Fluttertoast.showToast(
                  msg: aptctrl.hospitalid?.hospitalId == null
                      ? fetchlocale(context).pleaseselecthospital
                      : aptctrl.specialityid?.specialityId == null
                          ? fetchlocale(context).pleaseselectspeciality
                          : fetchlocale(context).pleaseselectslot);
            }
          })),
        );
      }),
    );
  }

  void _showBottomSheet(BuildContext context, data, name) {
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
                        image:
                            PrettyQrDecorationImage(image: AssetImage(logo))),
                  ),
                ),
                appspace(h: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      FontAwesomeIcons.userDoctor,
                      color: primary,
                    ),
                    appspace(w: 10),
                    Apptextwidget(name ?? "", style: TxtStls.stl16),
                  ],
                )
              ],
            ),
          );
        });
      },
    );
  }
}
