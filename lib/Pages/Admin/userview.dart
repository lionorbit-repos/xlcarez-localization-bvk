import 'package:XLcarez/env/appexports.dart';

class Userview extends StatefulWidget {
  const Userview({super.key});

  @override
  State<Userview> createState() => _UserviewState();
}

class _UserviewState extends State<Userview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Authcontroller>(builder: (_, ctrl, child) {
      return Scaffold(
        appBar: Themeappbar(
          title: "${fetchlocale(context).userse} ${ctrl.users.length}",
          leading: false,
          act: [
            IconButton(
                onPressed: () {
                  Provider.of<Authcontroller>(context, listen: false)
                      .usersdata();
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    ctrl.chnagecureentorganization(
                        ctrl.userData?["organizationId"]);
                    ctrl.chngeuserid(0);
                    navigationSlide(context, const Useradd());
                  },
                  label: Apptextwidget(
                    fetchlocale(context).usre,
                    style: TxtStls.wstl13,
                  ),
                  icon: const Icon(
                    Icons.add,
                    color: scaffoldbgcol,
                  ),
                ),
                appspace(h: 10),
                Container(
                  height: 60,
                  width: genratemediaquery(context).size.width,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: fillcor,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Row(
                    children: [
                      Appscalemedia(
                        child: Expanded(
                          flex: 2,
                          child: TextField(
                            controller: ctrl.searchcontroller,
                            onChanged: (val) {
                              ctrl.searchuser(val);
                            },
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () async {
                                      ctrl.searchcontroller.clear();
                                      ctrl.searchuser("");
                                      ctrl.chnagedropdownuser(
                                          await ctrl.fethroleid());
                                    },
                                    icon: const Icon(Icons.clear)),
                                fillColor: fillcor,
                                contentPadding: const EdgeInsets.all(10),
                                filled: true,
                                hintText: "${fetchlocale(context).search}...",
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      const VerticalDivider(
                        width: 10,
                      ),
                      DropdownButton2(
                          underline: const SizedBox.shrink(),
                          hint: Apptextwidget(
                            fetchlocale(context).selectrolese,
                            //"${fetchlocale(context).selecte} ${fetchlocale(context).speciliaty}",
                            style: TxtStls.hintStl,
                          ),
                          dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10))),
                          value: ctrl.dropdownuser,
                          items: ctrl.rolelist
                              .where((ele) =>
                                  (ele.roleId ?? 0) >=
                                  (ctrl.userData?["roleId"] ?? 0))
                              .map((e) => DropdownMenuItem(
                                  value: e.roleId,
                                  child: Apptextwidget(e.roleName ?? "")))
                              .toList(),
                          onChanged: (val) {
                            ctrl.chnagedropdownuser(val);
                          }),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  width: genratemediaquery(context).size.width,
                  decoration: const BoxDecoration(
                      color: fillcor,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: DropdownButton2(
                      isExpanded: true,
                      underline: const SizedBox.shrink(),
                      hint: Apptextwidget(
                        fetchlocale(context).selectorganization,
                        //"${fetchlocale(context).selecte} ${fetchlocale(context).speciliaty}",
                        style: TxtStls.hintStl,
                      ),
                      dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10))),
                      value: ctrl.dropdownuserorg,
                      items: ctrl.organizationlist
                          .map((e) => DropdownMenuItem(
                              value: e.organizationId,
                              child: Apptextwidget(
                                  e.organizationName?.text ?? "")))
                          .toList(),
                      onChanged: ctrl.userData?["roleId"] == 1
                          ? (val) {
                              ctrl.chnagedropdownuserorg(val);
                            }
                          : null),
                ),
                Visibility(
                    visible: ctrl.users
                        .where((ele) => ele.userId != ctrl.userData?["userId"])
                        .isEmpty,
                    child: const Expanded(child: Nodatafound())),
                Expanded(
                    child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: ctrl.users
                            .where(
                                (ele) => ele.userId != ctrl.userData?["userId"])
                            .length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: checkscreenwidth(
                                        genratemediaquery(context)
                                            .size
                                            .width) ==
                                    "Small"
                                ? 1
                                : checkscreenwidth(genratemediaquery(context)
                                            .size
                                            .width) ==
                                        "Medium"
                                    ? 2
                                    : 3,
                            childAspectRatio: 2.5),
                        itemBuilder: (_, i) {
                          final data = ctrl.users
                              .where((ele) =>
                                  ele.userId != ctrl.userData?["userId"])
                              .toList()[i];
                          return Card(
                            surfaceTintColor: scaffoldbgcol,
                            color: scaffoldbgcol,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        networkImages(
                                          url: data.image == null ||
                                                  data.image == ""
                                              ? avtharimg
                                              : "${asseturl}Users/${data.image}",
                                          size: 80.0,
                                        ),
                                        appspace(w: 10),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Apptextwidget(
                                                  "${data.firstName} ${data.lastName}",
                                                  style: TxtStls.stl15,
                                                ),
                                                Apptextwidget(
                                                  ctrl.rolelist
                                                          .where((ele) =>
                                                              ele.roleId ==
                                                              data.roleId)
                                                          .single
                                                          .roleName ??
                                                      "",
                                                  style: TxtStls.stl13,
                                                ),
                                                Apptextwidget(
                                                  data.email ?? "",
                                                  style: TxtStls.stl13,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  //  maxLines: 1,
                                                ),
                                                Apptextwidget(
                                                  data.gender ?? "",
                                                  style: TxtStls.stl13,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible:data.roleId!=1,
                                    child: IconButton(
                                      onPressed: () {
                                        ctrl.chngeuserid(data.userId);
                                        ctrl.assignmanualdata(data);
                                        navigationSlide(context, const Useradd());
                                      },
                                      icon: const Icon(Icons.edit_note),
                                    ),
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
