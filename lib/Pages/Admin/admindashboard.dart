import 'package:XLcarez/env/appexports.dart';

class Admindashboard extends StatefulWidget {
  const Admindashboard({super.key});

  @override
  State<Admindashboard> createState() => _AdmindashboardState();
}

class _AdmindashboardState extends State<Admindashboard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Authcontroller>(builder: (_, ctrl, child) {
      return Scaffold(
        appBar: Themeappbar(
          title: fetchlocale(context).dashboard,
          leading: false,
        ),
        body: SizedBox(
          height: genratemediaquery(context).size.height,
          width: genratemediaquery(context).size.width,
          child: ctrl.admindashboardload
              ? loader()
              : RefreshIndicator(
                  onRefresh: () async {
                    ctrl.admindahboardcount();
                  },
                  child: GridView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1, crossAxisCount: 2),
                    children: [
                      aptstauscards(
                          txtclr: const Color(0xFF008194),
                          col: const Color(0xFFE2F7FA),
                          value: "${ctrl.admindahboardcounts?["doctorCount"]}",
                          title: fetchlocale(context).doctorse,
                          img: bottom4),
                      aptstauscards(
                          txtclr: const Color(0xFF008194),
                          col: const Color(0xFFE2F7FA),
                          value: "${ctrl.admindahboardcounts?["patientCount"]}",
                          title: fetchlocale(context).patientse,
                          icon: const Icon(
                            Icons.group,
                            size: 50,
                          )),
                      aptstauscards(
                          txtclr: const Color(0xFF008194),
                          col: const Color(0xFFE2F7FA),
                          value:
                              "${ctrl.admindahboardcounts?["hospitalCount"]}",
                          title: fetchlocale(context).hospitasee,
                          icon: const Icon(
                            Icons.local_hospital,
                            size: 50,
                          )),
                      aptstauscards(
                          txtclr: const Color(0xFF008194),
                          col: const Color(0xFFE2F7FA),
                          value:
                              "${ctrl.admindahboardcounts?["appointmentCount"]}",
                          title: fetchlocale(context).appointments,
                          img: bottom8),
                    ],
                  )),
        ),
      );
    });
  }
}
