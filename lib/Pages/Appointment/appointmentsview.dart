import 'package:XLcarez/Pages/NotificationView.dart';
import 'package:XLcarez/env/appexports.dart';

class Appointmentsview extends StatefulWidget {
  const Appointmentsview({super.key});

  @override
  State<Appointmentsview> createState() => _AppointmentsviewState();
}

class _AppointmentsviewState extends State<Appointmentsview> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer2<Appointmentcontroller, Authcontroller>(
          builder: (_, aptctl, auth, child) {
        return Scaffold(
          appBar: Themeappbar(
            title: fetchlocale(context).appointments,
            act: [
              IconButton(
                  onPressed: () {
                    aptctl.getallappointments();
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: scaffoldbgcol,
                  )),
              Visibility(
                visible: auth.userData?["roleId"] == 4,
                child: IconButton(
                    onPressed: () {
                      navigationSlide(context, const RequestsView());
                    },
                    icon: const Icon(
                      Icons.notifications_active,
                      color: scaffoldbgcol,
                      size: 30.0,
                    )),
              ),
            ],
          ),
          body: aptctl.appointmentsload
              ? loader()
              : Column(
                  mainAxisAlignment: aptctl.appointmentlist.isEmpty
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.start,
                  children: [
                    DefaultTabController(
                        initialIndex: currentindex,
                        length: 3,
                        child: TabBar(
                            padding: EdgeInsets.zero,
                            labelStyle: TxtStls.appstyle14,
                            indicatorColor: scaffoldbgcol,
                            labelColor: scaffoldbgcol,
                            onTap: (value) {
                              setState(() {
                                currentindex = value;
                              });
                             // print(value);
                            },
                            tabs: [
                              Tab(
                                text:
                                    "${fetchlocale(context).confirmed} (${aptctl.confirmedlist.length})",
                              ),
                              Tab(
                                text:
                                    "${fetchlocale(context).waitlisted} (${aptctl.waitlisted.length})",
                              ),
                              Tab(
                                text:
                                    "${fetchlocale(context).completed} (${aptctl.completedlist.length})",
                              ),
                            ])),
                    aptctl.appointmentlist.isEmpty
                        ? const Nodatafound()
                        : Expanded(
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: checkscreenwidth(
                                                    genratemediaquery(context)
                                                        .size
                                                        .width) ==
                                                "Small"
                                            ? 1
                                            : checkscreenwidth(
                                                        genratemediaquery(
                                                                context)
                                                            .size
                                                            .width) ==
                                                    "Medium"
                                                ? 2
                                                : 3,
                                        childAspectRatio: 1.8),
                                padding: const EdgeInsets.all(10),
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (_, i) {
                                  final data = currentindex == 0
                                      ? aptctl.confirmedlist[i]
                                      : currentindex == 1
                                          ? aptctl.waitlisted[i]
                                          : aptctl.completedlist[i];
                                  return appointmentCard(data);
                                },
                                itemCount: currentindex == 0
                                    ? aptctl.confirmedlist.length
                                    : currentindex == 1
                                        ? aptctl.waitlisted.length
                                        : aptctl.completedlist.length),
                          )
                  ],
                ),
        );
      }),
    );
  }
}
