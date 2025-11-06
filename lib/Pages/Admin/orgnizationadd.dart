// ignore_for_file: use_build_context_synchronously

import 'package:XLcarez/env/appexports.dart';

class Orgnizationadd extends StatefulWidget {
  const Orgnizationadd({super.key});

  @override
  State<Orgnizationadd> createState() => _OrgnizationaddState();
}

class _OrgnizationaddState extends State<Orgnizationadd> {
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer<Authcontroller>(builder: (_, ctrl, child) {
        return Scaffold(
          appBar: Themeappbar(
            title:
                "${ctrl.organisationmodel.organizationId == 0 ? fetchlocale(context).add : fetchlocale(context).edit} ${fetchlocale(context).organizatione}",
            leading: true,
          ),
          body: SizedBox(
            height: genratemediaquery(context).size.height,
            width: genratemediaquery(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: key,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Apptextwidget(
                          fetchlocale(context).organizationname,
                          style: TxtStls.wstl14,
                        ),
                        textfiled(
                            controller: ctrl.organisationmodel.organizationName,
                            errortext: fetchlocale(context).organizationname,
                            hintText: fetchlocale(context).enteroganame),
                        appspace(h: 10),
                        Apptextwidget(
                          fetchlocale(context).shornamee,
                          style: TxtStls.wstl14,
                        ),
                        textfiled(
                            controller: ctrl.organisationmodel.shortName,
                            errortext: fetchlocale(context).shornamee,
                            hintText: fetchlocale(context).entershortname),
                        appspace(h: 10),
                        Apptextwidget(
                          fetchlocale(context).scan,
                          style: TxtStls.wstl14,
                        ),
                        textfiled(
                            controller: ctrl.organisationmodel.scanLimit,
                            errortext: fetchlocale(context).scan,
                            hintText: fetchlocale(context).scan),
                        appspace(h: 10),
                        Apptextwidget(
                          fetchlocale(context).totalscanse,
                          style: TxtStls.wstl14,
                        ),
                        textfiled(
                            controller: ctrl.organisationmodel.orgTotalScans,
                            errortext: fetchlocale(context).totalscanse,
                            hintText: fetchlocale(context).totalscanse),
                        Visibility(
                            visible: ctrl.organisationmodel.organizationId != 0,
                            child: appspace(h: 10)),
                        Visibility(
                            visible: ctrl.organisationmodel.organizationId != 0,
                            child: Apptextwidget(
                              fetchlocale(context).orgcodee,
                              style: TxtStls.wstl14,
                            )),
                        Visibility(
                          visible: ctrl.organisationmodel.organizationId != 0,
                          child: redayonlyfield(
                              readOnly: true,
                              controller: TextEditingController(
                                  text: ctrl.organisationmodel.orgCode ?? ""),
                              errortext: fetchlocale(context).orgcodee,
                              hintText: fetchlocale(context).orgcodee),
                        ),
                        appspace(h: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                                visible:
                                    ctrl.organisationmodel.organizationId !=
                                            0 &&
                                        ctrl.organisationmodel.organizationId !=
                                            null,
                                child: ElevatedButton.icon(
                                    onPressed: () {
                                      ctrl.changeorganzation(
                                          Organisationmodel.fromJson({
                                        'organizationId': 0,
                                        'scanLimit': 0,
                                        "orgTotalScans": 1
                                      }));
                                    },
                                    icon: const Icon(
                                      Icons.clear,
                                      color: scaffoldbgcol,
                                    ),
                                    label: Apptextwidget(
                                      fetchlocale(context).cleare,
                                      style: TxtStls.wstl12,
                                    ))),
                            ElevatedButton.icon(
                                onPressed: () {
                                  if (key.currentState!.validate()) {
                                    ctrl.saveorganization().whenComplete(() {
                                      Navigator.pop(context);
                                    });
                                  }
                                },
                                icon: Icon(
                                  ctrl.organisationmodel.organizationId ==
                                              null ||
                                          ctrl.organisationmodel
                                                  .organizationId ==
                                              0
                                      ? Icons.add
                                      : Icons.edit,
                                  color: scaffoldbgcol,
                                ),
                                label: Apptextwidget(
                                  fetchlocale(context).organizatione,
                                  style: TxtStls.wstl13,
                                )),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        );
      }),
    );
  }
}
