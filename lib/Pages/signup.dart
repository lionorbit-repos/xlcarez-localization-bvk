// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:XLcarez/env/appexports.dart';
import 'package:flutter/cupertino.dart';

class Signup extends StatefulWidget {
  var id;
  bool isfirstime;
  Signup({super.key, this.id, this.isfirstime = false});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  List<bool> isgenderselected = [false, false];
  bool isVisible = true;
  //int isshowdailogfirstime = 0;
  final key = GlobalKey<FormState>();
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      final auth = Provider.of<Authcontroller>(context, listen: false);
      if (widget.isfirstime) {
        auth.getbyid().whenComplete(() {
          var gender = auth.userData?["gender"];
          if (gender != null) {
            if (gender == "Male") {
              isgenderselected = [true, false];
            } else {
              isgenderselected = [false, true];
            }
          } else {
            isgenderselected = [false, false];
          }
          setState(() {});
        });
        //auth.reset();
      } else if (widget.id == null) {
        auth.reset();
      } else {
        var gender = auth.userData?["gender"];
        if (gender != null) {
          if (gender == "Male") {
            isgenderselected = [true, false];
          } else {
            isgenderselected = [false, true];
          }
        } else {
          isgenderselected = [false, false];
        }
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
        child: Consumer<Authcontroller>(builder: (context, ctrl, child) {
      return Scaffold(
          appBar: Themeappbar(
            leading: true,
            lead: IconButton(
                onPressed: () {
                  if (widget.isfirstime) {
                    showAdaptiveDialog(
                        context: context,
                        builder: (_) {
                          return appdailog(context,
                              alert: Apptextwidget(fetchlocale(context).alert),
                              content: Apptextwidget(
                                  fetchlocale(context).complete_profile),
                              actionno: () {
                            Navigator.pop(context);
                          }, actionsyes: () {
                            var ujson = {
                              "userId": widget.id,
                              "firstName": ctrl.firstnamecontroller.text,
                              "lastName": "",
                              "email": ctrl.emailcontroller.text,
                              "phone": "",
                              "roleId": 5,
                              "status": "Active",
                              //"createdBy": 0,
                              "organizationId": ctrl.currentorganization,
                              "isProfileCompleted": 1,
                              "image": "",
                              "gender": null,
                              "dob": "",
                              "consentName":
                                  "${ctrl.firstnamecontroller.text} ${ctrl.lastnamecontroller.text}",
                              "height": "",
                              "weight": "",
                              "isdCode": null,
                            };
                            //log(ujson.toString());
                            ctrl.signup(context,
                                endpoint: "User/Save",
                                rjson: ujson,
                                isfirttime: widget.isfirstime);
                          });
                        });
                  } else {
                    Navigator.pop(context);
                    ctrl.assigndata();
                  }
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: scaffoldbgcol,
                )),
            title: fetchlocale(context).personaldetails,
            centtile: true,
            act: [
              CupertinoButton(
                  child: Apptextwidget(fetchlocale(context).save,
                      style: TxtStls.wstl14),
                  onPressed: () {
                    final error =
                        validateHeightFeetAndInches(ctrl.feet, ctrl.inch);
                    if (error != null) {
                      Fluttertoast.showToast(
                        msg: fetchlocale(context).heightmax,
                      );
                    } else {
                      if (key.currentState!.validate() && ctrl.gender != null) {
                        var heightincms = calculateHeight(
                            val: "${ctrl.feet}.${ctrl.inch}",
                            inputForm: "feet/inch",
                            outputForm: "cms");
                        var weightinkg = calculateWeight(
                            val: ctrl.weightconteollerlbs.text,
                            inputForm: "lb",
                            outputForm: "kg");
                        var ujson = {
                          "userId": widget.id,
                          "firstName": ctrl.firstnamecontroller.text,
                          "lastName": ctrl.lastnamecontroller.text,
                          "email": ctrl.emailcontroller.text,
                          "phone": ctrl.phonecontroller.text,
                          "roleId": 5,
                          "weightUnit": ctrl.merticweight,
                          "heightUnit": ctrl.metricheight,
                          "metricWeight": ctrl.weightconteollerlbs.text,
                          "metricHeight": ctrl.feet == null && ctrl.inch == null
                              ? null
                              : "${ctrl.feet}.${ctrl.inch}",
                          "status": "Active",
                          //"createdBy": 0,
                          "organizationId": ctrl.currentorganization,
                          "gender": ctrl.gender,
                          "dob": webdateformat(ctrl.dobcontroller),
                          "isProfileCompleted": 1,
                          "consentName":
                              "${ctrl.firstnamecontroller.text} ${ctrl.lastnamecontroller.text}",
                          "height": ctrl.heightController.text.isEmpty
                              ? heightincms
                              : ctrl.heightController.text,
                          "weight": ctrl.weightconteoller.text.isEmpty
                              ? weightinkg
                              : ctrl.weightconteoller.text,
                          "isdCode": ctrl.dailcode?.dialCode ?? "+1",
                          "isoCode": ctrl.dailcode?.code ?? "US",
                        };
                        //log(ujson.toString());
                        ctrl.signup(context,
                            endpoint: "User/Save",
                            rjson: ujson,
                            isfirttime: widget.isfirstime);
                      }
                    }
                  })
            ],
          ),
          body: ctrl.isload
              ? loader()
              : Form(
                  key: key,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        profiledata(
                            title: fetchlocale(context).firstnamee,
                            child: nameField(
                              err: "",
                              decoration: inputDecorationnoborder(
                                col: Colors.transparent,
                                hintText: fetchlocale(context).enteryournamee,
                              ),
                              controller: ctrl.firstnamecontroller,
                            )),
                        profiledata(
                            title: fetchlocale(context).lastnamee,
                            child: nameField(
                              err: "",
                              decoration: inputDecorationnoborder(
                                col: Colors.transparent,
                                hintText:
                                    fetchlocale(context).enteryourlastname,
                              ),
                              controller: ctrl.lastnamecontroller,
                            )),
                        profiledata(
                          title: "Dial code",
                          w: 150.0,
                          child: CountryDialCodePicker(
                            initialSelection: ctrl.dailcode?.code ?? "US",
                            flagImageSettings: FlagImageSettings(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            bottomSheetSettings: BottomSheetSettings(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              searchTextStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: BoxDecoration(
                                color: scaffoldbgcol,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                            onChanged: (value) {
                              ctrl.chnagedailcode(value);
                            },
                          ),
                        ),
                        profiledata(
                            title: fetchlocale(context).phonee,
                            child: phoneField(
                              maxlen: checkmaxlengthforcodes(
                                  code: ctrl.dailcode?.code),
                              formmater: [
                                LengthLimitingTextInputFormatter(
                                    checkmaxlengthforcodes(
                                        code: ctrl.dailcode?.code)),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              err: fetchlocale(context).phonee,
                              decoration: inputDecorationnoborder(
                                col: Colors.transparent,
                                hintText:
                                    fetchlocale(context).enteryourphonenumber,
                              ),
                              controller: ctrl.phonecontroller,
                            )),
                        profiledata(
                            w: 150.0,
                            title: fetchlocale(context).emaie,
                            child: emailField(
                              decoration: inputDecorationnoborder(
                                col: Colors.transparent,
                                hintText: fetchlocale(context).enteryourmail,
                              ),
                              controller: ctrl.emailcontroller,
                            )),
                        profiledata(
                            title: fetchlocale(context).dobe,
                            child: dobField(
                              context,
                              controller1: ctrl.ageconteoller,
                              decoration: inputDecorationnoborder(
                                col: Colors.transparent,
                                hintText: fetchlocale(context).enteryourdob,
                              ),
                              controller: ctrl.dobcontroller,
                            )),
                        profiledata(
                            title: fetchlocale(context).agee,
                            child: Appscalemedia(
                              child: ageField(
                                err: fetchlocale(context).agee,
                                maxLength: 2,
                                decoration: inputDecorationnoborder(
                                  col: Colors.transparent,
                                  hintText: fetchlocale(context).picupyourdate,
                                ),
                                controller: ctrl.ageconteoller,
                              ),
                            )),
                        profiledata(
                            w: 160.0,
                            title: fetchlocale(context).gendere,
                            child: Appscalemedia(
                                child: toggle(context,
                                    titl1: fetchlocale(context).malee,
                                    title2: fetchlocale(context).femalee,
                                    isSelected: isgenderselected, tap: (val) {
                              setState(() {
                                for (int index = 0;
                                    index < isgenderselected.length;
                                    index++) {
                                  if (index == val) {
                                    isgenderselected[index] = true;
                                  } else {
                                    isgenderselected[index] = false;
                                  }
                                }
                              });
                              ctrl.updateGender(
                                  value: val == 0 ? "Male" : "Female");
                            }))),
                        profiledata(
                            iscou: true,
                            titlew: Row(
                              children: [
                                Apptextwidget(
                                  ctrl.merticweight == "kg"
                                      ? fetchlocale(context).wgtin
                                      : fetchlocale(context).wgtinlb,
                                  style: TxtStls.cardlable,
                                ),
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return appdailog(context,
                                                ationtitleyes:
                                                    fetchlocale(context).ok,
                                                actionsyes: () {
                                              Navigator.pop(context);
                                            },
                                                alert: Apptextwidget(
                                                    fetchlocale(context).alert),
                                                content: Column(
                                                  children: [
                                                    Apptextwidget(
                                                      fetcherrortext(
                                                        context,
                                                        "Weight in kg should be within the range of 40 to 150 kg",
                                                      ),
                                                      style: TxtStls.stl14,
                                                    ),
                                                    Apptextwidget(
                                                      fetcherrortext(context,
                                                          "Weight in lbs should be within the range of 88 to 330 lbs"),
                                                      style: TxtStls.stl14,
                                                    ),
                                                  ],
                                                ));
                                          });
                                    },
                                    icon: const Icon(Icons.info))
                              ],
                            ),
                            title: ctrl.merticweight == "kg"
                                ? fetchlocale(context).wgtin
                                : fetchlocale(context).wgtinlb,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: weightField(
                                    context,
                                    unit: ctrl.merticweight,
                                    labelText: "",
                                    hintText: fetchlocale(context).nterweight,
                                    maxLength: 5,
                                    decoration: inputDecorationnoborder(
                                      col: Colors.transparent,
                                      hintText: fetchlocale(context).nterweight,
                                    ),
                                    controller: ctrl.merticweight == "kg"
                                        ? ctrl.weightconteoller
                                        : ctrl.weightconteollerlbs,
                                  ),
                                ),
                                appspace(w: 5),
                                Expanded(
                                    child: dropdowndynamic(
                                        onchnage: (val) {
                                          ctrl.changeweight(val: val);
                                        },
                                        hint: fetchlocale(context).selecte,
                                        val: ctrl.merticweight,
                                        list: ["kg", "lb"]
                                            .map((k) => DropdownMenuItem(
                                                value: k,
                                                child: Apptextwidget(
                                                  k,
                                                  style: TxtStls.stl13,
                                                )))
                                            .toList()))
                              ],
                            )),
                        profiledata(
                            iscou: true,
                            titlew: Row(
                              children: [
                                Apptextwidget(
                                  ctrl.metricheight == "cms"
                                      ? fetchlocale(context).hgt
                                      : fetchlocale(context).hgtf,
                                  style: TxtStls.cardlable,
                                ),
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return appdailog(context,
                                                ationtitleyes:
                                                    fetchlocale(context).ok,
                                                actionsyes: () {
                                              Navigator.pop(context);
                                            },
                                                alert: Apptextwidget(
                                                    fetchlocale(context).alert),
                                                content: Apptextwidget(
                                                  fetchlocale(context)
                                                      .heightmax,
                                                  style: TxtStls.stl14,
                                                ));
                                          });
                                    },
                                    icon: const Icon(Icons.info))
                              ],
                            ),
                            title: ctrl.metricheight == "cms"
                                ? fetchlocale(context).hgt
                                : fetchlocale(context).hgtf,
                            child: ctrl.metricheight == "cms"
                                ? Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: heightField(
                                            context,
                                            labelText:
                                                fetchlocale(context).hgtin,
                                            hintText: fetchlocale(context)
                                                .neterheight,
                                            maxLength: 5,
                                            decoration: inputDecorationnoborder(
                                              col: Colors.transparent,
                                              hintText: fetchlocale(context)
                                                  .neterheight,
                                            ),
                                            controller: ctrl.heightController,
                                          )),
                                      appspace(w: 5),
                                      Expanded(
                                          child: dropdowndynamic(
                                              onchnage: (val) {
                                                ctrl.changeheight(val: val);
                                              },
                                              hint:
                                                  fetchlocale(context).selecte,
                                              val: ctrl.metricheight,
                                              list: ["cms", "feet/inch"]
                                                  .map((k) => DropdownMenuItem(
                                                      value: k,
                                                      child: Apptextwidget(
                                                        k,
                                                        style: TxtStls.stl13,
                                                      )))
                                                  .toList()))
                                    ],
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Apptextwidget(
                                                  fetchlocale(context).feet,
                                                  style: TxtStls.stl13,
                                                ),
                                                dropdowndynamic(
                                                    validatemode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    validate: false,
                                                    onchnage: (val) {
                                                      ctrl.changefeet(val);
                                                    },
                                                    hint: fetchlocale(context)
                                                        .selecte,
                                                    val: ctrl.feet,
                                                    list: [
                                                      "1",
                                                      "2",
                                                      "3",
                                                      "4",
                                                      "5",
                                                      "6",
                                                      "7",
                                                      "8"
                                                    ]
                                                        .map((k) =>
                                                            DropdownMenuItem(
                                                                value: k,
                                                                child:
                                                                    Apptextwidget(
                                                                  k,
                                                                  style: TxtStls
                                                                      .stl13,
                                                                )))
                                                        .toList()),
                                              ],
                                            ),
                                          ),
                                          appspace(w: 2),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Apptextwidget(
                                                  fetchlocale(context).inch,
                                                  style: TxtStls.stl13,
                                                ),
                                                dropdowndynamic(
                                                    validatemode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    validate: false,
                                                    onchnage: (val) {
                                                      ctrl.changeinchec(val);
                                                    },
                                                    hint: fetchlocale(context)
                                                        .selecte,
                                                    val: ctrl.inch,
                                                    list: [
                                                      "0",
                                                      "1",
                                                      "2",
                                                      "3",
                                                      "4",
                                                      "5",
                                                      "6",
                                                      "7",
                                                      "8",
                                                      "9",
                                                      "10",
                                                      "11",
                                                      "12",
                                                    ]
                                                        .map((k) =>
                                                            DropdownMenuItem(
                                                                value: k,
                                                                child:
                                                                    Apptextwidget(
                                                                  k,
                                                                  style: TxtStls
                                                                      .stl13,
                                                                )))
                                                        .toList()),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      appspace(h: 5),
                                      dropdowndynamic(
                                          onchnage: (val) {
                                            ctrl.changeheight(val: val);
                                          },
                                          hint: fetchlocale(context).selecte,
                                          val: ctrl.metricheight,
                                          list: ["cms", "feet/inch"]
                                              .map((k) => DropdownMenuItem(
                                                  value: k,
                                                  child: Apptextwidget(
                                                    k,
                                                    style: TxtStls.stl13,
                                                  )))
                                              .toList())
                                    ],
                                  )),
                        appspace(h: 20),
                      ],
                    ),
                  )));
    }));
  }
}

//ravindra Widget
Widget profiledata({context, title, child, titlew, w, iscou = false}) {
  return Card(
    color: scaffoldbgcol,
    //color: Colors.transparent,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: iscou
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titlew ??
                    Apptextwidget(
                      title,
                      style: TxtStls.cardlable,
                    ),
                appspace(h: 5),
                child
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Apptextwidget(
                  title,
                  style: TxtStls.cardlable,
                ),
                SizedBox(width: w ?? 120, child: child)
              ],
            ),
    ),
  );
}
//ravindra Widget
