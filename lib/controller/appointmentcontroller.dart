// ignore_for_file: unused_import, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:XLcarez/env/appexports.dart';
import 'package:XLcarez/model/availblitymodel.dart';
import 'package:intl/intl.dart';

class Appointmentcontroller extends ChangeNotifier {
  List<String> payments = ["Pay Now", "Pay Later"];
  var paymentype = "Pay Later";
  void chnagepaymentype(val) {
    paymentype = val;
    notifyListeners();
  }

  DateTime selctedte = format(DateTime.now());

  void changedate(DateTime date) {
    selctedte = date;
    notifyListeners();
  }

  SpecialityModel? specialityid;
  void changespecilaity(val) {
    specialityid = val;
    notifyListeners();
  }

  HospitalModel? hospitalid;
  void changehospitalid(val) {
    hospitalid = val;
    notifyListeners();
  }

  var consultiontype = "yes";
  void chnageconsult(val) {
    consultiontype = val;
    notifyListeners();
  }

  Avaliblity? seletedtime;

  List<Avaliblity> timeSlots = [];
  void genratetimeslots(List<Avaliblity> slots) {
    timeSlots = slots;
    timeSlots = timeSlots
        .where((e) =>
            DateTime.now()
                .isBefore(DateTime.parse(e.startActivity.toString())) ||
            DateTime.now().isBefore(DateTime.parse(e.endActivity.toString())))
        .toList();
    notifyListeners();
  }

  List<DateTime> datelist = [];
  List<Avaliblity> docttoravaliblitylist = [];
  bool doctoravailblityload = false;
  Future<void> getdoctoravailblity({id}) async {
    try {
      doctoravailblityload = true;
      datelist.clear();
      timeSlots.clear();
      docttoravaliblitylist.clear();
      notifyListeners();
      final res =
          await postmethod(endpoint: "Schedule/GetById", body: {"id": id});
      if (res != null) {
        List list = res;
        docttoravaliblitylist =
            list.map((r) => Avaliblity.fromJson(r)).toList();
        notifyListeners();
      }
      log(docttoravaliblitylist
          .map((g) => g.toJson().toString())
          .toList()
          .toString());
      doctoravailblityload = false;
      notifyListeners();
    } catch (e) {
      doctoravailblityload = false;
      notifyListeners();
    }
  }

  DoctorModel userscandata = DoctorModel.fromJson({});
  bool isloadscan = false;
  Future<void> getdoctorscanbyid({id}) async {
    try {
      resetscandata();
      isloadscan = true;
      notifyListeners();
      final res = await postmethod(endpoint: "User/GetById", body: {"id": id});
      if (res != null) {
        //log(res.toString());
        userscandata = DoctorModel.fromJson(res);
        notifyListeners();
      } else {
        resetscandata();
      }
      isloadscan = false;
      notifyListeners();
    } catch (e) {
      userscandata = DoctorModel.fromJson({});
      isloadscan = false;
      notifyListeners();
    }
  }

  void resetscandata() {
    userscandata = DoctorModel.fromJson({});
    notifyListeners();
  }

  void genratedatelist({startdate, endate}) {
    try {
      datelist.clear();
      notifyListeners();
      DateTime stda = startdate;
      DateTime eda = endate;
      var difference = eda.difference(stda).inDays;
      //log(difference.toString());
      for (int i = 0; i <= difference; i++) {
        datelist.add(stda.add(Duration(days: i)));
        notifyListeners();
      }
      datelist = datelist
          .where((ele) =>
              ele.isAfter(
                  DateTime.parse(DateTime.now().toString().split(" ")[0])) ||
              ele.isAtSameMomentAs(
                  DateTime.parse(DateTime.now().toString().split(" ")[0])))
          .toList();
      notifyListeners();
    } catch (e) {
      datelist.clear();
      notifyListeners();
    }
  }

  void chnagetimeslot(time) {
    seletedtime = time;
    notifyListeners();
  }

  var specilatyid;
  void chnagespecialityid(val) {
    specilatyid = val;
    notifyListeners();
  }

  var doctorid;
  void chnagedoctor(val) {
    doctorid = val;
    notifyListeners();
  }

  TextEditingController commentscontroller = TextEditingController();

