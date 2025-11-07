// ignore_for_file: deprecated_member_use, must_be_immutable, prefer_const_constructors
import 'dart:io';
import 'dart:math';
import 'package:XLcarez/env/appexports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

Widget appspace({h, w}) {
  return h == null
      ? SizedBox(
          width: double.tryParse(w.toString()) ?? 5,
        )
      : SizedBox(
          height: double.tryParse(h.toString()) ?? 5,
        );
}

class MyThemeGradient extends StatelessWidget {
  Widget? child;
  List<Color>? color;
  MyThemeGradient({super.key, this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: genratemediaquery(context).size.height,
      width: genratemediaquery(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: color ??
                  const [
                    Color(0XFF089BAB),
                    Color(0XFF5EBEC8),
                    Color(0XFF8ED2D8),
                    Color(0XFFE6F6F6)
                  ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft)),
      child: child,
    );
  }
}

Widget emailField(
    {controller, labelText, hintText, isblack = false, decoration}) {
  return Appscalemedia(
    child: TextFormField(
      autofocus: false,
      style: isblack ? TxtStls.wstl13 : TxtStls.stl13,
      controller: controller,
      decoration: decoration ??
          inputDecoration(
              labelText: labelText, hintText: hintText, isbalck: isblack),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      validator: (email) {
        final RegExp emailRegex = RegExp(
          r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
          caseSensitive: false,
          multiLine: false,
        );
        if (email!.isEmpty) {
          return "";
        } else if (!emailRegex.hasMatch(email)) {
          return "Email is not formatted";
        } else {
          return null;
        }
      },
    ),
  );
}

Widget emailFieldicon({controller, labelText, hintText, isblack = false}) {
  return Appscalemedia(
    child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [NoLeadingTrailingSpaceFormatter()],
      autofocus: false,
      style: TxtStls.stl13,
      controller: controller,
      decoration: inputDecorationicon(
          labelText: "",
          islabel: false,
          hintText: hintText,
          hintStyle: TextStyle(color: primary),
          isbalck: isblack,
          prefixicon: Icon(
            Icons.email,
            color: primary,
          )),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      validator: (email) {
        final RegExp emailRegex = RegExp(
          r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
          caseSensitive: false,
          multiLine: false,
        );
        if (email!.isEmpty) {
          return "$labelText field cannot be empty";
        } else if (!emailRegex.hasMatch(email)) {
          return "Please enter a valid $labelText address.";
        } else {
          return null;
        }
      },
    ),
  );
}

Widget mycustomefield({label, Widget? child, style}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Apptextwidget(
        label ?? "",
        style: style ?? TxtStls.wstl14,
      ),
      appspace(h: 5.0),
      child ?? SizedBox.shrink()
    ],
  );
}

Widget buildWeekSelectormod(
    {required DateTime date, arrowback, arrowup, caltap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: primary,
        ),
        onPressed: arrowback,
      ),
      Apptextwidget(
        _formatWeekStart(date),
        style: TxtStls.stl13,
      ),
      Apptextwidget(
        '-',
        style: TxtStls.stl12,
      ),
      Apptextwidget(
        _formatWeekEnd(date),
        style: TxtStls.stl12,
      ),
      IconButton(
        icon: const Icon(
          Icons.arrow_forward,
          color: primary,
        ),
        onPressed: arrowup,
      ),
      IconButton(
          onPressed: caltap,
          icon: const Icon(
            Icons.calendar_today,
            color: primary,
          ))
    ],
  );
}

DateTime getLastDateOfWeek() {
  DateTime currentDate = DateTime.now();

  // Calculate the first day of the current week (Sunday)
  DateTime firstDayOfWeek =
      currentDate.subtract(Duration(days: currentDate.weekday - 1));

  // Calculate the last day of the current week (Saturday)
  DateTime lastDayOfWeek = firstDayOfWeek.add(const Duration(days: 6));

  return lastDayOfWeek;
}

String _formatWeekStart(DateTime dateTime) {
  DateTime weekStart = dateTime.subtract(Duration(days: dateTime.weekday - 1));
  return DateFormat('MMM dd, yyyy').format(weekStart);
}

String _formatWeekEnd(DateTime dateTime) {
  DateTime weekEnd = dateTime.add(Duration(days: 7 - dateTime.weekday));
  return DateFormat('MMM dd, yyyy').format(weekEnd);
}

Widget dobField(context,
    {controller,
    required controller1,
    labelText,
    decoration,
    hintText,
    type = "",
    isblack = false}) {
  return Appscalemedia(
    child: TextFormField(
      style: isblack ? TxtStls.wstl13 : TxtStls.stl13,
      autofocus: false,
      controller: controller,
      readOnly: true,
      decoration: decoration ??
          inputDecoration(
              labelText: labelText, hintText: hintText, isbalck: isblack),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      validator: (name) {
        if (name!.isEmpty) {
          return "";
        } else {
          return null;
        }
      },
      onTap: () {
        selectDate(context, controller: controller, controller1: controller1);
      },
    ),
  );
}

//Ravindra Widgets
Widget newnameField({controller, labelText, hintText}) {
  return Appscalemedia(
      child: TextFormField(
    autofocus: false,
    inputFormatters: [NoLeadingTrailingSpaceFormatter()],
    style: TxtStls.stl13,
    controller: controller,
    decoration: inputDecorationicon(
        labelText: "",
        islabel: false,
        hintText: hintText,
        hintStyle: TextStyle(color: primary),
        prefixicon: Icon(Icons.person_4_outlined)),
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.name,
    textCapitalization: TextCapitalization.words,
    validator: (name) {
      if (name!.isEmpty) {
        return "$labelText field cannot be empty";
      } else {
        return null;
      }
    },
  ));
}

//Ravindra Widgets
Widget nameField({
  controller,
  labelText,
  hintText,
  err,
  readOnly = false,
  isblack = false,
  decoration,
  col,
}) {
  return Appscalemedia(
    child: TextFormField(
      style: isblack ? TxtStls.wstl13 : TxtStls.stl13,
      readOnly: readOnly,
      inputFormatters: [AlphabetTextInputFormatter()],
      autofocus: false,
      controller: controller,
      decoration: decoration ??
          inputDecoration(
              labelText: labelText,
              hintText: hintText,
              isbalck: isblack,
              col: col),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      validator: (name) {
        if (name!.isEmpty) {
          return err ?? "$labelText is cannot be empty";
        } else {
          return null;
        }
      },
    ),
  );
}

Widget textfiled({
  controller,
  labelText,
  maxlines,
  hintText,
  mOBSTYLE,
  action,
  errortext,
  readOnly = false,
  isblack = false,
  col,
}) {
  return Appscalemedia(
    child: TextFormField(
      style: isblack ? TxtStls.wstl13 : TxtStls.stl13,
      enabled: !readOnly,
      maxLines: maxlines ?? 1,
      inputFormatters: [NoLeadingTrailingSpaceFormatter()],
      autofocus: false,
      controller: controller,
      decoration: inputDecoration(
          style: mOBSTYLE,
          labelText: labelText,
          hintText: hintText,
          isbalck: isblack,
          col: col),
      textInputAction: action ?? TextInputAction.next,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      validator: (name) {
        if (name!.isEmpty) {
          return "${labelText ?? errortext} is cannot be empty";
        } else {
          return null;
        }
      },
    ),
  );
}

Widget redayonlyfield({
  controller,
  labelText,
  maxlines,
  hintText,
  mOBSTYLE,
  action,
  errortext,
  readOnly = false,
  isblack = false,
  col,
}) {
  return Appscalemedia(
    child: TextFormField(
      style: isblack ? TxtStls.wstl13 : TxtStls.stl13,
      readOnly: readOnly,
      maxLines: maxlines ?? 1,
      inputFormatters: [NoLeadingTrailingSpaceFormatter()],
      autofocus: false,
      controller: controller,
      decoration: inputDecoration(
          style: mOBSTYLE,
          labelText: labelText,
          hintText: hintText,
          isbalck: isblack,
          col: col),
      textInputAction: action ?? TextInputAction.next,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      validator: (name) {
        if (name!.isEmpty) {
          return "${labelText ?? errortext} is cannot be empty";
        } else {
          return null;
        }
      },
    ),
  );
}

Widget fillButton(context,
    {required bool load,
    required String title,
    required onTap,
    stle,
    width,
    circlclr,
    btncol}) {
  Size size = MediaQuery.of(context).size;
  return InkWell(
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: load ? null : onTap,
    child: AnimatedContainer(
      alignment: Alignment.center,
      height: 50,
      width: load ? 50 : width ?? size.width,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: btncol ?? fillcor, borderRadius: BorderRadius.circular(10)),
      child: load
          ? CircularProgressIndicator(color: circlclr ?? primary)
          : Apptextwidget(title, style: stle ?? TxtStls.themestyle14),
    ),
  );
}

// Widget Text(String data,{style,}){
//   return AutoSizeText(data,style: style,maxLines: 2,presetFontSizes: const [12.0,14.0,18.0,16.0,20.0],overflow: TextOverflow.ellipsis,);
// }

// Widget bottomimage({url}) {
//   return Align(
//       alignment: Alignment.bottomRight,
//       child: SizedBox(
//           height: 70.0,
//           width: 70.0,
//           child: Image.asset(
//             url,
//             filterQuality: FilterQuality.high,
//           )));
// }

class Bottomimage extends StatelessWidget {
  final String url;
  const Bottomimage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: SizedBox(
            height: genratemediaquery(context).size.width < 700 ? 70.0 : 200,
            width: genratemediaquery(context).size.width < 700 ? 70.0 : 200,
            child: Image.asset(
              url,
              filterQuality: FilterQuality.high,
            )));
  }
}

Widget mynewdashcard({image, htitle, subtitle, bottom, ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Card(
      color: scaffoldbgcol,
      surfaceTintColor: scaffoldbgcol,
      child: Container(
        width: 200,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.0, width: 50.0, child: Image.asset("$image")),
            Apptextwidget(
              "${htitle ?? ""}",
              style: TxtStls.stl15,
            ),
            Visibility(visible: subtitle != null, child: appspace(h: 2)),
            Visibility(
              visible: subtitle != null,
              child: Apptextwidget(
                "${subtitle ?? ""}",
                style: TxtStls.labelStl,
              ),
            ),
            appspace(h: 2),
            bottom ?? SizedBox()
          ],
        ),
      ),
    ),
  );
}

Widget unFillButton(context,
    {required bool load, required String title, required onTap}) {
  Size size = MediaQuery.of(context).size;
  return InkWell(
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: load ? null : onTap,
    child: AnimatedContainer(
      alignment: Alignment.center,
      height: 50,
      width: load ? 50 : size.width,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: bgClr1,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primary)),
      child: load
          ? CircularProgressIndicator(color: bgClr1)
          : Text(title, style: TxtStls.stl13),
    ),
  );
}

