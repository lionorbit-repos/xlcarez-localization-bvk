import 'dart:developer';

import 'package:XLcarez/env/appexports.dart';

class Networkwrappercontroller extends ChangeNotifier {
  InternetStatus? _connectionStatus;
  InternetStatus? get connectionstatus => _connectionStatus;
  late StreamSubscription<InternetStatus> _subscription;
  bool alredyapicalled = false;

  void initlize() {
    reset();
    _subscription = InternetConnection().onStatusChange.listen((status) {
      _connectionStatus = status;
      notifyListeners();
    });
  }

  void reset() {
    alredyapicalled = false;
    notifyListeners();
  }

  void initnetwork(context) {
    _subscription = InternetConnection().onStatusChange.listen((status) {
      _connectionStatus = status;
      alredyapicalled = status == InternetStatus.connected;
      notifyListeners();
      if (status == InternetStatus.connected) {
        // print("Api Called");
        callapis(context);
      } else {
        // print("Api  Not Called $alredyapicalled");
      }
    });
  }

  void chnagedepedcies(context) {
    //print("Change dependencies");
    if (!alredyapicalled && _connectionStatus == InternetStatus.connected) {
      callapis(context);
      //print("Api Called");
    }
  }

  Future<void> callapis(context) async {
    var box = await Hive.openBox('XLcarezstore');
    final roleid = box.get('roleId');
   // print(roleid.toString());
    //SharedPreferencesAsync sharedPreferencesAsync = SharedPreferencesAsync();
    //var roleid = await sharedPreferencesAsync.getInt("roleId");
    final assctrl = Provider.of<Assesmentcontroller>(context, listen: false);
    final vitak = Provider.of<Vitalscontroller>(context, listen: false);
    final ftrl = Provider.of<FoodSearchController>(context, listen: false);
    final conn = Provider.of<ConnectivityController>(context, listen: false);
    final aptctrl = Provider.of<Appointmentcontroller>(context, listen: false);
    final mptrl = Provider.of<Medicationcontroller>(context, listen: false);
    final strl = Provider.of<StepController>(context, listen: false);
    final xtrl = Provider.of<Authcontroller>(context, listen: false);
    final apt = Provider.of<Appointmentcontroller>(context, listen: false);
    if (roleid == 5) {
      log("Patient");
      xtrl.getallspecilatyies();
      xtrl.getbyid();
      xtrl.getallsoctors(id: await xtrl.fethuserid());
      assctrl.fetchdata(
          id: await xtrl.fethuserid(), endpoint: "Question/SleepGetAll");
      assctrl.fetchdata(
          id: await xtrl.fethuserid(), endpoint: "Question/FatigueGetAll");
      assctrl.fetchdata(id: await xtrl.fethuserid(), endpoint: 'Question/HivGetAll');    
      strl.getStepsCount();
      // xtrl.currentlocation();
      vitak.healthme();
      vitak.getallvitalslist(id: await xtrl.fethuserid());
      vitak.getlatesvitalscore(id: await xtrl.fethuserid());
      ftrl.getall(id: await xtrl.fethuserid());
      conn.getAllConnections();
      aptctrl.getallappointments();
      mptrl.getmedications(id: await xtrl.fethuserid());
    } else if (roleid == 4) {
      log("Clinician");
      xtrl.getbyid();
      xtrl.getallspecilatyies();
      apt.getallappointments();
    } else if (roleid == 1) {
      log("Super Admin");
      xtrl.getbyid();
      xtrl.getroles();
      xtrl.usersdata();
      xtrl.getorganizations();
      xtrl.admindahboardcount();
    } else if (roleid == 2 || roleid == 3) {
      log("Organization Admin");
      xtrl.getbyid();
      xtrl.getroles();
      xtrl.usersdata();
      xtrl.getorganizations();
      xtrl.admindahboardcount();
    } else {
      // print("${roleid}Role id");
      // print("None of the case");
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