  bool saveappointmentload = false;
  Future<void> appointmentsave(context, {ajson, name, showtoast}) async {
    try {
      saveappointmentload = true;
      notifyListeners();
      final res = await postmethod(
          endpoint: "Appointment/Save", body: ajson, totalres: true);
      //log("khs $res");
      if (res["status"] == true && ajson["appointmentId"] == 0) {
        navigationSlide(
            context,
            BookAppointmentView(
              name: name,
            ));
      } else if (res['status'] && ajson['status'] == "Completed" && showtoast) {
        Fluttertoast.showToast(msg: "Checkout completed successfully.");
      }
      saveappointmentload = false;
      notifyListeners();
    } catch (e) {
      saveappointmentload = false;
      notifyListeners();
    }
  }

  var aptid;
  List<Appointmentmodel> confirmedlist = [];
  List<Appointmentmodel> waitlisted = [];
  List<Appointmentmodel> completedlist = [];
  bool appointmentsload = false;
  List<Appointmentmodel> appointmentlist = [];
  List<Appointmentmodel> _originalpatielist = [];
  List<Appointmentmodel> patinetlist = [];
  Future<void> getallappointments() async {
    try {
      appointmentlist.clear();
      appointmentsload = true;
      notifyListeners();
      final res = await postmethod(endpoint: "Appointment/GetAll", body: {});
      if (res != null) {
        List list = res;
        appointmentlist =
            list.map((r) => Appointmentmodel.fromJson(r)).toList();
        //log("Brfore ${appointmentlist.length}");
        final unique = <int?>{};
        final uniquelist =
            appointmentlist.where((e) => unique.add(e.patientId)).toList();
        _originalpatielist = uniquelist;
        patinetlist = _originalpatielist;
        patinetlist.sort((a, b) =>
            a.patientName.toString().compareTo(b.patientName.toString()));
        //log("After ${_originalpatielist.length}");
        confirmedlist = appointmentlist
            .where((e) =>
                e.status.toString() == "Checkin" || e.status == "Confirmed")
            .toList(growable: true);
        waitlisted = appointmentlist
            .where((e) => e.status.toString() == "Waitlisted")
            .toList(growable: true);
        completedlist = appointmentlist
            .where((e) => e.status.toString() == "Completed")
            .toList(growable: true);
        notifyListeners();
      }
      appointmentsload = false;
      notifyListeners();
    } catch (e) {
      appointmentsload = false;
      notifyListeners();
    }
  }

  TextEditingController searchpatientcontroller = TextEditingController();
  void searchpatinet(val) {
    if (val == "") {
      patinetlist = _originalpatielist;
    } else {
      patinetlist = _originalpatielist.where((el) {
        final input = val.toString().toLowerCase();
        final patientname = el.patientName.toString().toLowerCase();
        return patientname.contains(input);
      }).toList();
    }
    notifyListeners();
  }

  bool appointmentloadbyid = false;
  Appointmentmodel? appointmentmodel;
  Future<void> getappointbyid({id}) async {
    try {
      appointmentloadbyid = true;
      appointmentmodel = null;
      notifyListeners();
      final res =
          await postmethod(endpoint: "Appointment/GetById", body: {"id": id});
      if (res != null) {
        log(res.toString());
        appointmentmodel = Appointmentmodel.fromJson(res[0]);
        aptid = appointmentmodel?.appointmentId;
        assignclinnicinanotes(res[0]["clinicalNotes"]);
        assignreferalclinician(res[0]["appointmentReferral"]);
        notifyListeners();
      }
      appointmentloadbyid = false;
      notifyListeners();
    } catch (e) {
      log(e.toString());
      appointmentloadbyid = false;
      notifyListeners();
    }
  }

  dynamic assignreferalclinician(model) {
    if (model != null) {
      var data = jsonDecode(model);
      specilatyid = data["specid"];
      doctorid = data["doctorid"];
      commentscontroller.text = data["comments"];
    } else {
      specilatyid = null;
      doctorid = null;
      commentscontroller.text = "";
    }
    notifyListeners();
  }

  Future<void> confirmappointment({required id, required status}) async {
    try {
       await postmethod(
          endpoint: "Appointment/UpdateStatus",
          body: {"id": id, "Status": status});
    // ignore: empty_catches
    } catch (e) {
      
    }
  }