Widget passwordField(
    {controller,
    labelText,
    hintText,
    obscureText,
    onPressed,
    isblack = false}) {
  return Appscalemedia(
    child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TxtStls.stl13,
      inputFormatters: [NoLeadingTrailingSpaceFormatter()],
      //isblack ? TxtStls.wstl13 : TxtStls.stl13,
      autofocus: false,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        //labelStyle: TxtStls.labelStl,
        hintText: hintText,
        hintStyle: TxtStls.hintStl,
        fillColor: fillcor,
        prefixIcon: Icon(
          Icons.lock,
          color: primary,
        ),
        filled: true,
        counterText: "",
        errorStyle: TxtStls.errorStl,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderclr),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderclr),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: errorClr),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: labelClr,
          ),
          onPressed: onPressed,
          // color: primary
        ),
      ),
      obscureText: obscureText,
      obscuringCharacter: "*",
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      textCapitalization: TextCapitalization.none,
      validator: (password) {
        if (password!.isEmpty) {
          return "$labelText field cannot be empty";
        } else if (password.length < 6) {
          return "$labelText should be more than 6 digits ";
        } else {
          return null;
        }
      },
    ),
  );
}

Widget phoneField(
    {controller,
    labelText,
    hintText,
    isblack = false,
    decoration,
    err,
    formmater,
    maxlen}) {
  return Appscalemedia(
    child: TextFormField(
      style: isblack ? TxtStls.wstl13 : TxtStls.stl13,
      autofocus: false,
      controller: controller,
      decoration: decoration ??
          inputDecoration(
              labelText: labelText, hintText: hintText, isbalck: isblack),
      textInputAction: TextInputAction.next,
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: false),
      inputFormatters: formmater,
      // inputFormatters: <TextInputFormatter>[
      //   LengthLimitingTextInputFormatter(11),
      //   //FilteringTextInputFormatter.allow(RegExp(r'^\+?\d*$'))
      //   FilteringTextInputFormatter.digitsOnly
      // ],
      maxLength: 11,
      validator: (phone) {
        if (phone!.isEmpty) {
          return "";
        } else if (phone.length > maxlen) {
          return err ?? "$labelText should not exceed $maxlen digits only";
        } else {
          return null;
        }
      },
    ),
  );
}

Widget ageField(
    {controller,
    labelText,
    err,
    hintText,
    decoration,
    enabled = false,
    required maxLength,
    isblack = false}) {
  return TextFormField(
    style: isblack ? TxtStls.wstl13 : TxtStls.stl13,
    maxLength: maxLength,
    autofocus: false,
    controller: controller,
    readOnly: true,
    decoration: decoration ??
        inputDecoration(
            labelText: labelText, hintText: hintText, isbalck: isblack),
    textInputAction: TextInputAction.next,
    keyboardType:
        const TextInputType.numberWithOptions(signed: true, decimal: false),
    autovalidateMode: AutovalidateMode.onUserInteraction,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly
    ],
    validator: (age) {
      if (age!.isEmpty) {
        return "";
      } else if (int.parse(age) < 18 || int.parse(age) > 79) {
        return "${err ?? labelText} should be between 18 and 80";
      } else {
        return null;
      }
    },
  );
}

Widget weightField(context,
    {controller,
    labelText,
    hintText,
    unit,
    decoration,
    required maxLength,
    isblack = false,
    col}) {
  return Appscalemedia(
    child: TextFormField(
      style: isblack ? TxtStls.wstl13 : TxtStls.stl13,
      maxLength: maxLength,
      autofocus: false,
      controller: controller,
      decoration: decoration ??
          inputDecoration(
              //labelText: labelText,
              hintText: hintText,
              col: col,
              isbalck: isblack),
      textInputAction: TextInputAction.next,
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
        //FilteringTextInputFormatter.digitsOnly
      ],
      validator: unit == "kg"
          ? (weight) {
              if (weight!.isEmpty) {
                return "";
              } else if (double.parse(weight) < 40 ||
                  double.parse(weight) > 150) {
                return fetcherrortext(context,
                    "Weight in kg should be within the range of 40 to 150 kg");
              } else {
                return null;
              }
            }
          : (weight) {
              if (weight!.isEmpty) {
                return "";
              } else if (double.parse(weight) < 88 ||
                  double.parse(weight) > 330) {
                return fetcherrortext(context,
                    "Weight in lbs should be within the range of 88 to 330 lbs");
              } else {
                return null;
              }
            },
    ),
  );
}

Widget heightField(context,
    {controller,
    labelText,
    hintText,
    decoration,
    required maxLength,
    isblack = false,
    col}) {
  return Appscalemedia(
    child: TextFormField(
      style: isblack ? TxtStls.wstl13 : TxtStls.stl13,
      maxLength: maxLength,
      autofocus: false,
      controller: controller,
      decoration: decoration ??
          inputDecoration(
              //labelText: labelText,
              hintText: hintText,
              col: col,
              isbalck: isblack),
      textInputAction: TextInputAction.next,
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
        //FilteringTextInputFormatter.digitsOnly
      ],
      validator: (weight) {
        // print('height $weight');
        if (weight!.isEmpty) {
          return "";
        } else if (double.parse(weight) < 130 || double.parse(weight) > 230) {
          return fetcherrortext(context,
              "Height in cm should be within the range of 130 to 230 centimeters");
        } else {
          return null;
        }
      },
    ),
  );
}

Widget toggle(
  context, {
  titl1,
  title2,
  titlw1,
  titlew2,
  isSelected,
  tap,
  col,
}) {
  // Size size = MediaQuery.of(context).size;
  return SizedBox(
    height: 35,
    child: ToggleButtons(
        onPressed: tap,
        color: primary,
        fillColor: primary,
        splashColor: primary,
        highlightColor: primary,
        renderBorder: true,
        borderWidth: 1,
        borderRadius: BorderRadius.circular(30),
        borderColor: labelClr,
        selectedBorderColor: primary,
        disabledBorderColor: col ?? labelClr,
        disabledColor: col ?? labelClr,
        isSelected: isSelected,
        children: [
          titlw1 ??
              AnimatedContainer(
                curve: Curves.easeInOut,
                alignment: Alignment.center,
                width: 70,
                duration: const Duration(microseconds: 300),
                child: Text(titl1,
                    style: isSelected[0] ? TxtStls.wstl12 : TxtStls.hintStl),
              ),
          titlew2 ??
              AnimatedContainer(
                curve: Curves.slowMiddle,
                alignment: Alignment.center,
                width: 70,
                duration: const Duration(microseconds: 300),
                child: Text(title2,
                    style: isSelected[1] ? TxtStls.wstl12 : TxtStls.hintStl),
              ),
        ]),
  );
}

Widget toggle1(
  context, {
  titl1,
  title2,
  title3,
  titlw1,
  titlew2,
  titlew3,
  isSelected,
  tap,
  col,
}) {
  // Size size = MediaQuery.of(context).size;
  return SizedBox(
    height: 35,
    child: ToggleButtons(
        onPressed: tap,
        color: primary,
        fillColor: primary,
        splashColor: primary,
        highlightColor: primary,
        renderBorder: true,
        borderWidth: 1,
        borderRadius: BorderRadius.circular(30),
        borderColor: labelClr,
        selectedBorderColor: primary,
        disabledBorderColor: col ?? Colors.black,
        disabledColor: col ?? Colors.black,
        isSelected: isSelected,
        children: [
          titlw1 ??
              AnimatedContainer(
                curve: Curves.easeInOut,
                alignment: Alignment.center,
                width: 70,
                duration: const Duration(microseconds: 300),
                child: Apptextwidget(titl1,
                    style: isSelected[0] ? TxtStls.wstl12 : TxtStls.stl12),
              ),
          titlew2 ??
              AnimatedContainer(
                curve: Curves.slowMiddle,
                alignment: Alignment.center,
                width: 70,
                duration: const Duration(microseconds: 300),
                child: Apptextwidget(title2,
                    style: isSelected[1] ? TxtStls.wstl12 : TxtStls.stl12),
              ),
          titlew3 ??
              AnimatedContainer(
                curve: Curves.slowMiddle,
                alignment: Alignment.center,
                width: 70,
                duration: const Duration(microseconds: 300),
                child: Apptextwidget(title3,
                    style: isSelected[2] ? TxtStls.wstl12 : TxtStls.stl12),
              ),
        ]),
  );
}

Widget appointmentCard(Appointmentmodel model) {
  return Consumer3<Authcontroller, Appointmentcontroller, Medicationcontroller>(
      builder: (context, auth, aptctrl, medication, child) {
    return Stack(
      children: [
        Card(
          elevation: 2,
          surfaceTintColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: bgClr1,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Apptextwidget(
                        "#XLcarez${model.appointmentId.toString().length < 2 ? "0${model.appointmentId}" : model.appointmentId}",
                        style: TxtStls.labelStlhint,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 2),
                        height: 30,
                        width: 150,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: fetcolbystatus(status: model.status),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Apptextwidget(
                          fetchloacalestatus(context, model.status) ?? "",
                          style: fetchfontstyle(model.status),
                        )),
                      ),
                    ],
                  ),
                  appspace(h: 20),
                  Row(
                    children: [
                      networkImages2(
                          url: checkuserimage(
                              path:
                                  "${auth.userData?["roleId"] == 5 ? model.clinicianImage : model.patientImage}"),
                          // "${asseturl}Users/${auth.userData?["roleId"] == 5 ? model.clinicianImage : model.patientImage}",
                          size: 50.0),
                      appspace(w: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Apptextwidget(
                            auth.userData?["roleId"] == 5
                                ? "Dr .${model.clinicianName ?? ""}"
                                : model.patientName ?? "",
                            style: TxtStls.stl15,
                          ),
                          appspace(h: 2),
                          Apptextwidget(
                            model.specialityName ?? "",
                            style: TxtStls.themestyle12,
                          ),
                        ],
                      ),
                    ],
                  ),
                  appspace(h: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.calendar,
                            color: headerClr,
                            size: 15,
                          ),
                          appspace(w: 10),
                          SizedBox(
                            width: 200,
                            child: Apptextwidget(
                              model.status == "Waitlisted" ||
                                      model.status == "Confirmed"
                                  ? "${dateformat(format: "dd/MMM/yyy", vale: DateTime.parse(model.preferredDate!.split("T")[0]))} ${model.preferredTime}"
                                  : dateformat(
                                      format: "dd/MMM/yyy hh:mm a",
                                      vale: model.status == "Checkin"
                                          ? DateTime.parse("${model.startTime}")
                                          : DateTime.parse("${model.endTime}")),
                              style: TxtStls.hintStl,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Visibility(
                            visible: auth.userData?["roleId"] == 4 &&
                                model.status == "Waitlisted",
                            child: IconButton(
                              onPressed: () async {
                                aptctrl
                                    .confirmappointment(
                                        id: model.appointmentId,
                                        status: "Confirmed")
                                    .whenComplete(() {
                                  aptctrl.getallappointments();
                                });
                              },
                              icon: Icon(Icons.check),
                              iconSize: 25,
                              color: primary,
                            ),
                          ),
                          Visibility(
                              visible: auth.userData?["roleId"] == 4 &&
                                  model.status == "Confirmed",
                              child: Container(
                                height: 35,
                                width: 35,
                                margin: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: hintClr.withOpacity(0.1)),
                                child: IconButton(
                                    onPressed: () {
                                      aptctrl.getappointbyid(
                                          id: model.appointmentId);
                                      navigationSlide(
                                          context, Appointmentdetailview());
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.eye,
                                      size: 18,
                                      color: primary,
                                    )),
                              )),

                          Container(
                              height: 33,
                              width: 33,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: hintClr.withOpacity(0.1)),
                              child: IconButton(
                                  onPressed: model.teleConsultation == "yes"
                                      ? () {
                                          if (model.status == "Checkin") {
                                            checkAndRequestPermissions(
                                                hospitalid: model.hospitalId,
                                                aptid: model.appointmentId);
                                          }
                                          //jionmeet(hospitalid: model.hospitalId,aptid: model.appointmentId);
                                        }
                                      : null,
                                  icon: Icon(
                                    size: 18,
                                    model.teleConsultation == "yes"
                                        ? FontAwesomeIcons.video
                                        : FontAwesomeIcons.hospitalUser,
                                    color: primary,
                                  ))),
                          //  Icon(model.teleConsultation=="yes"?FontAwesomeIcons.video:FontAwesomeIcons.hospitalUser,color: bgClr1,size: 20,),
                          appspace(w: 10),
                          Visibility(
                              visible: model.status == "Checkin" ||
                                  model.status == "Completed",
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: hintClr.withOpacity(0.1)),
                                child: IconButton(
                                    onPressed: () {
                                      navigationSlide(
                                          context,
                                          Lontudnanalview(
                                            aptid: model.appointmentId,
                                            id: model.patientId,
                                            issameuser: false,
                                          ));
                                      // if (auth.userData?["roleId"] == 4) {
                                      //   navigationSlide(
                                      //       context,
                                      //       Lontudnanalview(
                                      //         aptid: model.appointmentId,
                                      //         id: model.patientId,
                                      //         issameuser: auth.userData?["userId"]==model.patientId,
                                      //       ));
                                      // } else {
                                      //   medication.getmedications(
                                      //       id: model.appointmentId);
                                      //   navigationSlide(
                                      //       context, Medicationview());
                                      // }
                                    },
                                    icon: Icon(
                                      size: 18,
                                      FontAwesomeIcons.filePrescription,
                                      color: primary,
                                    )),
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ],
    );
  });
}

