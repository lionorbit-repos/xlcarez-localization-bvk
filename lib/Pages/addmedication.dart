// ignore_for_file: use_build_context_synchronously

import 'package:XLcarez/env/appexports.dart';

class Addmedication extends StatefulWidget {
  const Addmedication({super.key});

  @override
  State<Addmedication> createState() => _AddmedicationState();
}

class _AddmedicationState extends State<Addmedication> {
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer3<Medicationcontroller, Authcontroller,
              Appointmentcontroller>(
          builder: (context, ctrl, auth, aptctrl, child) {
        return Scaffold(
          appBar: Themeappbar(
            title:
                "${ctrl.medication.medicationId != 0 ? "Edit" : "Add"} Medication",
            leading: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ctrl.savemedicationload ? loader() : const SizedBox.shrink(),
                  nameField(
                    controller: ctrl.medication.medicineName,
                    labelText: fetchlocale(context).mediname,
                    //col: scaffoldbgcol,
                    hintText:
                        "${fetchlocale(context).enter} ${fetchlocale(context).mediname}",
                  ),
                  appspace(h: 10),
                  DropdownButtonFormField2(
                      decoration: inputDecoration(),
                      validator: (val) {
                        if (val == null || val == "") {
                          return "${fetchlocale(context).days} is cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      hint: Apptextwidget(
                        "${fetchlocale(context).selecte} ${fetchlocale(context).days}",
                        style: TxtStls.hintStl,
                      ),
                      dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10))),
                      value: ctrl.checkfrequecny(ctrl.medication.days),
                      items: ctrl.frequencylist
                          .map((e) => DropdownMenuItem(
                              value: e, child: Apptextwidget(e)))
                          .toList(),
                      onChanged: (val) {
                        ctrl.changefrequency(val);
                      }),
                  // textfiled(
                  //   controller: ctrl.medication.dosage,
                  //  // col: scaffoldbgcol,
                  //   labelText: fetchlocale(context).dosage,
                  //   hintText: "${fetchlocale(context).enter} ${fetchlocale(context).dosage}",
                  // ),
                  appspace(h: 10),
                  // textfiled(
                  //   //maxLength: 3,
                  //  // col: scaffoldbgcol,
                  //   controller: ctrl.medication.days,
                  //   labelText: fetchlocale(context).duration,
                  //   hintText: "${fetchlocale(context).enter} ${fetchlocale(context).duration}",
                  // ),
                  DropdownButtonFormField2(
                      decoration: inputDecoration(),
                      validator: (val) {
                        if (val == null || val == "") {
                          return "${fetchlocale(context).dosage} is cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      hint: Apptextwidget(
                        "${fetchlocale(context).selecte} ${fetchlocale(context).dosage}",
                        style: TxtStls.hintStl,
                      ),
                      dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10))),
                      value: ctrl.checkdosage(ctrl.medication.dosage),
                      items: ctrl.dosagelist
                          .map((e) => DropdownMenuItem(
                              value: e, child: Apptextwidget(e)))
                          .toList(),
                      onChanged: (val) {
                        ctrl.changedosage(val);
                      }),
                  appspace(h: 20),
                  fillButton(context,
                      load: ctrl.savemedicationload,
                      title: fetchlocale(context).save, onTap: () async {
                    if (key.currentState!.validate()) {
                      Medication mymedication = ctrl.medication;
                      mymedication.addedBy = await auth.fethuserid();
                      mymedication.userId = aptctrl.appointmentmodel?.patientId;
                      mymedication.appointmentId =
                          aptctrl.appointmentmodel?.appointmentId;
                      Navigator.pop(context);
                      ctrl
                          .savemedication(mjson: mymedication.toJson())
                          .whenComplete(() {
                        ctrl
                            .getmedications(
                                id: aptctrl.appointmentmodel?.appointmentId)
                            .whenComplete(() {
                          ctrl.resetmedication();
                        });
                      });
                      // log(mymedication.toJson().toString());
                    }
                  })
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