  void assignclinnicinanotes(model) {
    if (model != null) {
      var data = jsonDecode(model);
      controller1.text = data["head"];
      controller2.text = data["left_arm"];
      controller3.text = data["right_arm"];
      controller4.text = data["left_leg"];
      controller5.text = data["right_leg"];
      controller6.text = data["notes"];
      coronaryartery = data["coronaryartery"];
      cerebrovascular = data["cerebrovascular"];
      peripheralartery = data["peripheralartery"];
      macrocontroller.text = data["macrocontroller"];
      retinopathy = data["retinopathy"];
      neuropathy = data["neuropathy"];
      nephropathy = data["nephropathy"];
      microcontroller.text = data["microcontroller"];
      skin = data["skin"];
      sensation = data["sensation"];
      vibration = data["vibration"];
      deformity = data["deformity"];
      ulcer = data["ulcer"];
      footcontroller.text = data["footcontroller"];
      slectVisittype = data["slectVisittype"];
      sbpcontroller.text = data["sbpcontroller"];
      dbpcontroller.text = data["dbpcontroller"];
      accontroller.text = data["accontroller"];
      pccontroller.text = data["pccontroller"];
      heightcontroller.text = data["heightcontroller"];
      weightDueDatecontroller.text = data["weightDueDatecontroller"];
      bmicontroller.text = data["bmicontroller"];
      selecttobacco = data["selecttobacco"];
      nonlabcontroller.text = data["nonlabcontroller"];
      labBasedcontroller.text = data["labBasedcontroller"];
      hbA1Ccontroller.text = data["hbA1Ccontroller"];
      tCcontroller.text = data["tCcontroller"];
      tGLcontroller.text = data["tGLcontroller"];
      hDLcontroller.text = data["hDLcontroller"];
      lDLcontroller.text = data["lDLcontroller"];
      vlDLcontroller.text = data["vlDLcontroller"];
      ureacontroller.text = data["ureacontroller"];
      creatininecontroller.text = data["creatininecontroller"];
      eGFRcontroller.text = data["eGFRcontroller"];
      uACRcontroller.text = data["uACRcontroller"];
      tSHcontroller.text = data["tSHcontroller"];
      fT4controller.text = data["fT4controller"];
      fT3controller.text = data["fT3controller"];
      funduscontroller.text = data["funduscontroller"];
      eCHOcontroller.text = data["eCHOcontroller"];
      eCGcontroller.text = data["eCGcontroller"];
      visitDuedatacontroller.text = data["visitDuedatacontroller"];
      invDueDatecontroller.text = data["invDueDatecontroller"];
      acPCDueDatecontroller.text = data["acPCDueDatecontroller"];
    } else {
      controller1.text = "";
      controller2.text = "";
      controller3.text = "";
      controller4.text = "";
      controller5.text = "";
      controller6.text = "";
      sbpcontroller.text = "";
      dbpcontroller.text = "";
      accontroller.text = "";
      pccontroller.text = "";
      heightcontroller.text = "";
      weightDueDatecontroller.text = "";
      bmicontroller.text = "";
      nonlabcontroller.text = "";
      labBasedcontroller.text = "";
      hbA1Ccontroller.text = "";
      tCcontroller.text = "";
      tGLcontroller.text = "";
      hDLcontroller.text = "";
      lDLcontroller.text = "";
      vlDLcontroller.text = "";
      ureacontroller.text = "";
      creatininecontroller.text = "";
      eGFRcontroller.text = "";
      uACRcontroller.text = "";
      tSHcontroller.text = "";
      fT4controller.text = "";
      fT3controller.text = "";
      funduscontroller.text = "";
      eCHOcontroller.text = "";
      eCGcontroller.text = "";
      visitDuedatacontroller.text = "";
      invDueDatecontroller.text = "";
      acPCDueDatecontroller.text = "";

      slectVisittype = null;
      selecttobacco = null;
      coronaryartery = null;
      cerebrovascular = null;
      peripheralartery = null;
      macrocontroller.text = "";
      retinopathy = null;
      neuropathy = null;
      nephropathy = null;
      microcontroller.text = "";
      skin = null;
      sensation = null;
      vibration = null;
      deformity = null;
      ulcer = null;
      footcontroller.text = "";
    }
    notifyListeners();
  }

  void clearclinicontroller() {
    controller1.clear();
    controller2.clear();
    controller3.clear();
    controller4.clear();
    controller5.clear();
    controller6.clear();
    notifyListeners();
  }