Widget dateField(context,
    {required controller,
    labletext,
    isblack = false,
    mOBSTYLE,
    labelText,
    hintText,
    col,
    action,
    errortext}) {
  return Appscalemedia(
    child: TextFormField(
      onTap: () async {
        final now = DateTime.now();
        final adjustedNow = now.add(Duration(seconds: 1));
        //print("Is okuyf");
        if (Platform.isIOS) {
          showCupertinoModalPopup(
              context: context,
              builder: (_) {
                return SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      backgroundColor: bgClr2,
                      onDateTimeChanged: (picked) {
                        controller.text =
                            "${picked.day > 9 ? picked.day : "0${picked.day}"}-${picked.month > 9 ? picked.month : "0${picked.month}"}-${picked.year}";
                      },
                      initialDateTime: adjustedNow,
                      minimumDate: adjustedNow,
                      maximumDate: DateTime((DateTime.now().year + 100)),
                    ));
              });
        } else {
          final DateTime? picked = await showDatePicker(
            builder: (_, child) {
              return Theme(data: calendertheme(context), child: child!);
            },
            context: context,
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            initialDate: adjustedNow,
            firstDate: adjustedNow,
            lastDate: DateTime((DateTime.now().year + 100)),
          );
          if (picked != null) {
            controller.text =
                "${picked.day > 9 ? picked.day : "0${picked.day}"}-${picked.month > 9 ? picked.month : "0${picked.month}"}-${picked.year}";
          }
        }
      },
      style: isblack ? TxtStls.wstl13 : TxtStls.stl13,
      readOnly: true,
      autofocus: false,
      controller: controller,
      decoration: inputDecoration(
          style: mOBSTYLE,
          labelText: labelText,
          hintText: hintText,
          isbalck: isblack,
          col: col),
      textInputAction: action ?? TextInputAction.next,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      validator: (name) {
        if (name!.isEmpty) {
          return "${labelText ?? errortext} is cannot be empty";
        } else {
          return null;
        }
      },
    ),
  );
}

Color fetcolbystatus({status}) {
  var mapstaus = {
    "Waitlisted": card1,
    "Checkin": primary.withOpacity(0.1),
    "Confirmed": primary.withOpacity(0.1),
    "Completed": success.withOpacity(0.1),
  };
  return mapstaus[status] ?? primary;
}

TextStyle fetchfontstyle(status) {
  var mapstaus = {
    "Waitlisted": TxtStls.waitlistedstyle,
    "Checkin": TxtStls.checkinstyle,
    "Completed": TxtStls.completedstyle,
    "Confirmed": TxtStls.checkinstyle,
  };
  return mapstaus[status] ?? TxtStls.hintStl;
}

Widget imgData({url, size}) {
  return SizedBox(
    height: size ?? 70,
    width: size ?? 70,
    child: Image.asset(
      "assets/$url",
      filterQuality: FilterQuality.high,
      //color: bgClr1,
    ),
  );
}

Widget titleValue({title, value}) {
  return Row(
    children: [
      Expanded(flex: 1, child: Apptextwidget(title, style: TxtStls.wstl16)),
      Text(":   ", style: TxtStls.wstl16),
      Expanded(flex: 2, child: Apptextwidget(value, style: TxtStls.wstl14)),
    ],
  );
}

Widget numberField(
    {controller,
    labelText,
    decoration,
    hintText,
    enabled = false,
    required maxLength,
    col,
    isblack = false}) {
  return Appscalemedia(
    child: TextFormField(
      style: isblack ? TxtStls.wstl13 : TxtStls.stl13,
      maxLength: maxLength,
      autofocus: false,
      controller: controller,
      readOnly: enabled,
      decoration: decoration ??
          inputDecoration(
              labelText: labelText,
              hintText: hintText,
              isbalck: isblack,
              col: col),
      textInputAction: TextInputAction.next,
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
        // FilteringTextInputFormatter.digitsOnly
      ],
      validator: (phone) {
        if (phone!.isEmpty) {
          return "";
        } else {
          return null;
        }
      },
    ),
  );
}

Widget myyellowcard({child}) {
  return Card(
      color: bgClr1,
      surfaceTintColor: bgClr1,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: child,
      ));
}

Widget slidercard(
  context, {
  label,
  riscol,
  labelw,
  riskvale,
  imageurl,
  minvalue,
  value,
  maxvalue,
  isbp,
  isbpvale,
  iextrawidget,
}) {
  //print("$label"+riscol.toString());
  return Card(
      child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            labelw ??
                Apptextwidget(
                  fethvitalsdata(context, label),
                  //label,
                  style: TxtStls.stl13,
                ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colohandle(riscol)),
              child: Apptextwidget(fetchlevels(context, riskvale),
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 12,
                          letterSpacing: 0,
                          color: riscol,
                          fontFamily: 'Inter'))),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imgData(
              url: imageurl,
            ),
            appspace(w: 5),
            iextrawidget ??
                Flexible(
                    child: CustomSliderExample(
                        isbp: isbp ?? false,
                        bpvalue: isbpvale,
                        vital: label,
                        currentValue: value,
                        maxValue: maxvalue,
                        minValue: minvalue))
          ],
        ),
      ],
    ),
  ));
}

dynamic colohandle(col) {
  try {
    return col.withOpacity(0.1);
  } catch (e) {
    return primary;
  }
}

Widget slidercard1(context, {labelw, label, imageurl, value, child}) {
  return Card(
      child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            labelw ??
                Apptextwidget(
                  fethvitalsdata(context, label),
                ),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       color: primary.withValues(alpha: 0.5)),
            //   child: Apptextwidget(value,
            //       style: GoogleFonts.inter(
            //           textStyle: TextStyle(
            //               fontSize: 12,
            //               letterSpacing: 0,
            //               color: primary,
            //               fontFamily: 'Inter'))),
            // ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            imgData(
              url: imageurl,
            ),
            appspace(w: 5),
            child ?? SizedBox.shrink()
          ],
        ),
        appspace(h: 10),
        Center(
            child: Apptextwidget(
          "${fetchlocale(context).observedval} => ${value ?? "-"}",
          style: TxtStls.stl14,
        ))
      ],
    ),
  ));
}

Widget slidercardreportcard(context,
    {labelw, label, riskcol, riskvale, imageurl, value, confidence, child}) {
  //print("$label $riskvale");
  return Visibility(
    visible: !value.toString().contains("null"),
    child: Card(
        color: scaffoldbgcol,
        surfaceTintColor: scaffoldbgcol,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  labelw ??
                      Apptextwidget(
                        fethvitalsdata(context, label),
                        // label ?? "",
                        style: TxtStls.stl13,
                      ),
                  Visibility(
                    visible: riskvale != "-",
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                          border: Border.all(color: riskcol),
                          borderRadius: BorderRadius.circular(10),
                          color: bgcol),
                      child: Apptextwidget(fetchlevels(context, riskvale),
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 12,
                                  letterSpacing: 0,
                                  color: riskcol,
                                  fontFamily: 'Inter'))),
                    ),
                  ),
                ],
              ),
              Visibility(
                  visible: confidence != null,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 5),
                    child: Apptextwidget(
                      "  ${fetchlevels(context, confidence)} ${fetchlocale(context).confidence}",
                      style: colstyelses(confidence.toString().capitalize()),
                    ),
                  )),
              Center(
                  child: Apptextwidget(
                "${fetchlocale(context).observedval} ${value ?? "-"}",
                style: TxtStls.stl15,
              )),
              child ?? SizedBox.shrink(),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     child ?? SizedBox.shrink(),
              //     imgData(
              //       size: 40.0,
              //       url: imageurl,
              //     ),
              //   ],
              // ),
            ],
          ),
        )),
  );
}

TextStyle colstyelses(val) {
  var data = {
    "Medium": TxtStls.mediumstyle,
    "Mild": TxtStls.mediumstyle,
    "Low": TxtStls.errorStl,
    "High": TxtStls.greenStl,
  };
  return data[val] ?? TxtStls.stl13;
}

Widget mydashcard(child) {
  return networkImages(url: child, size: 50.0);
}

InputDecoration inputDecoration(
    {style, labelText, hintText, col, isbalck = false}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
    labelText: labelText,
    labelStyle: isbalck ? TxtStls.labelStl : style ?? TxtStls.stl15,
    hintText: hintText,
    hintStyle: TxtStls.hintStl,
    fillColor: fillcor,
    filled: true,
    counterText: "",
    errorStyle: TxtStls.errorStl,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: col ?? borderclr),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: col ?? borderclr),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: errorClr),
    ),
  );
}

