import 'package:XLcarez/env/appexports.dart';

class Blocklistview extends StatefulWidget {
  const Blocklistview({super.key});

  @override
  State<Blocklistview> createState() => _BlocklistviewState();
}

class _BlocklistviewState extends State<Blocklistview> {
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer2<ConnectivityController, Authcontroller>(
          builder: (_, ctrl, auth, child) {
        return Scaffold(
          appBar: Themeappbar(
            title: "Block List",
            leading: true,
            act: [
              IconButton(
                  onPressed: () {
                    ctrl.getAllConnections();
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: scaffoldbgcol,
                  ))
            ],
          ),
          body: SizedBox(
            height: genratemediaquery(context).size.height,
            width: genratemediaquery(context).size.width,
            child: Column(
              children: [
                ctrl.connectionLoading||ctrl.arLoading
                    ? loader()
                    : ctrl.rejectedList
                                  .where((ele) =>
                                      ele.toUserId == auth.userData?["userId"])
                                  .toList().isEmpty
                        ? const Expanded(child: Nodatafound())
                        : Expanded(
                            child: ListView.separated(
                              separatorBuilder: (_, i) => appspace(h: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              itemCount: ctrl.rejectedList
                                  .where((ele) =>
                                      ele.toUserId == auth.userData?["userId"])
                                  .toList()
                                  .length,
                              itemBuilder: (_, i) {
                                final data = ctrl.rejectedList
                                    .where((ele) =>
                                        ele.toUserId ==
                                        auth.userData?["userId"])
                                    .toList()[i];
                                // log(data.toJson().toString());
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            networkImages(
                                                size: 60.0,
                                                url: data.fromUserImage ==
                                                            null ||
                                                        data.fromUserImage == ""
                                                    ? avtharimg
                                                    : "${asseturl}Users/${data.fromUserImage}"),
                                            appspace(w: 10),
                                            Apptextwidget(
                                              data.fromUserName ?? "",
                                              style: TxtStls.stl14,
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 100,child: fillButton(context,btncol: primary,load: ctrl.arLoading, title: "Unblock",stle: TxtStls.wstl13,onTap: (){
                                          //print(data.id);
                                          ctrl
                                              .updateRequestStatus(context,
                                                  id: data.id,
                                                  status: "Accepted")
                                              .whenComplete(() {
                                            ctrl.getAllConnections();
                                          });
                                        }))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
              ],
            ),
          ),
        );
      }),
    );
  }
}
