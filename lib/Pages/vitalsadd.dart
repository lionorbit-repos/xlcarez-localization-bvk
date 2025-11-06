// ignore_for_file: use_build_context_synchronously
import 'package:XLcarez/env/appexports.dart';
import 'package:flutter/cupertino.dart';

class VitalsAdd extends StatefulWidget {
  const VitalsAdd({super.key});

  @override
  State<VitalsAdd> createState() => _VitalsAddState();
}

class _VitalsAddState extends State<VitalsAdd> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      final auth = Provider.of<Authcontroller>(context, listen: false);
      final vital = Provider.of<Vitalscontroller>(context, listen: false);
      vital.clearmanuldata();
      auth.assigndata();
      vital.heightcontroller = auth.heightController;
      vital.weightcontroller = auth.weightconteoller;
      vital.bmicontroller = TextEditingController.fromValue(TextEditingValue(
          text: calculateBmi(
              userheight: auth.heightController.text,
              userweight: auth.weightconteoller.text)));
      setState(() {});
    });
    super.initState();
  }

  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer2<Vitalscontroller, Authcontroller>(
          builder: (context, ctrl, auth, child) {
        return Scaffold(
            appBar: Themeappbar(
              title: fetchlocale(context).advitals,
              centtile: true,
              leading: true,
              act: [
                CupertinoButton(
                    child: Apptextwidget(
                      fetchlocale(context).save,
                      style: TxtStls.wstl14,
                    ),
                    onPressed: () async {
                      if (key.currentState!.validate()) {
                        var vjon = {
                          "vitalsId": 0,
                          "userId": await auth.fethuserid(),
                          "pulseRate": ctrl.pulserate.text,
                          "respirationRate": ctrl.respirationrate.text,
                          "oxygenSaturation": ctrl.spo2.text,
                          "bloodPressure":
                              "${ctrl.bloodpressuresystolic.text}/${ctrl.bloodpressurediastolic.text}",
                          "bmi": ctrl.bmicontroller.text,
                          "weight": ctrl.weightcontroller.text,
                          "height": ctrl.heightcontroller.text,
                          "temparature": ctrl.temprature.text,
                          "sugar": ctrl.sugar.text,
                          "cholesterol": ctrl.cholestral.text,
                          "recordType": "Manual",
                          "Country": null,
                          "addedBy": await auth.fethuserid(),
                        };
                        //log(vjon.toString());
                        ctrl.savevitals(vjson: vjon).whenComplete(() async {
                          ctrl.getallvitalslist(id: await auth.fethuserid());
                          Navigator.pop(context);
                          ctrl.clearmanuldata();
                        });
                      }
                    })
              ],
            ),
            body: ctrl.saveload
                ? loader()
                : Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: key,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          addvitalcard(
                              len: 5,
                              title: fetchlocale(context).hgt,
                              hintText: fetchlocale(context).enterheight,
                              formatter: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d*\.?\d*')),
                              ],
                              controller: ctrl.heightcontroller,
                              chnage: (val) {
                                ctrl.bmicontroller.text = calculateBmi(
                                    userheight: ctrl.heightcontroller.text,
                                    userweight: ctrl.weightcontroller.text);
                              }),
                          addvitalcard(
                              len: 5,
                              title: fetchlocale(context).wgt,
                              hintText: fetchlocale(context).enterweiht,
                              valida: (weight) {
                                if (weight!.isEmpty) {
                                  return "";
                                } else if (double.parse(weight) < 40 ||
                                    double.parse(weight) > 150) {
                                  return fetchlocale(context).weightkgshouldbe;
                                } else {
                                  return null;
                                }
                              },
                              formatter: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d*\.?\d*')),
                              ],
                              controller: ctrl.weightcontroller,
                              chnage: (val) {
                                ctrl.bmicontroller.text = calculateBmi(
                                    userheight: ctrl.heightcontroller.text,
                                    userweight: ctrl.weightcontroller.text);
                              }),
                          addvitalcard(
                            enabled: false,
                            title: fetchlocale(context).bmi,
                            formatter: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*')),
                            ],
                            controller: ctrl.bmicontroller,
                          ),
                          addvitalcard(
                            len: 6,
                            //w: ctrl.temprature.text.isEmpty ? 150.0 : null,
                            title: fetchlocale(context).temperateuree,
                            hintText:fetchlocale(context).entertemprature,
                            formatter: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*')),
                            ],
                            controller: ctrl.temprature,
                          ),
                          addvitalcard(
                            len: 3,
                            //w: ctrl.spo2.text.isEmpty ? 150.0 : null,
                            title: "SpO\u2082",
                            hintText: "${fetchlocale(context).enter} SpO\u2082",
                            formatter: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*')),
                            ],
                            controller: ctrl.spo2,
                          ),
                          addvitalcard(
                            len: 3,
                            //w: ctrl.pulserate.text.isEmpty ? 150.0 : null,
                            title: fetchlocale(context).pulseratee,
                            hintText: fetchlocale(context).enterpulserate,
                            formatter: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*')),
                            ],
                            controller: ctrl.pulserate,
                          ),
                          addvitalcard(
                            len: 3,
                            //w: ctrl.cholestral.text.isEmpty ? 150.0 : null,
                            title: fetchlocale(context).cholesterole,
                            hintText: fetchlocale(context).entercholesterol,
                            formatter: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*')),
                            ],
                            controller: ctrl.cholestral,
                          ),
                          addvitalcard(
                            len: 3,
                            //w: ctrl.sugar.text.isEmpty ? 150.0 : null,
                            title: fetchlocale(context).sugare,
                            hintText: fetchlocale(context).entersugar,
                            formatter: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*')),
                            ],
                            controller: ctrl.sugar,
                          ),
                          addvitalcard(
                            len: 3,
                            //w: ctrl.respirationrate.text.isEmpty ? 180.0 : null,
                            title: fetchlocale(context).resperationrate,
                            hintText: fetchlocale(context).enterresperationrate,
                            formatter: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*')),
                            ],
                            controller: ctrl.respirationrate,
                          ),
                          addvitalcard(
                            len: 3,
                            // w: ctrl.bloodpressuresystolic.text.isEmpty
                            //     ? 150.0
                            //     : null,
                            title: fetchlocale(context).systolice,
                            hintText: fetchlocale(context).entersystalic,
                            formatter: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*')),
                            ],
                            controller: ctrl.bloodpressuresystolic,
                          ),
                          addvitalcard(
                            len: 3,
                            // w: ctrl.bloodpressurediastolic.text.isEmpty
                            //     ? 150.0
                            //     : null,
                            title: fetchlocale(context).diastolic,
                            trigger: TextInputAction.done,
                            hintText: fetchlocale(context).enterdiastoli,
                            formatter: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*')),
                            ],
                            controller: ctrl.bloodpressurediastolic,
                          ),
                        ],
                      ),
                    )

                    // bottomNavigationBar: bottomContainer(
                    //     child: fillButton(context, load: ctrl.saveload, title: "Submit",
                    //         onTap: () async {
                    //   if (key.currentState!.validate()) {
                    //     var vjon = {
                    //       "vitalsId": 0,
                    //       "userId": await auth.fethuserid(),
                    //       "pulseRate": ctrl.pulserate.text,
                    //       "respirationRate": ctrl.respirationrate.text,
                    //       "oxygenSaturation": ctrl.spo2.text,
                    //       "bloodPressure": "${ctrl.bloodpressuresystolic.text}/${ctrl.bloodpressurediastolic.text}",
                    //       "bmi": ctrl.bmicontroller.text,
                    //       "weight": ctrl.weightcontroller.text,
                    //       "height": ctrl.heightcontroller.text,
                    //       "temparature": ctrl.temprature.text,
                    //       "sugar": ctrl.sugar.text,
                    //       "cholesterol": ctrl.cholestral.text,
                    //       "recordType": "Manual",
                    //       "Country": null,
                    //       "addedBy": await auth.fethuserid(),
                    //     };
                    //     ctrl.savevitals(vjson: vjon).whenComplete(()async{
                    //       ctrl.getallvitalslist(id: await auth.fethuserid());
                    //       ctrl.clearmanuldata();
                    //       Navigator.pop(context);
                    //     });
                    //   }
                    // })),
                    ));
      }),
    );
  }
}