InputDecoration inputDecorationnoborder(
    {labelText, hintText, col, isbalck = false}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
    labelText: labelText,
    labelStyle: isbalck ? TxtStls.labelStl : TxtStls.stl15,
    hintText: hintText,
    hintStyle: TxtStls.hintStl,
    fillColor: CupertinoColors.systemBackground,
    filled: true,
    counterText: "",
    errorStyle: TxtStls.errorStl,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: CupertinoColors.systemRed),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: CupertinoColors.systemRed),
    ),
  );
}

InputDecoration inputDecorationicon(
    {labelText,
    hintText,
    col,
    isbalck = false,
    prefixicon,
    hintStyle,
    islabel = true}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
    label: islabel
        ? Apptextwidget(
            labelText,
            style: isbalck ? TxtStls.labelStl : TxtStls.stl15,
          )
        : null,
    //labelStyle: isbalck ? TxtStls.labelStl : TxtStls.stl15,
    hintText: hintText,
    prefixIcon: prefixicon,
    hintStyle: TxtStls.hintStl,
    fillColor: fillcor,
    filled: true,
    counterText: "",
    errorStyle: TxtStls.errorStl,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: col ?? borderclr),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: col ?? borderclr),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: errorClr),
    ),
  );
}

Future<void> selectDate(BuildContext context,
    {required TextEditingController controller,
    required TextEditingController controller1}) async {
  if (Platform.isIOS) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                backgroundColor: bgClr2,
                onDateTimeChanged: (picked) {
                  controller.text =
                      "${picked.day > 9 ? picked.day : "0${picked.day}"}-${picked.month > 9 ? picked.month : "0${picked.month}"}-${picked.year}";
                  controller1.text = calculateAge(dob: picked).toString();
                },
                initialDateTime: DateTime.now(),
                minimumDate: DateTime(1900),
                maximumDate: DateTime.now(),
              ));
        });
  } else {
    final DateTime? picked = await showDatePicker(
      builder: (_, child) {
        return Theme(data: calendertheme(context), child: child!);
      },
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      controller.text =
          "${picked.day > 9 ? picked.day : "0${picked.day}"}-${picked.month > 9 ? picked.month : "0${picked.month}"}-${picked.year}";
      controller1.text = calculateAge(dob: picked).toString();
    }
  }
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

Widget loader() {
  return const Center(
    child: CupertinoActivityIndicator(
      color: scaffoldbgcol,
    ),
  );
}

Widget networkImages({
  url,
  size,
}) {
  //log(url.toString());
  return Container(
    height: size,
    width: size,
    decoration: BoxDecoration(
        color: url.toString().startsWith("assets")
            ? scaffoldbgcol
            : transparentcol,
        border: Border.all(color: scaffoldbgcol),
        borderRadius: BorderRadius.circular(size)),
    child: ClipOval(
      child: url.toString().startsWith("assets")
          ? Image.asset(
              url,
              width: size,
              height: size,
              fit: BoxFit.cover,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Container(
                  width: size,
                  height: size,
                  color: Colors.grey, // Placeholder color
                  child: const Icon(
                    Icons.image_sharp,
                    color: Colors.white,
                  ),
                );
              },
            )
          : Image.network(
              url,
              width: size,
              height: size,
              fit: BoxFit.cover,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Container(
                  width: size,
                  height: size,
                  color: Colors.grey, // Placeholder color
                  child: const Icon(
                    Icons.image_sharp,
                    color: Colors.white,
                  ),
                );
              },
            ),
    ),
  );
}

Widget networkImages2({
  url,
  size,
}) {
  debugPrint(url);
  return Container(
    clipBehavior: Clip.hardEdge,
    height: size,
    width: size,
    decoration: BoxDecoration(
        border: Border.all(color: bgClr1),
        borderRadius: BorderRadius.circular(10)),
    child: url.toString().startsWith("assets")
        ? Image.asset(
            url,
            width: size,
            height: size,
            fit: BoxFit.cover,
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
              return Container(
                  width: size,
                  height: size,
                  color: scaffoldbgcol, // Placeholder color
                  child: Image.asset(avtharimg));
            },
          )
        : Image.network(
            url,
            width: size,
            height: size,
            fit: BoxFit.cover,
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
              return Container(
                  width: size,
                  height: size,
                  color: scaffoldbgcol, // Placeholder color
                  child: Image.asset(avtharimg));
            },
          ),
  );
}

Widget unitcard({val, unit, style}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Apptextwidget(
        "$val",
        style: style ?? TxtStls.wstl16,
      ),
      appspace(h: 2),
      Apptextwidget(
        "$unit",
        style: style ?? TxtStls.wstl12,
      ),
    ],
  );
}

Widget indicator({val, col}) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration:
          BoxDecoration(color: col, borderRadius: BorderRadius.circular(10)),
      child: Apptextwidget(
        "$val",
        style: TxtStls.wstl13,
      ));
}

ThemeData calendertheme(context) {
  return Theme.of(context).copyWith(
    textTheme: TextTheme(
      labelLarge: TxtStls.stl14,
      labelMedium: TxtStls.stl13,
      labelSmall: TxtStls.stl12,
    ),
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: TxtStls.hintStl, filled: true, fillColor: primary),
    colorScheme: ColorScheme.light(
      primary: primary, // header background color
      onPrimary: bgClr1, // header text color
      onSurface: Colors.black, // body text color
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primary, // button text color
      ),
    ),
  );
}

class WidgetSize extends StatefulWidget {
  final Widget child;
  final Function onChange;

  // ignore: use_super_parameters
  const WidgetSize({Key? key, required this.onChange, required this.child})
      : super(key: key);

  @override
  State<WidgetSize> createState() => _WidgetSizeState();
}

class _WidgetSizeState extends State<WidgetSize> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }

  var widgetKey = GlobalKey();
  Size? oldSize;

  void postFrameCallback(_) {
    var context = widgetKey.currentContext;
    if (context == null) return;

    var newSize = context.size;
    if (oldSize == newSize) {
      return;
    }

    oldSize = newSize;
    widget.onChange(newSize);
  }
}

Widget bottomContainer({child}) {
  return SafeArea(
    child: Container(padding: const EdgeInsets.all(15), child: child),
  );
}

// Widget questionAnswer({header, groupValue, onChanged, required List list}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Apptextwidget(
//         header,
//         style: TxtStls.stl16,
//       ),
//       const SizedBox(height: 5.0),
//       Wrap(
//           spacing: 5,
//           alignment: WrapAlignment.start,
//           children: list
//               .map((e) => Row(
//                     children: [
//                       Radio(
//                           value: e,
//                           groupValue: groupValue,
//                           onChanged: onChanged,
//                           fillColor:
//                               MaterialStateProperty.resolveWith((Set states) {
//                             return headerClr;
//                           })),
//                       Apptextwidget(e.toString(), style: TxtStls.stl14)
//                     ],
//                   ))
//               .toList()),
//     ],
//   );
// }

Widget questionAnswer(context,
    {header, groupValue, onChanged, required List list}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Apptextwidget(
        header,
        style: TxtStls.stl16,
      ),
      const SizedBox(height: 5.0),
      Wrap(
          spacing: 5,
          alignment: WrapAlignment.start,
          children: list
              .map((e) => Row(
                    children: [
                      Radio(
                          value: e,
                          groupValue: groupValue,
                          onChanged: onChanged,
                          fillColor:
                              MaterialStateProperty.resolveWith((Set states) {
                            return headerClr;
                          })),
                      Apptextwidget(fetchquestionsloc(context, e),
                          style: TxtStls.stl14)
                    ],
                  ))
              .toList()),
    ],
  );
}

Widget dropdowndynamic(
    {hint,
    val,
    list,
    onchnage,
    validate = false,
    onval,
    AutovalidateMode? validatemode}) {
  return DropdownButtonFormField2(
      autovalidateMode: validatemode,
      hint: Apptextwidget(
        hint ?? "",
        style: TxtStls.hintStl,
      ),
      decoration: inputDecoration(),
      dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10))),
      value: val,
      items: list,
      validator: validate
          ? onval ??
              (l) {
                if (l == null) {
                  return "";
                } else {
                  return null;
                }
              }
          : null,
      onChanged: onchnage);
}

// Widget questionAnswerassesment(
//     {header, groupValue, onChanged, required List list}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Apptextwidget(
//         header,
//         style: TxtStls.wstl16,
//       ),
//       const SizedBox(height: 5.0),
//       Wrap(
//           spacing: 5,
//           alignment: WrapAlignment.start,
//           children: list
//               .map((e) => Row(
//                     children: [
//                       Radio(
//                           value: e["value"],
//                           groupValue: groupValue,
//                           onChanged: onChanged,
//                           fillColor:
//                               MaterialStateProperty.resolveWith((Set states) {
//                             return scaffoldbgcol;
//                           })),
//                       Apptextwidget(e["label"], style: TxtStls.wstl14)
//                     ],
//                   ))
//               .toList()),
//     ],
//   );
// }

Widget questionAnswerassesment(context,
    {header,
    groupValue,
    onChanged,
    required List list,
    child,
    isfatigue = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Apptextwidget(
        header,
        style: TxtStls.stl15,
      ),
      const SizedBox(height: 5.0),
      Wrap(
          spacing: 5,
          alignment: WrapAlignment.start,
          children: list
              .map((e) => Row(
                    children: [
                      Radio(
                          value: e["value"],
                          groupValue: groupValue,
                          onChanged: onChanged,
                          fillColor:
                              MaterialStateProperty.resolveWith((Set states) {
                            return primary;
                          })),
                      isfatigue
                          ? Apptextwidget(
                              fetchlocaloptionfatigue(context, e["label"]),
                              style: TxtStls.stl14)
                          : Apptextwidget(
                              fetchlocaloptionsleep(context, e["label"]),
                              style: TxtStls.stl14)
                    ],
                  ))
              .toList()),
    ],
  );
}

Widget aptstauscards({
  value,
  col,
  title,
  txtclr,
  img,
  icon,
}) {
  return Card(
    color: col,
    surfaceTintColor: col,
    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: primary.withOpacity(0.5))),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 50, child: img == null ? icon : Image.asset(img)),
          Apptextwidget(
            "$value",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 40,
              letterSpacing: 0.25,
              color: txtclr,
              fontFamily: "Inter",
            ),
          ),
          appspace(h: 10),
          Apptextwidget(
            title,
            style: TxtStls.stl15,
          ),
        ],
      ),
    ),
  );
}

Widget vitalfield({
  controller1,
  controller2,
  title1,
  title2,
  enabled1,
  enabled2,
  c1,
  c2,
  t1,
  t2,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    child: Row(
      children: [
        Flexible(
            child: entervitalfields(
                title: title1,
                controller: controller1,
                enabled: enabled1,
                chnage: c1,
                trigger: t1)),
        appspace(w: 10),
        title2 == ""
            ? SizedBox.shrink()
            : Flexible(
                child: entervitalfields(
                    title: title2,
                    controller: controller2,
                    enabled: enabled2,
                    chnage: c2,
                    trigger: t2))
      ],
    ),
  );
}

