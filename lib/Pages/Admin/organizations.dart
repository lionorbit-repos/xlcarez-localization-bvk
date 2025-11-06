// ignore_for_file: prefer_is_empty

import 'package:XLcarez/env/appexports.dart';

class OrganizationsView extends StatefulWidget {
  const OrganizationsView({super.key});

  @override
  State<OrganizationsView> createState() => _OrganizationsViewState();
}

class _OrganizationsViewState extends State<OrganizationsView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Authcontroller>(builder: (_, ctrl, child) {
      return Scaffold(
        appBar: Themeappbar(
          title: fetchlocale(context).organizatione,
          leading: false,
          act: [
            IconButton(
                onPressed: () {
                  navigationSlide(context, const Orgnizationadd());
                   ctrl.changeorganzation(Organisationmodel.fromJson({'organizationId':0,'scanLimit':0,"orgTotalScans":1}));
                },
                icon: const Icon(
                  Icons.add,
                  color: scaffoldbgcol,
                ))
          ],
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              ctrl.getorganizations();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Apptextwidget(fetchlocale(context).organizationname,style: TxtStls.wstl14,),
                  // textfiled(
                  //     controller: ctrl.organisationmodel.organizationName,
                  //     errortext: fetchlocale(context).organizationname,
                  //     hintText: fetchlocale(context).enteroganame),
                  // appspace(h: 10),
                  // Apptextwidget(fetchlocale(context).shornamee,style: TxtStls.wstl14,),
                  // textfiled(
                  //     controller: ctrl.organisationmodel.shortName,
                  //     errortext: fetchlocale(context).shornamee,
                  //     hintText: fetchlocale(context).entershortname),
                  // appspace(h: 10),
                  // Apptextwidget(fetchlocale(context).scan,style: TxtStls.wstl14,),
                  //  textfiled(
                  //     controller: ctrl.organisationmodel.scanLimit,
                  //     errortext: fetchlocale(context).scan,
                  //     hintText: fetchlocale(context).scan),
                  //     appspace(h: 10),
                  //  Apptextwidget("Total Scans",style: TxtStls.wstl14,),
                  // textfiled(
                  //     controller: ctrl.organisationmodel.orgTotalScans,
                  //     errortext: "Total Scans",
                  //     hintText: "Total Scans"),
                  // appspace(h: 10),
                  //  Apptextwidget("Org Code",style: TxtStls.wstl14,),
                  // Container(
                  //   height: 40,
                  //   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  //   width: genratemediaquery(context).size.width,
                  //   decoration: BoxDecoration(
                  //     color: scaffoldbgcol,
                  //     borderRadius: BorderRadius.circular(10)
                  //   ),
                  //   child: Apptextwidget(ctrl.organisationmodel.orgCode??"",style: TxtStls.stl13,),
                  // ),
                  // appspace(h: 10),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //   Visibility(visible: ctrl.organisationmodel.organizationId!=0&&ctrl.organisationmodel.organizationId!=null,child: ElevatedButton.icon(onPressed: (){
                  //     ctrl.changeorganzation(Organisationmodel.fromJson({'organizationId':0,'scanLimit':1,"orgTotalScans":1}));
                  //   }, icon: const Icon(Icons.clear,color: scaffoldbgcol,),label:  Apptextwidget("Clear",style: TxtStls.wstl12,))),
                  //     ElevatedButton.icon(
                  //         onPressed: () {
                  //           if (key.currentState!.validate()) {
                  //             ctrl.saveorganization();
                  //           }
                  //         },
                  //         icon: Icon(
                  //           ctrl.organisationmodel.organizationId == null ||
                  //                   ctrl.organisationmodel.organizationId == 0
                  //               ? Icons.add
                  //               : Icons.edit,
                  //           color: scaffoldbgcol,
                  //         ),
                  //         label: Apptextwidget(
                  //           fetchlocale(context).organizatione,
                  //           style: TxtStls.wstl13,
                  //         )),
                  //   ],
                  // ),
                  appspace(h: 10),
                  Visibility(visible: ctrl.organizationload, child: loader()),
                  ctrl.organizationlist.isEmpty
                      ? const Nodatafound()
                      : Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1, childAspectRatio: 4.5),
                              itemCount: ctrl.organizationlist.length,
                              itemBuilder: (_, i) {
                                final data = ctrl.organizationlist[i];
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
                                            CircleAvatar(
                                              child: Apptextwidget(data
                                                      .shortName?.text
                                                      .split("")[0] ??
                                                  "-"),
                                            ),
                                            appspace(w: 10),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 5),
                                              child: Apptextwidget(
                                                "${data.organizationName?.text}",
                                                style: TxtStls.stl15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                            child: IconButton(
                                                onPressed: () {
                                                  navigationSlide(context,
                                                      const Orgnizationadd());
                                                  ctrl.changeorganzation(data);
                                                },
                                                icon: const Icon(
                                                    Icons.edit_document))),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                ],
              ),
            )),
      );
    });
  }
}
