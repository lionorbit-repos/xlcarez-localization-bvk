// ignore_for_file: must_be_immutable, use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'package:XLcarez/env/appexports.dart';

class Searchconnectusersview extends StatefulWidget {
  var search;
  var roleid;
  Searchconnectusersview({super.key, this.search, this.roleid});

  @override
  State<Searchconnectusersview> createState() => _SearchconnectusersviewState();
}

class _SearchconnectusersviewState extends State<Searchconnectusersview> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      Provider.of<ConnectivityController>(context, listen: false).resetdata();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ConnectivityController, Authcontroller>(
        builder: (context, ctrl, auth, child) {
      return MyThemeGradient(
        child: Scaffold(
          appBar: Themeappbar(
            title: widget.search,
            leading: true,
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: genratemediaquery(context).size.height,
            width: genratemediaquery(context).size.width,
            child: ctrl.searchload
                ? loader()
                : Column(
                    children: [
                      Container(
                        height: 60,
                        width: genratemediaquery(context).size.width,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: fillcor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Appscalemedia(
                          child: TextField(
                            controller: ctrl.searchcontroller,
                            decoration: const InputDecoration(
                                fillColor: fillcor,
                                contentPadding: EdgeInsets.all(10),
                                filled: true,
                                hintText: "Search...",
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      appspace(h: 10),
                      SizedBox(
                        height: 40,
                        width: genratemediaquery(context).size.width,
                        child: fillButton(context, load: false, title: "Search",
                            onTap: () {
                          if (ctrl.searchcontroller.text.isNotEmpty) {
                            var payload = {
                              "userName": ctrl.searchcontroller.text,
                              "roleId": widget.roleid,
                            };
                            ctrl.searchusers(payload: payload);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "You need to enter text before proceeding with the search.")));
                          }
                        }),
                      ),
                      Visibility(
                          visible: ctrl.searchlist
                              .where((ele) =>
                                  ele.userId != auth.userData?["userId"])
                              .isEmpty,
                          child: const Expanded(child: Nodatafound())),
                      Expanded(
                          child: GridView.builder(
                              itemCount: ctrl.searchlist
                                  .where((ele) =>
                                      ele.userId != auth.userData?["userId"])
                                  .length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: checkscreenwidth(
                                                  genratemediaquery(context)
                                                      .size
                                                      .width) ==
                                              "Small"
                                          ? 1
                                          : checkscreenwidth(
                                                      genratemediaquery(context)
                                                          .size
                                                          .width) ==
                                                  "Medium"
                                              ? 2
                                              : 3,
                                      childAspectRatio: 4),
                              itemBuilder: (_, i) {
                                final data = ctrl.searchlist
                                    .where((ele) =>
                                        ele.userId != auth.userData?["userId"])
                                    .toList()[i];
                                return Card(
                                  surfaceTintColor: scaffoldbgcol,
                                  color: scaffoldbgcol,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            networkImages(
                                                url: data.image == null ||
                                                        data.image == ""
                                                    ? avtharimg
                                                    : "${asseturl}Users/${data.image}",
                                                size: 80.0),
                                            appspace(w: 10),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 5),
                                              child: Column(
                                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  widget.roleid == 4
                                                      ? Apptextwidget(
                                                          "Dr. ${data.firstName} ${data.lastName}",
                                                          style: TxtStls.stl15,
                                                        )
                                                      : Apptextwidget(
                                                          "${data.firstName} ${data.lastName}",
                                                          style: TxtStls.stl15,
                                                        ),
                                                  Apptextwidget(
                                                    // overflow:
                                                    //     TextOverflow.ellipsis,
                                                    data.email ?? "",
                                                    style: TxtStls.stl13,
                                                  ),
                                                  // Apptextwidget(
                                                  //   data.phone ?? "",
                                                  //   style: TxtStls.stl13,
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                          child: GestureDetector(
                                              onTap: () async {
                                                if (!ctrl
                                                    .checkalreadyexistconnectin(
                                                        fromid: await
                                                            auth.fethuserid(),
                                                        toid: data.userId)) {
                                                  auth.getscanbyid(
                                                      id: data.userId);
                                                  navigationSlide(context,
                                                      const Connectview());
                                                }
                                                else{
                                               Fluttertoast.showToast(msg: fetchlocale(context).connectrequsetsent);
                                                  //Fluttertoast.showToast(msg: "You have already sent a connection request to this user!");
                                                }
                                              },
                                              child: const CircleAvatar(
                                                  radius: 27,
                                                  backgroundColor: primary,
                                                  child: CircleAvatar(
                                                    radius: 25,
                                                    backgroundColor:
                                                        scaffoldbgcol,
                                                    child: Icon(
                                                        Icons.arrow_forward),
                                                  ))),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }))
                    ],
                  ),
          ),
        ),
      );
    });
  }
}