class GradientCircularProgressIndicator extends StatelessWidget {
  final double progress; // Value between 0 and 1
  final double radius; // Radius of the circle
  final List<Color> gradientColors; // Gradient colors
  final double strokeWidth;
  final Widget? child; // Thickness of the circle

  const GradientCircularProgressIndicator(
      {required this.progress,
      required this.radius,
      required this.gradientColors,
      this.strokeWidth = 10.0,
      this.child,
      super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: _GradientCircularProgressPainter(
        progress: progress,
        radius: radius,
        gradientColors: gradientColors,
        strokeWidth: strokeWidth,
      ),
      child: child ?? SizedBox.shrink(),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  final double progress;
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  _GradientCircularProgressPainter({
    required this.progress,
    required this.radius,
    required this.gradientColors,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCircle(center: center, radius: radius);
    final gradient = SweepGradient(
      startAngle: -pi / 2,
      endAngle: 3 * pi / 2,
      colors: gradientColors,
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    final backgroundPaint = Paint()
      ..color = scaffoldbgcol.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Draw background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw progress arc
    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // Start from the top
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ScoreIndicator extends StatelessWidget {
  final dynamic score;
  final Widget image;
  final dynamic maxScore;
  final double progressValue; // A value between 0.0 and 1.0
  final String label;
  final Size? size;
  final String level;
  final bool show;

  const ScoreIndicator({
    super.key,
    required this.score,
    this.size,
    required this.maxScore,
    required this.progressValue,
    required this.label,
    required this.image,
    this.show = true,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size ?? Size(150, 150),
      painter:
          CircularProgressPainter(progressValue: progressValue, lineWidth: 7.5),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            image,
            Apptextwidget('$score', style: TxtStls.stl14),
            appspace(h: 4),
            Apptextwidget(label, style: TxtStls.stl10),
            appspace(w: 5.0),
            Visibility(
                visible: level != "-",
                child: Apptextwidget(fetchlevels(context, level),
                    style: TxtStls.stl10)),
            Visibility(
                visible: show, child: Icon(Icons.info_outline, size: 20.0)),
            // if (showIcon && icon != null) ...[
            //   appspace(w: 5.0),
            //   Icon(icon, size: 20.0),
            // ],
          ],
        ),
      ),
    );
  }
}

// linewidth

class CircularProgressPainter extends CustomPainter {
  final double progressValue; // A value between 0.0 and 1.0
  final double lineWidth; // Customizable line width

  CircularProgressPainter({required this.progressValue, this.lineWidth = 12});

  @override
  void paint(Canvas canvas, Size size) {
    final double outerRadius = size.width / 2; // Outer circle radius
    final double innerRadius =
        outerRadius - lineWidth - 10; // Inner circle radius
    final double lineRadius =
        (outerRadius + innerRadius) / 2; // Line in the middle

    // Paint for the outer circle
    final Paint outerCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw the outer circle
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      outerRadius,
      outerCirclePaint,
    );

    // Add shadow to the outer circle
    final Path outerShadowPath = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: outerRadius,
      ));
    canvas.drawShadow(outerShadowPath, Colors.black.withOpacity(0.15), 6, true);

    // Paint for the background line (track)
    final Paint backgroundPaint = Paint()
      ..strokeWidth = lineWidth
      ..color = Colors.grey[200]!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Rounded edges for the line

    // Paint for the progress line (foreground)
    final Paint foregroundPaint = Paint()
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round // Rounded edges for the line
      ..shader = SweepGradient(
        startAngle: 0.0,
        endAngle: 2 * pi,
        colors: const [
          Colors.red,
          Colors.orange,
          Colors.green,
        ],
        stops: const [0.3, 0.6, 1.0],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: lineRadius,
      ));

    // Calculate progress angle
    final double progressAngle = progressValue * 2 * pi;

    // Draw the background line
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      lineRadius,
      backgroundPaint,
    );

    // Draw the foreground progress arc
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: lineRadius,
      ),
      -pi / 2,
      progressAngle,
      false,
      foregroundPaint,
    );

    // Draw the inner circle
    final Paint innerCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      innerRadius,
      innerCirclePaint,
    );

    // Add shadow to the inner circle
    final Path innerShadowPath = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: innerRadius,
      ));
    canvas.drawShadow(innerShadowPath, Colors.black.withOpacity(0.25), 4, true);

    // Calculate the position of the indicator circle
    final double indicatorX =
        size.width / 2 + lineRadius * cos(-pi / 2 + progressAngle);
    final double indicatorY =
        size.height / 2 + lineRadius * sin(-pi / 2 + progressAngle);

    // Draw shadow behind the indicator circle
    final Path indicatorShadowPath = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(indicatorX, indicatorY),
        radius: lineWidth / 2,
      ));
    canvas.drawShadow(
        indicatorShadowPath, Colors.black.withOpacity(0.25), 4, true);

    // Draw the indicator circle
    canvas.drawCircle(
      Offset(indicatorX, indicatorY),
      lineWidth / 2, // Radius of the indicator circle
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill,
    );

    // Add a border to the indicator circle
    canvas.drawCircle(
      Offset(indicatorX, indicatorY),
      lineWidth / 2,
      Paint()
        ..color = Colors.grey[300]!
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

Widget vitalCard1(
    {url, title, value, child, col, level, levelcol, stroke, radius}) {
  return GradientCircularProgressIndicator(
    radius: radius ?? 60.0,
    progress: vitlvlueparse(value),
    strokeWidth: stroke ?? 8.0,
    gradientColors: const [Color(0XFFDEFFDF), Color(0XFF4CB050)],
    child: Container(
      alignment: Alignment.center,
      //margin: EdgeInsets.symmetric(horizontal:2, vertical:2),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: const [
            Color(0XFF089BAB),
            Color(0XFF5EBEC8),
            Color(0XFF8ED2D8),
            Color(0XFFE6F6F6)
          ], begin: Alignment.centerLeft, end: Alignment.bottomRight)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //SizedBox(height: 50,child: GradientCircularProgressIndicator(value: 0.75,child: Text("jbgfyfgy"), gradientColors: [headerClr,scaffoldbgcol]),),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Image.asset(
              "assets/Vitals/$url",
              height: 30,
              width: 30,
              filterQuality: FilterQuality.high,
            ),
          ),
          title == "Hemoglobin A1C"
              ? Flexible(
                  child: RichText(
                      text: TextSpan(
                          text: "Hemoglobin A1C",
                          style: TxtStls.wstl10,
                          children: [
                        TextSpan(text: " *", style: TxtStls.errorStl)
                      ])),
                )
              : Flexible(
                  child: Apptextwidget(
                  title,
                  style: TxtStls.wstl10,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                )),
          appspace(h: 5),
          Flexible(
            child: Apptextwidget(
              value == null ? "-" : value.toString().capitalize(),
              style: TxtStls.wstl14,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget vitalCard(context,
    {url,
    title,
    value,
    child,
    col,
    level,
    levelcol,
    stroke,
    radius,
    confidence,
    label}) {
  return InkWell(
    onTap: () {
      navigationSlide(
          context,
          Vitaldetailcard(
            level: level,
            confedence: confidence,
            label: label,
            score: value,
            levecol: levelcol,
            image: Image.asset(
              "assets/Vitals/$url",
              height: genratemediaquery(context).size.height / 20,
              width: genratemediaquery(context).size.width / 10,
              filterQuality: FilterQuality.high,
            ),
          ));
    },
    child: ScoreIndicator(
      level: level ?? "",
      score: value,
      maxScore: 100,
      progressValue: vitlvlueparse(value),
      label: title,
      image: Image.asset(
        "assets/Vitals/$url",
        height: genratemediaquery(context).size.height / 20,
        width: genratemediaquery(context).size.width / 10,
        filterQuality: FilterQuality.high,
      ),
    ),
  );
}

Widget dashboardcard({url, title, value, extra}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: const [
          Color(0XFF089BAB),
          Color(0XFF5EBEC8),
          Color(0XFF8ED2D8),
          Color(0XFFE6F6F6)
        ], begin: Alignment.centerLeft, end: Alignment.bottomRight)),
    child: Column(
      children: [
        //SizedBox(height: 50,child: GradientCircularProgressIndicator(value: 0.75,child: Text("jbgfyfgy"), gradientColors: [headerClr,scaffoldbgcol]),),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Image.asset(
            "$url",
            height: 50,
            width: 50,
            filterQuality: FilterQuality.high,
          ),
        ),

        // Text(
        //   title,
        //   textAlign: TextAlign.center,
        // ),
        Apptextwidget(
          textAlign: TextAlign.center,
          title ?? "",
          style: TxtStls.wstl10,
        ),
        appspace(h: 5),
        unitcard(val: value, unit: extra ?? ""),
      ],
    ),
  );
}

double fetchmaxvalues(value) {
  var map = {
    "Pulse Rate": 120.0,
    "oxygenSaturation": 100.0,
    "Oxygen Saturation": 100.0,
    "Respiration Rate": 60.0,
    "Blood Pressure": 140.0,
    "Stress Level": 380.0,
    "Wellness Level": 10.0,
    "Wellness Index": 10.0,
    "Stress Index": 380.0,
  };
  return map[value] ?? 0.0;
}

double fetchminvalues(value) {
  var map = {
    "Pulse Rate": 40.0,
    "oxygenSaturation": 80.0,
    "Oxygen Saturation": 80.0,
    "Respiration Rate": 10.0,
    "Blood Pressure": 90.0,
    "Stress Level": 0.0,
    "Wellness Level": 1.0,
    "Wellness Index": 1.0,
    "Stress Index": 0.0,
  };
  return map[value] ?? 0.0;
}

double vitlvlueparse(val) {
  // print(val);
  try {
    var parsedfaulue = (double.parse(val.toString())) / 100;
    //log("Parsed value $parsedfaulue");
    return parsedfaulue;
  } catch (e) {
    return 0.0;
  }
}

double stepslueparse(val) {
  // print(val);
  try {
    var parsedfaulue = (double.parse(val.toString())) / 10000;
    //log("Parsed value $parsedfaulue");
    return parsedfaulue;
  } catch (e) {
    return 0.0;
  }
}

double vitlparse(val) {
  // print(val);
  try {
    var parsedfaulue = (double.parse(val.toString()));
    //log("Parsed value $parsedfaulue");
    return parsedfaulue;
  } catch (e) {
    return 0.0;
  }
}

