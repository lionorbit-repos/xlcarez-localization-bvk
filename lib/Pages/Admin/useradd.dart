import 'dart:developer';

import 'package:XLcarez/env/appexports.dart';
import 'package:flutter/cupertino.dart';

class Useradd extends StatefulWidget {
  const Useradd({super.key});

  @override
  State<Useradd> createState() => _UseraddState();  
}

class _UseraddState extends State<Useradd> {
  final key = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      var usrid = Provider.of<Authcontroller>(context, listen: false).userid;
      if (usrid == 0) {
        Provider.of<Authcontroller>(context, listen: false).clearmanuluser();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer<Authcontroller>(builder: (_, ctrl, child) {
        return Scaffold(
          appBar: Themeappbar(
            title:
                "${ctrl.userid == 0 ? fetchlocale(context).add : fetchlocale(context).edit} ${fetchlocale(context).usre}",
            leading: true,
            act: [
              CupertinoButton(
                  child: Apptextwidget(fetchlocale(context).save,
                      style: TxtStls.wstl14),
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      if (ctrl.consent) {
                        var ujson = {
                          "userId": ctrl.userid,
                          "firstName": ctrl.firstnamecontroller.text,
                          "lastName": ctrl.lastnamecontroller.text,
                          "email": ctrl.emailcontroller.text,
                          "phone": ctrl.phonecontroller.text,
                          "isdCode": ctrl.dailcode?.dialCode??"+1",
                          "roleId": ctrl.cureentroledid,
                          "orgCode":ctrl.orgcode,
                          "status": "Active",
                          "createdBy": ctrl.userData?["userId"],
                          "organizationId": ctrl.currentorganization,
                          "isProfileCompleted": 0,
                          "image": "",
                          "gender": null,
                          "dob": "",
                          "consentName":
                              "${ctrl.firstnamecontroller.text} ${ctrl.lastnamecontroller.text}",
                          "height": "",
                          "weight": "",
                        };
                        log(ujson.toString());
                        ctrl.signup(context,
                            endpoint: "User/Save",
                            rjson: ujson,
                            newuseradd: true);
                      } else {
                        Fluttertoast.showToast(
                            gravity: ToastGravity.TOP,
                            msg: fetchlocale(context).pleaseclickonthee);
                      }

                      // ctrl.signup(context,
                      //     endpoint: "User/Save",
                      //     rjson: ujson,
                      //     isfirttime: false);
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          profiledata(
                            w: 180.0,
                            title: fetchlocale(context).rolesw,
                            child: DropdownButtonFormField2(
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value == null ||
                                      (value is String && value.isEmpty)) {
                                    return fetchlocale(context)
                                        .pleaseselectrole;
                                  } else {
                                    return null;
                                  }
                                },
                                //underline: const SizedBox.shrink(),
                                hint: Apptextwidget(
                                  fetchlocale(context).selectrolese,
                                  //"${fetchlocale(context).selecte} ${fetchlocale(context).speciliaty}",
                                  style: TxtStls.hintStl,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                    maxHeight: 200,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                value: ctrl.cureentroledid,
                                items: ctrl.fetchlist()
                                    .map((e) => DropdownMenuItem(
                                        value: e.roleId,
                                        child: Apptextwidget(
                                          e.roleName ?? "",
                                          style: TxtStls.stl12,
                                        )))
                                    .toList(),
                                onChanged: (val) {
                                  ctrl.chnageroledid(val);
                                }),
                          ),
                          profiledata(
                            w: genratemediaquery(context).size.width/1.5,
                            title: fetchlocale(context).organizatione,
                            child: DropdownButtonFormField2(
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              // decoration: inputDecoration(),
                              validator: (value) {
                                if (value == null ||
                                    (value is String && value.isEmpty)) {
                                  return fetchlocale(context)
                                      .pleaseselectorganization;
                                } else {
                                  return null;
                                }
                              },
                              //underline: const SizedBox.shrink(),
                              hint: Apptextwidget(
                                fetchlocale(context).selectorganization,
                                //"${fetchlocale(context).selecte} ${fetchlocale(context).speciliaty}",
                                style: TxtStls.hintStl,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                  maxHeight: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10))),
                              value: ctrl.currentorganization,
                              items: ctrl.organizationlist
                                  .map((e) => DropdownMenuItem(
                                      value: e.organizationId,
                                      child: Apptextwidget(
                                        e.organizationName?.text ?? "",
                                        style: TxtStls.stl12,
                                        overflow: TextOverflow.ellipsis,
                                      )))
                                  .toList(),
                              onChanged: ctrl.userData?["roleId"] == 1
                                  ? (val) {
                                      ctrl.chnagecureentorganization(val);
                                    }
                                  : null,
                            ),
                          ),
                          profiledata(title: fetchlocale(context).orgcodee,child: textfiled(readOnly: true,controller: TextEditingController.fromValue(TextEditingValue(text: ctrl.orgcode??"")))),
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
                              w: 150.0,
                              title: fetchlocale(context).emaie,
                              child: emailField(
                                decoration: inputDecorationnoborder(
                                  col: Colors.transparent,
                                  hintText: fetchlocale(context).enteryourmail,
                                ),
                                controller: ctrl.emailcontroller,
                              )),
                          // profiledata(
                          //   title: fetchlocale(context).dialcodee,
                          //   w: 150.0,
                          //   child: CountryDialCodePicker(
                          //     initialSelection: ctrl.dailcode?.code ?? "US",
                          //     flagImageSettings: FlagImageSettings(
                          //       borderRadius: BorderRadius.circular(5.0),
                          //     ),
                          //     bottomSheetSettings: BottomSheetSettings(
                          //       textStyle: const TextStyle(
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //       searchTextStyle: const TextStyle(
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //       decoration: BoxDecoration(
                          //         color: scaffoldbgcol,
                          //         borderRadius: BorderRadius.circular(30.0),
                          //       ),
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(0.0),
                          //       ),
                          //     ),
                          //     onChanged: (value) {
                          //       ctrl.chnagedailcode(value);
                          //     },
                          //   ),
                          // ),
                          // profiledata(
                          //     title: fetchlocale(context).phonee,
                          //     child: phoneField(
                          //       maxlen: checkmaxlength(ctrl.dailcode?.dialCode),
                          //       formmater: [
                          //         LengthLimitingTextInputFormatter(
                          //             checkmaxlength(ctrl.dailcode?.dialCode)),
                          //         FilteringTextInputFormatter.digitsOnly
                          //       ],
                          //       err: fetchlocale(context).phonee,
                          //       decoration: inputDecorationnoborder(
                          //         col: Colors.transparent,
                          //         hintText:
                          //             fetchlocale(context).enteryourphonenumber,
                          //       ),
                          //       controller: ctrl.phonecontroller,
                          //     )),
                          CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            checkboxShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: bgClr1)),
                            fillColor: WidgetStatePropertyAll(bgClr1),
                            checkColor: primary,
                            value: ctrl.consent,
                            onChanged: (val) {
                              ctrl.chnageconsentform(val!);
                            },
                            title: GestureDetector(
                                onTap: () {
                                  navigationSlide(
                                      context, const Healthcareformview(),
                                      x: 0.0, y: 1.0);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Apptextwidget(
                                      fetchlocale(context).consente,
                                      style: TxtStls.stl13,
                                    ),
                                    appspace(h: 2),
                                    Container(
                                      color: primary,
                                      height: 2,
                                      width: 70,
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  )),
        );
      }),
    );
  }
}
