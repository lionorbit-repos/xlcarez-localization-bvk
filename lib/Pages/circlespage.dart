// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps

import 'package:XLcarez/env/appexports.dart';

class ConnectionsViewAll extends StatefulWidget {
  var title;
  ConnectionsViewAll({super.key, required this.title});
  @override
  State<ConnectionsViewAll> createState() => _ConnectionsViewAllState();
}

class _ConnectionsViewAllState extends State<ConnectionsViewAll> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ConnectivityController, Authcontroller>(
        builder: (context, conCtrl, auth, child) {
      return Scaffold(
        appBar: widget.title != "My Circle"
            ? null
            : Themeappbar(
                title: fetchlocale(context).family,
                act: [
                  IconButton(
                      onPressed: () {
                        conCtrl.getAllConnections();
                      },
                      icon: const Icon(
                        Icons.refresh,
                        color: scaffoldbgcol,
                      ))
                ],
              ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.add,
                        color: bgClr1,
                      ),
                      onPressed: () {
                        navigationSlide(
                            context,
                            Searchconnectusersview(
                              search: widget.title != "My Circle"
                                  ? fetchlocale(context).mycareteam
                                  : fetchlocale(context).family,
                              roleid: widget.title != "My Circle" ? 4 : 5,
                            ));
                      },
                      label: Text(
                        widget.title != "My Circle" ? fetchlocale(context).mycareteam : fetchlocale(context).family,
                        style: TxtStls.wstl13,
                      ))),
              appspace(h: 10),
              conCtrl.connectionLoading
                  ? loader()
                  : (widget.title != ""
                          ? conCtrl.circleList.isEmpty
                          : conCtrl.carelist.isEmpty)
                      ? const Expanded(child: Nodatafound())
                      : Expanded(
                          child: ListView.separated(
                            separatorBuilder: (_, i) => appspace(h: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            itemCount: widget.title == "My Circle"
                                ? conCtrl.circleList.length
                                : conCtrl.carelist.length,
                            itemBuilder: (_, i) {
                              final data = widget.title == "My Circle"
                                  ? conCtrl.circleList[i]
                                  : conCtrl.carelist[i];
                              // log(data.toJson().toString());
                              return loadWidget(
                                  data: data,
                                  col: getcolr(col: i),
                                  auth: auth,
                                  image: auth.userData?["userId"] ==
                                          data.fromUserId
                                      ? data.toUserImage
                                      : data.fromUserImage);
                            },
                          ),
                        ),
            ],
          ),
        ),
      );
    });
  }

  Card loadWidget({data, image, col, Authcontroller? auth}) {
    if (widget.title == "My Circle") {
      return Card(
        surfaceTintColor: fillcor,
        color: fillcor,
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: primary.withOpacity(0.5))),
        //color: col??primary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            trailing: IconButton(
                onPressed: () {
                  navigationSlide(
                      context,
                      Lontudnanalview(
                          id: auth?.userData?["userId"] == data.fromUserId
                              ? data.toUserId
                              : data.fromUserId,
                          aptid: 0,
                          issameuser: true));
                },
                icon: const Icon(Icons.chevron_right)),
            leading: networkImages(
                size: 50.0,
                url: image == null || image == ""
                    ? avtharimg
                    : "${asseturl}Users/${image}"),
            title: Apptextwidget(
              auth?.userData?["userId"] == data.fromUserId
                  ? data.toUserName
                  : data.fromUserName,
              style: TxtStls.stl14,
            ),
          ),
        ),
      );
    } else {
      return Card(
        surfaceTintColor: fillcor,
        color: fillcor,
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: primary.withOpacity(0.5))),
        //color: col??primary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: networkImages(
                size: 50.0,
                url: image == null || image == ""
                    ? avtharimg
                    : "${asseturl}Users/${image}"),
            title: Apptextwidget(
              "Dr.${auth?.userData?["userId"] == data.fromUserId ? data.toUserName : data.fromUserName}",
              style: TxtStls.stl14,
            ),
          ),
        ),
      );
    }
  }
}