String referncevalues(label, loc) {
  if (loc == const Locale("en")) {
    var h = {
      "Pulse Rate": "Reference Range: 60-100 bpm",
      "Respiration Rate": "Reference Range: 12-60 breaths per minute",
      "Wellness Index": "Reference Range: 0-10",
      "Stress Index": "Reference Range: 0-384",
      "Oxygen Saturation": "Reference Range: 95-100%",
      "Blood Pressure": """
Reference Range: 
Systolic: 90-120 mmHg 
Diastolic: 60-80 mmHg""",
      "Hemoglobin A1C": "Reference Range: 4.0-5.6%",
      "Hemoglobin": """
Reference Range:
Men: 13.8-17.2 g/dL
Women: 12.1-15.1 g/dL
Children: 11.0-16.0 g/dL
Pregnant Women: >=11.0 g/dL
"""
    };
    return h[label] ?? "-";
  } else if (loc == const Locale("de")) {
    var h = {
      "Pulse Rate": "Referenzbereich: 60-100 bpm",
      "Respiration Rate": "Referenzbereich: 12-60 Atemzüge pro Minute",
      "Wellness Index": "Referenzbereich: 0-10",
      "Stress Index": "Referenzbereich: 0-384",
      "Oxygen Saturation": "Referenzbereich: 95-100%",
      "Blood Pressure": """
Referenzbereich:
Systolisch: 90-120 mmHg
Diastolisch: 60-80 mmHg""",
      "Hemoglobin A1C": "Referenzbereich: 4,0-5,6%",
      "Hemoglobin": """
Referenzbereich:
Männer: 13,8-17,2 g/dL
Frauen: 12,1-15,1 g/dL
Kinder: 11,0-16,0 g/dL
Schwangere Frauen: >=11,0 g/dL"""
    };
    return h[label] ?? "-";
  } else if (loc == const Locale("uk")) {
    var h = {
      "Pulse Rate": "Референсний діапазон: 60-100 уд/хв",
      "Respiration Rate": "Референсний діапазон: 12-60 вдихів за хвилину",
      "Wellness Index": "Референсний діапазон: 0-10",
      "Stress Index": "Референсний діапазон: 0-384",
      "Oxygen Saturation": "Референсний діапазон: 95-100%",
      "Blood Pressure": """
Референсний діапазон:
Систолічний: 90-120 мм рт. ст.
Діастолічний: 60-80 мм рт. ст.
""",
      "Hemoglobin A1C": "Референсний діапазон: 4.0-5.6%",
      "Hemoglobin": """
Референсний діапазон:
Чоловіки: 13.8-17.2 г/дЛ
Жінки: 12.1-15.1 г/дЛ
Діти: 11.0-16.0 г/дЛ
Вагітні жінки: >=11.0 г/дЛ"""
    };
    return h[label] ?? "-";
  } else if (loc == const Locale("fr")) {
    var h = {
      "Pulse Rate": "Plage de référence: 60-100 bpm",
      "Respiration Rate": "Plage de référence: 12-60 respirations par minute",
      "Wellness Index": "Plage de référence: 0-10",
      "Stress Index": "Plage de référence: 0-384",
      "Oxygen Saturation": "Plage de référence: 95-100%",
      "Blood Pressure": """
Plage de référence:
Systolique: 90-120 mmHg
Diastolique: 60-80 mmHg""",
      "Hemoglobin A1C": "Plage de référence: 4,0-5,6%",
      "Hemoglobin": """
Plage de référence:
Hommes: 13,8-17,2 g/dL
Femmes: 12,1-15,1 g/dL
Enfants: 11,0-16,0 g/dL
Femmes enceintes: >=11,0 g/dL"""
    };
    return h[label] ?? "-";
  } else if (loc == const Locale("ar")) {
    var h = {
      "Pulse Rate": "النطاق المرجعي: 60-100 نبضة في الدقيقة",
      "Respiration Rate": "النطاق المرجعي: 12-60 نفسًا في الدقيقة",
      "Wellness Index": "النطاق المرجعي: 0-10",
      "Stress Index": "النطاق المرجعي: 0-384",
      "Oxygen Saturation": "النطاق المرجعي: 95-100%",
      "Blood Pressure": """النطاق المرجعي:
الانقباضي: 90-120 ملم زئبق
الانبساطي: 60-80 ملم زئبق""",
      "Hemoglobin A1C": "النطاق المرجعي: 4.0-5.6%",
      "Hemoglobin": """النطاق المرجعي:
الرجال: 13.8-17.2 جم/ديسيلتر
النساء: 12.1-15.1 جم/ديسيلتر
الأطفال: 11.0-16.0 جم/ديسيلتر
النساء الحوامل: >=11.0 جم/ديسيلتر
"""
    };
    return h[label] ?? "-";
  } else {
    var h = {
      "Pulse Rate": "Faixa de referência: 60-100 bpm",
      "Respiration Rate": "Faixa de referência: 12-60 respirações por minuto",
      "Wellness Index": "Faixa de referência: 0-10",
      "Stress Index": "Faixa de referência: 0-384",
      "Oxygen Saturation": "Faixa de referência: 95-100%",
      "Blood Pressure": """
Faixa de referência:
Sistólica: 90-120 mmHg
Diastólica: 60-80 mmHg""",
      "Hemoglobin A1C": "Faixa de referência: 4,0-5,6%",
      "Hemoglobin": """
Faixa de referência:
Homens: 13,8-17,2 g/dL
Mulheres: 12,1-15,1 g/dL
Crianças: 11,0-16,0 g/dL
Mulheres grávidas: >=11,0 g/dL"""
    };
    return h[label] ?? "-";
  }
}

