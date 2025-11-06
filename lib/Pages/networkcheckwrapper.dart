// ignore_for_file: use_build_context_synchronously

import 'package:XLcarez/env/appexports.dart';

class Networkcheckwrapper extends StatefulWidget {
  final Widget child;
  const Networkcheckwrapper({super.key, required this.child});

  @override
  State<Networkcheckwrapper> createState() => _NetworkcheckwrapperState();
}

class _NetworkcheckwrapperState extends State<Networkcheckwrapper> {
  // InternetStatus? _connectionStatus;
  // late StreamSubscription<InternetStatus> _subscription;
  // bool alredyapicalled = false;
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      //print("Network Init");
      final ctrl = Provider.of<Networkwrappercontroller>(context,listen: false);
      ctrl.initnetwork(context);
      // _subscription = InternetConnection().onStatusChange.listen((status) {
      //   if (status == InternetStatus.connected) {
      //     callapis();
      //   }
      //   setState(() {
      //     _connectionStatus = status;
      //     alredyapicalled = status==InternetStatus.connected;
      //    // print("Api called $alredyapicalled");
      //   });
      // });
      //print("Network Init");
    });
  }

  // callapis() async {
  //   SharedPreferencesAsync sharedPreferencesAsync = SharedPreferencesAsync();
  //   var roleid = await sharedPreferencesAsync.getInt("roleId");
  //   if (roleid == 5) {
  //     final xtrl = Provider.of<Authcontroller>(context, listen: false);
  //     final assctrl = Provider.of<Assesmentcontroller>(context, listen: false);
  //     final vitak = Provider.of<Vitalscontroller>(context, listen: false);
  //     final ftrl = Provider.of<FoodSearchController>(context, listen: false);
  //     final conn = Provider.of<ConnectivityController>(context, listen: false);
  //     final aptctrl =
  //         Provider.of<Appointmentcontroller>(context, listen: false);
  //     final mptrl = Provider.of<Medicationcontroller>(context, listen: false);
  //     final strl = Provider.of<StepController>(context, listen: false);
  //     xtrl.getallspecilatyies();
  //     xtrl.getbyid();
  //     xtrl.getallsoctors(id: await xtrl.fethuserid());
  //     assctrl.fetchdata(
  //         id: await xtrl.fethuserid(), endpoint: "Question/SleepGetAll");
  //     assctrl.fetchdata(
  //         id: await xtrl.fethuserid(), endpoint: "Question/FatigueGetAll");
  //     strl.getStepsCount();
  //     // xtrl.currentlocation();
  //     vitak.healthme();
  //     vitak.getallvitalslist(id: await xtrl.fethuserid());
  //     vitak.getlatesvitalscore(id: await xtrl.fethuserid());
  //     ftrl.getall(id: await xtrl.fethuserid());
  //     conn.getAllConnections();
  //     aptctrl.getallappointments();
  //     mptrl.getmedications(id: await xtrl.fethuserid());
  //   } else if (roleid == 4) {
  //     final xtrl = Provider.of<Authcontroller>(context, listen: false);
  //     final apt = Provider.of<Appointmentcontroller>(context, listen: false);
  //     xtrl.getbyid();
  //     xtrl.getallspecilatyies();
  //     apt.getallappointments();
  //   } else {
  //     // print("${roleid}Role id");
  //     // print("None of the case");
  //   }
  // }

  @override
  void didChangeDependencies() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      final ctrl = Provider.of<Networkwrappercontroller>(context,listen: false);
      ctrl.chnagedepedcies(context);
    });
    super.didChangeDependencies();
  }

  // @override
  // void dispose() {
  //  if(mounted){
  //  WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val){
  //    Provider.of<Networkwrappercontroller>(context,listen: false).dispose();
  //  });
  //  }
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<Networkwrappercontroller>(
      builder: (context,ctrl,child) {
        return ctrl.connectionstatus == null ||
                ctrl.connectionstatus == InternetStatus.disconnected
            ? Scaffold(
                backgroundColor: scaffoldbgcol,
                body: ctrl.connectionstatus == null
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : ctrl.connectionstatus == InternetStatus.disconnected
                        ? const Nointernetview()
                        : null,
              )
            : widget.child;
      }
    );
  }
}
