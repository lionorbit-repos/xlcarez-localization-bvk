// ignore_for_file: file_names


import 'package:XLcarez/env/appexports.dart';

class RequestsView extends StatefulWidget {
  const RequestsView({super.key});
  @override
  State<RequestsView> createState() => _RequestsViewState();
}

class _RequestsViewState extends State<RequestsView> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((time) {
      Provider.of<ConnectivityController>(context, listen: false)
          .getAllConnections();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer2<ConnectivityController, Authcontroller>(
          builder: (context, conCtrl, auth, child) {
        return Scaffold(
            appBar: Themeappbar(
              title: fetchlocale(context).requests,
              leading: true,
            ),
            body: conCtrl.requestedlist.isEmpty
                ? const Nodatafound()
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (_, i) => appspace(h: 10),
                    itemCount: conCtrl.requestedlist.length,
                    itemBuilder: (_, i) {
                      var data = conCtrl.requestedlist[i];
                      //log(data.toJson().toString());
                      return Container(
                        color: transparentcol,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Appscalemedia(
                              child: RichText(
                                  text: TextSpan(
                                      text: data.fromUserId ==
                                              auth.userData?["userId"]
                                          ? data.fromUserName
                                          : data.toUserName,
                                      style: TxtStls.wstl14,
                                      children: [
                                    WidgetSpan(child: appspace(w: 5)),
                                    TextSpan(
                                      text: data.fromUserId ==
                                              auth.userData?["userId"]
                                          ? fetchlocale(context).sentrequestto 
                                          : fetchlocale(context)
                                              .reciverequestfrom,
                                      //fetchlocale(context).sentarequest,
                                      style: TxtStls.stl15,
                                    ),
                                    WidgetSpan(child: appspace(w: 5)),
                                    TextSpan(
                                      text: data.fromUserId ==
                                              auth.userData?["userId"]
                                          ? data.toUserName
                                          : data.fromUserName,
                                      style: TxtStls.wstl14,
                                    )
                                  ])),
                            ),
                            appspace(h: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Flexible(
                                    child: button1(
                                        title: data.fromUserId==auth.userData?["userId"]?fetchlocale(context).cancel:fetchlocale(context).reject,
                                        press: () {
                                          conCtrl
                                              .updateRequestStatus(context,
                                                  id: data.id,
                                                  status: "Rejected")
                                              .whenComplete(() {
                                            conCtrl.getAllConnections();
                                          });
                                        },
                                        color: primary)),
                                appspace(w: 20),
                                Visibility(
                                  visible:
                                      data.toUserId == auth.userData?["userId"],
                                  child: Flexible(
                                      child: button1(
                                          title: fetchlocale(context).accept,
                                          press: () {
                                            conCtrl
                                                .updateRequestStatus(context,
                                                    id: data.id,
                                                    status: "Accepted")
                                                .whenComplete(() {
                                              conCtrl.getAllConnections();
                                            });
                                          },
                                          color: success)),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ));
      }),
    );
  }
}