String interpretonvalues(label, loc) {
  //print("${label??"-"} ${loc.toString()}");
  if (loc == const Locale("en")) {
    var d = {
      "Pulse Rate": """A resting pulse rate:
Normal: 60-100 bpm.
Low: <60 bpm (Bradycardia).
High: >100 bpm (Tachycardia).

Note: Kindly correlate clinically. Deviations may indicate health concerns and should be evaluated by a physician.
""",
      "Respiration Rate": """Normal resting respiration rate:
Normal: 12-20 breaths per minute,
Low: <12 breaths per minute (Bradypnea).
High: >20 breaths per minute (Tachypnea).

Note: Kindly correlate clinically. Persistent deviations may indicate underlying respiratory or systemic issues.
""",
      "Wellness Index":
          """Normal/Optimal: 8-10 (Indicates excellent health and well-being).
Moderate: 5-7 (Some areas may require attention or improvement).
Low: <5 (Indicates poor health or wellness, requiring intervention).

Note: Kindly correlate clinically. The Wellness Index may vary based on the methodology used and the parameters measured (e.g., physical health, mental health, stress levels, lifestyle).
""",
      "Stress Index": """
Low Stress: 0-30 (Indicates a relaxed state and good stress management).
Moderate Stress: 31-60 (Manageable stress levels; some intervention may be needed).
High Stress: 61-384 (Indicates significant stress, requiring immediate attention or management).

Note: Kindly correlate clinically. The Stress Index is typically derived from parameters such as heart rate variability, breathing patterns, or other physiological markers.
""",
      "Oxygen Saturation": """
Normal: 95-100%.
Low: <95% (May indicate hypoxemia; requires medical attention if sustained).
Critical: <90% (Urgent medical intervention needed).

Note: Kindly correlate clinically. Values below the normal range may indicate respiratory or circulatory issues and should be addressed promptly.
""",
      "Blood Pressure": """
Normal: 90-120 / 60-80 mmHg.
Elevated: Systolic 120-129 mmHg and Diastolic <80 mmHg.
High (Hypertension Stage 1): Systolic 130-139 mmHg or Diastolic 80-89 mmHg.
High (Hypertension Stage 2): Systolic >=140 mmHg or Diastolic >=90 mmHg.
Low (Hypotension): Systolic <90 mmHg or Diastolic <60 mmHg.

Note: Kindly correlate clinically. Blood pressure readings outside the normal range may indicate cardiovascular, renal, or systemic issues and require further evaluation.
""",
      "Hemoglobin A1C": """
Normal: 4.0-5.6% (Indicates healthy blood sugar control)
Prediabetes: 5.7-6.4% (Increased risk of diabetes; lifestyle modifications recommended)
Diabetes: >=6.5% (Diagnostic for diabetes; requires medical intervention)

Note: HbA1c reflects the average blood glucose levels over the past 2-3 months. Kindly correlate clinically for accurate diagnosis and management.
""",
      "Hemoglobin": """
Normal: Within the specified reference range based on age and gender.
Low (Anemia): Below the reference range (may indicate iron deficiency, chronic disease, or other causes).
High (Polycythemia): Above the reference range (may indicate dehydration, lung disease, or other conditions).

Note: Kindly correlate clinically. Deviations from normal levels may require further investigation and management.
"""
    };
    return d[label] ?? "-";
  } else if (loc == const Locale("fr")) {
    var d = {
      "Pulse Rate": """Fréquence cardiaque au repos:
Normale: 60-100 bpm.
Basse: <60 bpm (Bradycardie).
Haute: >100 bpm (Tachycardie).
Remarque: Veuillez corréler cliniquement. Les écarts peuvent indiquer des problèmes de santé et doivent être évalués par un médecin.
""",
      "Respiration Rate": """Fréquence respiratoire au repos:
Normale: 12-20 respirations par minute.
Basse: <12 respirations par minute (Bradypnée).
Haute: >20 respirations par minute (Tachypnée).
Remarque: Veuillez corréler cliniquement. Des écarts persistants peuvent indiquer des problèmes respiratoires ou systémiques sous-jacents.
""",
      "Wellness Index": """Indice de bien-être:
Optimal: 8-10 (Indique une excellente santé et un bon bien-être).
Modéré: 5-7 (Certains aspects peuvent nécessiter une attention).
Bas: <5 (Indique une mauvaise santé, nécessitant une intervention).
Remarque: Veuillez corréler cliniquement. L'indice peut varier selon la méthodologie et les paramètres mesurés.
""",
      "Stress Index": """Indice de stress:
Bas: 0-30 (Indique un état détendu et une bonne gestion du stress).
Modéré: 31-60 (Niveaux gérables; une intervention peut être nécessaire).
Élevé: 61-384 (Indique un stress important nécessitant une attention immédiate).
Remarque: Veuillez corréler cliniquement. Cet indice est basé sur la variabilité de la fréquence cardiaque et d'autres marqueurs physiologiques.
""",
      "Oxygen Saturation": """Saturation en oxygène:
Normale: 95-100%.
Basse: <95% (Peut indiquer une hypoxémie; une attention médicale est requise si persistante).
Critique: <90% (Intervention médicale urgente requise).
Remarque: Veuillez corréler cliniquement. Une valeur inférieure à la normale peut indiquer des problèmes respiratoires ou circulatoires.
""",
      "Blood Pressure": """Pression artérielle:
Normale: 90-120 / 60-80 mmHg.
Élevée: Systolique 120-129 mmHg et Diastolique <80 mmHg.
Hypertension Stade 1: Systolique 130-139 mmHg ou Diastolique 80-89 mmHg.
Hypertension Stade 2: Systolique >=140 mmHg ou Diastolique >=90 mmHg.
Hypotension: Systolique <90 mmHg ou Diastolique <60 mmHg.
Remarque: Veuillez corréler cliniquement. Les valeurs anormales peuvent indiquer des problèmes cardiovasculaires ou systémiques.
""",
      "Hemoglobin A1C": """Hémoglobine A1C:
Normale: 4,0-5,6% (Indique un bon contrôle du glucose).
Pré-diabète: 5,7-6,4% (Risque accru de diabète; modifications du mode de vie recommandées).
Diabète: >=6,5% (Diagnostic de diabète; nécessite une intervention médicale).
Remarque: Le HbA1c reflète les niveaux moyens de glucose au cours des 2-3 derniers mois. Veuillez corréler cliniquement.
""",
      "Hemoglobin": """Hémoglobine:
Normale: Selon la référence pour l'âge et le sexe.
Basse (Anémie): En dessous de la normale (peut indiquer une carence en fer).
Élevée (Polycythémie): Au-dessus de la normale (peut indiquer une déshydratation).
Remarque: Veuillez corréler cliniquement. Des écarts peuvent nécessiter des examens supplémentaires.
"""
    };
    return d[label] ?? "-";
  } else if (loc == const Locale("uk")) {
    var d = {
      "Pulse Rate": """Частота пульсу у стані спокою:
Норма: 60-100 уд/хв.
Низька: <60 уд/хв (Брадикардія).
Висока: >100 уд/хв (Тахікардія).
Примітка: Будь ласка, враховуйте клінічний контекст. Відхилення можуть свідчити про проблеми зі здоров’ям і повинні оцінюватися лікарем.
""",
      "Respiration Rate": """Частота дихання у стані спокою:
Норма: 12-20 вдихів за хвилину.
Низька: <12 вдихів за хвилину (Брадикпное).
Висока: >20 вдихів за хвилину (Тахіпное).
Примітка: Будь ласка, враховуйте клінічний контекст. Постійні відхилення можуть вказувати на респіраторні або системні порушення.
""",
      "Wellness Index":
          """Нормальний/Оптимальний: 8-10 (Вказує на відмінне здоров’я та самопочуття).
Помірний: 5-7 (Деякі аспекти можуть потребувати уваги або покращення).
Низький: <5 (Вказує на погане здоров’я чи самопочуття, потребує втручання).
Примітка: Будь ласка, враховуйте клінічний контекст. Індекс благополуччя може варіюватися залежно від методології та оцінених параметрів (наприклад, фізичне здоров’я, психічне здоров’я, рівень стресу, спосіб життя).
""",
      "Stress Index":
          """Низький рівень стресу: 0-30 (Вказує на розслаблений стан і хороше управління стресом).
Помірний рівень стресу: 31-60 (Керований рівень стресу; може знадобитися деяке втручання).
Високий рівень стресу: 61-384 (Вказує на значний стрес, що вимагає негайної уваги або управління).
Примітка: Будь ласка, враховуйте клінічний контекст. Індекс стресу зазвичай визначається на основі варіабельності серцевого ритму, дихальних патернів або інших фізіологічних маркерів.
""",
      "Oxygen Saturation": """Норма: 95-100%.
Низький рівень: <95% (Може вказувати на гіпоксію; потребує медичної уваги, якщо зберігається).
Критичний рівень: <90% (Необхідне термінове медичне втручання).
Примітка: Будь ласка, враховуйте клінічний контекст. Значення нижче норми можуть вказувати на респіраторні або циркуляторні проблеми і потребують негайного реагування.
""",
      "Blood Pressure": """Норма: 90-120 / 60-80 мм рт. ст.
Підвищений: Систолічний 120-129 мм рт. ст. і Діастолічний <80 мм рт. ст.
Високий (Гіпертонія 1 стадії): Систолічний 130-139 мм рт. ст. або Діастолічний 80-89 мм рт. ст.
Високий (Гіпертонія 2 стадії): Систолічний >=140 мм рт. ст. або Діастолічний >=90 мм рт. ст.
Низький (Гіпотонія): Систолічний <90 мм рт. ст. або Діастолічний <60 мм рт. ст.
Примітка: Будь ласка, враховуйте клінічний контекст. Відхилення артеріального тиску від норми можуть свідчити про серцево-судинні, ниркові або системні порушення і потребують додаткової оцінки.
""",
      "Hemoglobin A1C":
          """Норма: 4.0-5.6% (Вказує на здоровий рівень контролю цукру в крові).
Предіабет: 5.7-6.4% (Підвищений ризик діабету; рекомендується зміна способу життя).
Діабет: >=6.5% (Діагностичний показник діабету; вимагає медичного втручання).
Примітка: HbA1c відображає середній рівень глюкози в крові за останні 2-3 місяці. Для точної діагностики та управління слід враховувати клінічний контекст.
""",
      "Hemoglobin":
          """Норма: В межах зазначеного референсного діапазону залежно від віку та статі.
Низький рівень (Анемія): Нижче референсного діапазону (може вказувати на дефіцит заліза, хронічні захворювання або інші причини).
Високий рівень (Поліцитемія): Вище референсного діапазону (може вказувати на зневоднення, легеневі захворювання або інші стани).
Примітка: Будь ласка, враховуйте клінічний контекст. Відхилення від нормальних рівнів можуть потребувати подальшого обстеження та управління.
"""
    };
    return d[label] ?? "-";
  } else if (loc == const Locale("de")) {
    var d = {
      "Pulse Rate": """Ruhepuls:
Normal: 60-100 bpm.
Niedrig: <60 bpm (Bradykardie).
Hoch: >100 bpm (Tachykardie).
Hinweis: Bitte klinisch abgleichen. Abweichungen können auf gesundheitliche Probleme hinweisen und sollten ärztlich abgeklärt werden.
""",
      "Respiration Rate": """Atemfrequenz in Ruhe:
Normal: 12-20 Atemzüge pro Minute.
Niedrig: <12 Atemzüge pro Minute (Bradypnoe).
Hoch: >20 Atemzüge pro Minute (Tachypnoe).
Hinweis: Bitte klinisch abgleichen. Anhaltende Abweichungen können auf zugrunde liegende Atemwegs- oder systemische Probleme hinweisen.
""",
      "Wellness Index": """Wellness-Index:
Optimal: 8-10 (Zeigt ausgezeichnete Gesundheit und Wohlbefinden an).
Mittelmäßig: 5-7 (Einige Bereiche benötigen möglicherweise Aufmerksamkeit).
Niedrig: <5 (Deutet auf eine schlechte Gesundheit hin und erfordert Maßnahmen).
Hinweis: Bitte klinisch abgleichen. Der Index kann je nach Messmethode und Parametern (z. B. körperliche Gesundheit, mentale Gesundheit, Stresslevel) variieren.
""",
      "Stress Index": """Stress-Index:
Niedrig: 0-30 (Zeigt einen entspannten Zustand und gutes Stressmanagement an).
Mittel: 31-60 (Verwaltbare Stresswerte; eine Intervention kann erforderlich sein).
Hoch: 61-384 (Bedeutender Stress, der sofortige Aufmerksamkeit oder Management erfordert).
Hinweis: Bitte klinisch abgleichen. Der Stress-Index basiert auf Parametern wie Herzfrequenzvariabilität oder Atemmustern.
""",
      "Oxygen Saturation": """Sauerstoffsättigung:
Normal: 95-100%.
Niedrig: <95% (Kann auf Hypoxämie hinweisen; medizinische Abklärung erforderlich).
Kritisch: <90% (Dringende medizinische Intervention erforderlich).
Hinweis: Bitte klinisch abgleichen. Werte unter dem Normalbereich können auf Atemwegs- oder Kreislaufprobleme hinweisen.
""",
      "Blood Pressure": """Blutdruck:
Normal: 90-120 / 60-80 mmHg.
Erhöht: Systolisch 120-129 mmHg und Diastolisch <80 mmHg.
Bluthochdruck (Stufe 1): Systolisch 130-139 mmHg oder Diastolisch 80-89 mmHg.
Bluthochdruck (Stufe 2): Systolisch >=140 mmHg oder Diastolisch >=90 mmHg.
Niedriger Blutdruck (Hypotonie): Systolisch <90 mmHg oder Diastolisch <60 mmHg.
Hinweis: Bitte klinisch abgleichen. Werte außerhalb des Normalbereichs können auf kardiovaskuläre, renale oder systemische Erkrankungen hinweisen.
""",
      "Hemoglobin A1C": """Hämoglobin A1C:
Normal: 4,0-5,6% (Zeigt eine gesunde Blutzuckerkontrolle an).
Prädiabetes: 5,7-6,4% (Erhöhtes Diabetesrisiko; Lebensstiländerungen empfohlen).
Diabetes: >=6,5% (Diagnostisch für Diabetes; medizinische Behandlung erforderlich).
Hinweis: HbA1c spiegelt den durchschnittlichen Blutzuckerspiegel der letzten 2-3 Monate wider. Bitte klinisch abgleichen.
""",
      "Hemoglobin": """Hämoglobin:
Normal: Innerhalb des Referenzbereichs je nach Alter und Geschlecht.
Niedrig (Anämie): Unter dem Referenzbereich (kann auf Eisenmangel oder chronische Erkrankungen hinweisen).
Hoch (Polyzythämie): Über dem Referenzbereich (kann auf Dehydration oder Lungenerkrankungen hinweisen).
Hinweis: Bitte klinisch abgleichen. Abweichungen von der Norm erfordern möglicherweise weitere Untersuchungen.
"""
    };
    return d[label] ?? "-";
  } else if (loc == const Locale("ar")) {
    var d = {
      "Pulse Rate": """معدل النبض:
معدل النبض أثناء الراحة:
طبيعي: 60-100 نبضة في الدقيقة.
منخفض: <60 نبضة في الدقيقة (بطء القلب - Bradycardia).
مرتفع: >100 نبضة في الدقيقة (تسرّع القلب - Tachycardia).
ملاحظة: يُرجى التقييم سريريًا. قد تشير الانحرافات إلى مشاكل صحية ويجب تقييمها من قبل الطبيب.
""",
      "Respiration Rate": """معدل التنفس أثناء الراحة:
طبيعي: 12-20 نفسًا في الدقيقة.
منخفض: <12 نفسًا في الدقيقة (بطء التنفس - Bradypnea).
مرتفع: >20 نفسًا في الدقيقة (تسرع التنفس - Tachypnea).
ملاحظة: يُرجى التوافق سريريًا. قد تشير التغيرات المستمرة إلى مشكلات تنفسية أو جهازية أساسية.
""",
      "Wellness Index": """طبيعي/مثالي: 8-10 (يشير إلى صحة جيدة ورفاهية ممتازة).
معتدل: 5-7 (بعض المجالات قد تتطلب الانتباه أو التحسين).
منخفض: <5 (يشير إلى صحة أو رفاهية ضعيفة، تتطلب التدخل).

ملاحظة: يرجى التوافق سريرياً. قد يختلف مؤشر الصحة بناءً على المنهجية المستخدمة والمعايير المقاسة (مثل الصحة البدنية، الصحة النفسية، مستويات التوتر، أسلوب الحياة).
""",
      "Stress Index":
          """مستوى التوتر المنخفض: 0-30 (يشير إلى حالة استرخاء وإدارة جيدة للتوتر).
مستوى التوتر المعتدل: 31-60 (مستويات توتر قابلة للإدارة؛ قد يتطلب بعض التدخل).
مستوى التوتر المرتفع: 61-384 (يشير إلى توتر شديد، ويتطلب انتباهاً أو إدارة فورية).

ملاحظة: يرجى التوافق سريرياً. يتم عادةً اشتقاق مؤشر التوتر من معايير مثل تباين معدل ضربات القلب، أنماط التنفس، أو مؤشرات فيزيولوجية أخرى.
""",
      "Oxygen Saturation": """الطبيعي: 95-100%.
منخفض: <95% (قد يشير إلى نقص الأوكسجين في الدم؛ يتطلب عناية طبية إذا استمر).
حرج: <90% (يحتاج إلى تدخل طبي عاجل).

ملاحظة: يرجى التوافق سريرياً. القيم التي تكون أقل من المعدل الطبيعي قد تشير إلى مشاكل تنفسية أو دموية ويجب معالجتها بسرعة.
""",
      "Blood Pressure": """
الطبيعي: 90-120 / 60-80 ملم زئبق.
مرتفع: الضغط الانقباضي 120-129 ملم زئبقي والضغط الانبساطي أقل من 80 ملم زئبق.
مرتفع (ارتفاع ضغط الدم المرحلة 1): الضغط الانقباضي 130-139 ملم زئبقي أو الضغط الانبساطي 80-89 ملم زئبق.
مرتفع (ارتفاع ضغط الدم المرحلة 2): الضغط الانقباضي >=140 ملم زئبقي أو الضغط الانبساطي >=90 ملم زئبقي.
منخفض (انخفاض ضغط الدم): الضغط الانقباضي <90 مم زئبقي أو الضغط الانبساطي <60 مم زئبق.
ملاحظة: يرجى الارتباط سريريا. قد تشير قراءات ضغط الدم خارج النطاق الطبيعي إلى مشاكل في القلب والأوعية الدموية أو الكلى أو الجهازية وتتطلب مزيدًا من التقييم.
""",
      "Hemoglobin A1C":
          """الطبيعي: 4.0-5.6% (يشير إلى تحكم جيد في مستوى السكر في الدم)
ما قبل السكري: 5.7-6.4% (زيادة خطر الإصابة بالسكري؛ يوصى بتعديلات في أسلوب الحياة)
السكري: >=6.5% (تشخيص مرض السكري؛ يتطلب تدخلاً طبيًا)

ملاحظة: يعكس HbA1c متوسط مستويات الجلوكوز في الدم خلال الشهرين إلى الثلاثة أشهر الماضية. يرجى التوافق سريرياً للتشخيص والإدارة الدقيقة.
""",
      "Hemoglobin":
          """الطبيعي: ضمن النطاق المرجعي المحدد بناءً على العمر والجنس.
منخفض (فقر الدم): أقل من النطاق المرجعي (قد يشير إلى نقص الحديد، أو الأمراض المزمنة، أو أسباب أخرى).
مرتفع (زيادة عدد كريات الدم الحمراء): أعلى من النطاق المرجعي (قد يشير إلى الجفاف، أو أمراض الرئة، أو حالات أخرى).

ملاحظة: يرجى التوافق سريرياً. قد تتطلب التغيرات عن المستويات الطبيعية مزيدًا من التحقيق والإدارة.
"""
    };

    return d[label] ?? "-";
  } else {
    var d = {
      "Pulse Rate": """Frequência cardíaca em repouso:
Normal: 60-100 bpm.
Baixa: <60 bpm (Bradicardia).
Alta: >100 bpm (Taquicardia).
Nota: Correlacione clinicamente. Desvios podem indicar problemas de saúde e devem ser avaliados por um médico.
""",
      "Respiration Rate": """Taxa de respiração em repouso:
Normal: 12-20 respirações por minuto.
Baixa: <12 respirações por minuto (Bradipneia).
Alta: >20 respirações por minuto (Taquipneia).
Nota: Correlacione clinicamente. Desvios persistentes podem indicar problemas respiratórios ou sistêmicos subjacentes.
""",
      "Wellness Index": """Índice de bem-estar:
Ótimo: 8-10 (Indica excelente saúde e bem-estar).
Moderado: 5-7 (Algumas áreas podem precisar de atenção).
Baixo: <5 (Indica baixa saúde, necessitando de intervenção).
Nota: Correlacione clinicamente. O índice pode variar dependendo da metodologia usada e dos parâmetros medidos (saúde física, mental, estresse, estilo de vida).
""",
      "Stress Index": """Índice de estresse:
Baixo: 0-30 (Indica um estado relaxado e boa gestão do estresse).
Moderado: 31-60 (Níveis gerenciáveis; alguma intervenção pode ser necessária).
Alto: 61-384 (Indica estresse significativo, exigindo atenção imediata).
Nota: Correlacione clinicamente. O índice é derivado de parâmetros como variabilidade da frequência cardíaca e padrões respiratórios.
""",
      "Oxygen Saturation": """Saturação de oxigênio:
Normal: 95-100%.
Baixa: <95% (Pode indicar hipóxia; atenção médica necessária se persistente).
Crítica: <90% (Intervenção médica urgente necessária).
Nota: Correlacione clinicamente. Valores abaixo do normal podem indicar problemas respiratórios ou circulatórios e devem ser tratados rapidamente.
""",
      "Blood Pressure": """Pressão arterial:
Normal: 90-120 / 60-80 mmHg.
Elevada: Sistólica 120-129 mmHg e Diastólica <80 mmHg.
Hipertensão Estágio 1: Sistólica 130-139 mmHg ou Diastólica 80-89 mmHg.
Hipertensão Estágio 2: Sistólica >=140 mmHg ou Diastólica >=90 mmHg.
Hipotensão: Sistólica <90 mmHg ou Diastólica <60 mmHg.
Nota: Correlacione clinicamente. Valores fora da faixa normal podem indicar problemas cardiovasculares, renais ou sistêmicos.
""",
      "Hemoglobin A1C": """Hemoglobina A1C:
Normal: 4,0-5,6% (Indica controle saudável do açúcar no sangue).
Pré-diabetes: 5,7-6,4% (Risco aumentado de diabetes; recomenda-se modificação do estilo de vida).
Diabetes: >=6,5% (Diagnóstico de diabetes; requer intervenção médica).
Nota: HbA1c reflete os níveis médios de glicose no sangue nos últimos 2-3 meses. Correlacione clinicamente para um diagnóstico preciso.
""",
      "Hemoglobin": """Hemoglobina:
Normal: Dentro da faixa de referência para idade e sexo.
Baixa (Anemia): Abaixo da faixa de referência (pode indicar deficiência de ferro ou doença crônica).
Alta (Policitemia): Acima da faixa de referência (pode indicar desidratação ou doenças pulmonares).
Nota: Correlacione clinicamente. Desvios da normalidade podem exigir investigação adicional.
"""
    };
    return d[label] ?? "-";
  }
}