  List<String> yeslist = ["Yes", "No"];

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController controller5 = TextEditingController();
  final TextEditingController controller6 = TextEditingController();
  final TextEditingController macrocontroller = TextEditingController();
  final TextEditingController microcontroller = TextEditingController();
  final TextEditingController footcontroller = TextEditingController();
  final TextEditingController sbpcontroller = TextEditingController();
  final TextEditingController dbpcontroller = TextEditingController();
  final TextEditingController accontroller = TextEditingController();
  final TextEditingController pccontroller = TextEditingController();
  final TextEditingController visitDuedatacontroller = TextEditingController();
  final TextEditingController invDueDatecontroller = TextEditingController();
  final TextEditingController acPCDueDatecontroller = TextEditingController();
  final TextEditingController heightcontroller = TextEditingController();
  final TextEditingController weightDueDatecontroller = TextEditingController();
  final TextEditingController bmicontroller = TextEditingController();
  final TextEditingController nonlabcontroller = TextEditingController();
  final TextEditingController labBasedcontroller = TextEditingController();
  final TextEditingController hbA1Ccontroller = TextEditingController();
  final TextEditingController tCcontroller = TextEditingController();
  final TextEditingController tGLcontroller = TextEditingController();
  final TextEditingController hDLcontroller = TextEditingController();
  final TextEditingController lDLcontroller = TextEditingController();
  final TextEditingController vlDLcontroller = TextEditingController();
  final TextEditingController ureacontroller = TextEditingController();
  final TextEditingController creatininecontroller = TextEditingController();
  final TextEditingController eGFRcontroller = TextEditingController();
  final TextEditingController uACRcontroller = TextEditingController();
  final TextEditingController tSHcontroller = TextEditingController();
  final TextEditingController fT4controller = TextEditingController();
  final TextEditingController fT3controller = TextEditingController();
  final TextEditingController funduscontroller = TextEditingController();
  final TextEditingController eCHOcontroller = TextEditingController();
  final TextEditingController eCGcontroller = TextEditingController();

  String? selecttobacco;
  void changetobacco(value) {
    selecttobacco = value;
    notifyListeners();
  }

  List<dynamic> visitList = ["Patient", "Proxy"];
  String? slectVisittype;
  void changevisit(value) {
    slectVisittype = value;
    notifyListeners();
  }

  String? coronaryartery;
  void updatecornoryartery(val) {
    coronaryartery = val;
    notifyListeners();
  }

  String? cerebrovascular;
  void updatecerebrovascular(val) {
    cerebrovascular = val;
    notifyListeners();
  }

  String? peripheralartery;
  void updateperipheralartery(val) {
    peripheralartery = val;
    notifyListeners();
  }

  String? retinopathy;
  void updateretinopathy(val) {
    retinopathy = val;
    notifyListeners();
  }

  String? nephropathy;
  void updatenephropathy(val) {
    nephropathy = val;
    notifyListeners();
  }

  String? neuropathy;
  void updateneuropathy(val) {
    neuropathy = val;
    notifyListeners();
  }

  String? skin;
  void updateskin(val) {
    skin = val;
    notifyListeners();
  }

  String? sensation;
  void updatesensation(val) {
    sensation = val;
    notifyListeners();
  }

  String? vibration;
  void updatevibration(val) {
    vibration = val;
    notifyListeners();
  }

  String? deformity;
  void updatedeformity(val) {
    deformity = val;
    notifyListeners();
  }

  String? ulcer;
  void updateulcer(val) {
    ulcer = val;
    notifyListeners();
  }

  void resetappointment() {
    userscandata = DoctorModel.fromJson({});
    paymentype = "Pay Later";
    selctedte = format(DateTime.now());
    aptid = null;
    specilatyid = null;
    doctorid = null;
    commentscontroller.clear();
    consultiontype = "yes";
    datelist.clear();
    controller1.clear();
    controller2.clear();
    controller3.clear();
    controller4.clear();
    controller5.clear();
    controller6.clear();
    macrocontroller.clear();
    microcontroller.clear();
    footcontroller.clear();
    retinopathy = null;
    neuropathy = null;
    nephropathy = null;
    coronaryartery = null;
    cerebrovascular = null;
    peripheralartery = null;
    skin = null;
    sensation = null;
    vibration = null;
    deformity = null;
    ulcer = null;
    docttoravaliblitylist.clear();
    specialityid = SpecialityModel(specialityId: null, specialityName: null);
    hospitalid = HospitalModel(hospitalId: null, hospitalName: null);
    timeSlots.clear();
    notifyListeners();
  }
}