//ravindra Widget
Widget addvitalcard(
    {context,
    title,
    w,
    formatter,
    controller,
    trigger,
    valida,
    hintText,
    chnage,
    len,
    enabled}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
    child: Card(
      color: scaffoldbgcol,
      //color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Apptextwidget(
                title ?? "",
                style: TxtStls.cardlable,
              ),
              SizedBox(
                  width: w ?? 110,
                  child: customtextfiled(
                    controller: controller,
                    change: chnage,
                    validator: valida,
                    maxlen: len,
                    //labelText: label,
                    hintText: hintText,
                    trigger: trigger,
                    formatter: formatter,
                    enabled: enabled,
                  )),
            ],
          ),
        ),
      ),
    ),
  );
}
//ravindra Widget

/*
SingleChildScrollView(
            child: Column(
              children: [
                vitalfield(
                    controller1: ctrl.heightcontroller,
                    controller2: ctrl.weightcontroller,
                    title1: "Height",
                    title2: "Weight",
                    c1: (val) {
                      ctrl.bmicontroller.text = calculateBmi(
                          userheight: ctrl.heightcontroller.text,
                          userweight: ctrl.weightcontroller.text);
                    },
                    c2: (val) {
                      ctrl.bmicontroller.text = calculateBmi(
                          userheight: ctrl.heightcontroller.text,
                          userweight: ctrl.weightcontroller.text);
                    }),
                vitalfield(
                    controller1: ctrl.bmicontroller,
                    controller2: ctrl.temprature,
                    title1: "BMI",
                    title2: "Temperature",
                    enabled1: false),
                vitalfield(
                    controller1: ctrl.spo2,
                    controller2: ctrl.pulserate,
                    title1: "Spo2",
                    title2: "Pulse rate"),
                vitalfield(
                    controller1: ctrl.cholestral,
                    controller2: ctrl.sugar,
                    title1: "Cholesterol",
                    title2: "Sugar"),
                vitalfield(
                    controller1: ctrl.respirationrate,
                    controller2: TextEditingController(),
                    title1: "Respiration rate",
                    title2: "",
                    t2: TextInputAction.done),
                    vitalfield(
                    controller1: ctrl.bloodpressuresystolic,
                    controller2: ctrl.bloodpressurediastolic,
                    title1: "Systolic",
                    title2: "Diastolic",
                    t2: TextInputAction.done),
              ],
            ),
          ),
*/