/*
Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
        //color: col ?? bgClr2,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: col ?? bgClr2)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == "Hemoglobin A1C"
            ? RichText(
                text: TextSpan(
                    text: "Hemoglobin A1C",
                    style: TxtStls.labelStl,
                    children: [TextSpan(text: " *", style: TxtStls.errorStl)]))
            : Apptextwidget(title, style: TxtStls.labelStl12),
        Apptextwidget(
          value == null ? "-" : value.toString().capitalize(),
          style: TxtStls.stl14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/Vitals/$url",
              height: 50,
              width: 50,
              filterQuality: FilterQuality.high,
            ),
            Visibility(
              visible: level!=null,
              child: Column(
                children: [
                  Container(
                    alignment: level.toString().capitalize()=="High"?Alignment.bottomCenter:level.toString().capitalize()=="Medium"?Alignment.center:Alignment.topCenter,
                    height: 60,
                    width: 15,
                    decoration: BoxDecoration(border: Border.all(color: hintClr),borderRadius: BorderRadius.circular(15)),
                    child: Container(width: 15,height: 30,decoration: BoxDecoration(color: levelcol??bgClr1,borderRadius: BorderRadius.circular(20)),),
                  ),
                  SizedBox(height: 2,),
                  Apptextwidget(("${level??"-"}").capitalize(),style: TxtStls.labelStl,)
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
*/

Widget button1({title, press, color = primary}) {
  return SizedBox(
    width: double.infinity,
    child: MaterialButton(
      elevation: 0,
      color: color,
      onPressed: press ?? () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Apptextwidget(title, style: TxtStls.wstl13),
    ),
  );
}

Widget entervitalfields(
    {title, controller, hintText, formatter, enabled, chnage, trigger}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      appspace(h: 10),
      customtextfiled(
          controller: controller,
          labelText: title,
          change: chnage,
          hintText: hintText,
          trigger: trigger,
          formatter: formatter,
          enabled: enabled)
    ],
  );
}

Widget mycupertinorow({label, child, w}) {
  return CupertinoFormRow(
      prefix: Apptextwidget(
        label ?? "",
        style: TxtStls.labelStl,
      ),
      child: SizedBox(width: w ?? 100, child: child));
}

Widget mycupertinorowvital(
    {label,
    w,
    controller,
    hintText,
    formatter,
    enabled,
    chnage,
    trigger,
    len}) {
  return CupertinoFormRow(
      prefix: Apptextwidget(
        label ?? "",
        style: TxtStls.labelStl,
      ),
      child: SizedBox(
          width: w ?? 100,
          child: customtextfiled(
              controller: controller,
              change: chnage,
              maxlen: len,
              //labelText: label,
              hintText: hintText,
              trigger: trigger,
              formatter: formatter,
              enabled: enabled)));
}

Widget customtextfiled(
    {controller,
    labelText,
    hintText,
    formatter,
    enabled,
    validator,
    maxlines,
    maxlen,
    change,
    trigger}) {
  return Appscalemedia(
    child: TextFormField(
      maxLines: maxlines ?? 1,
      enabled: enabled ?? true,
      inputFormatters: formatter ?? [],
      maxLength: maxlen ?? 5,
      onChanged: change,
      validator: validator ??
          (val) {
            if (val!.isEmpty) {
              return "";
            } else {
              return null;
            }
          },
      controller: controller,
      decoration: inputDecorationnoborder(
          hintText: hintText,
          //labelText: labelText,
          col: Colors.transparent),
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      textInputAction: trigger ?? TextInputAction.next,
    ),
  );
}

class Themeappbar extends StatelessWidget implements PreferredSizeWidget {
  bool leading, centtile;

  String title;
  Widget? lead;
  List<Widget>? act;
  Themeappbar(
      {super.key,
      this.leading = false,
      this.lead,
      this.act,
      required this.title,
      this.centtile = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: act,
      leading: leading
          ? lead ??
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: scaffoldbgcol,
                  ))
          : null,
      title: Apptextwidget(
        title,
        style: TxtStls.wstl16,
        overflow: TextOverflow.visible,
      ),
      elevation: 0.0,
      centerTitle: centtile,
      backgroundColor: transparentcol,
      scrolledUnderElevation: 0.0,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
