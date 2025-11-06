// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:XLcarez/env/appexports.dart';
import 'package:flutter/cupertino.dart';

Widget appdailog(context, {alert, content, actionsyes,ationtitleno,ationtitleyes,actionno,ationtitlextra,actionextra}) {
  if (Platform.isIOS) {
    return CupertinoAlertDialog(title: alert, content: content, actions: [
      Visibility(
        visible: actionno!=null,
        child: CupertinoButton(
            onPressed: actionno ??
                () {
                  Navigator.pop(context);
                },
            child: Apptextwidget(
             ationtitleno??"Cancel",
              style: TxtStls.stl14,
            )),
      ),
      Visibility(
        visible: actionsyes!=null,
        child: CupertinoButton(
            onPressed: actionsyes??(){},
            child: Apptextwidget(
              ationtitleyes??"Ok",
              style: TxtStls.stl14,
            )),
      ),
      Visibility(
        visible: actionextra!=null,
        child: CupertinoButton(
            onPressed: actionextra??(){},
            child: Apptextwidget(
              ationtitlextra??"Ok",
              style: TxtStls.stl14,
            )),
      )
    ]);
  } else {
    return AlertDialog(
       surfaceTintColor: hintClr,
        backgroundColor: bgClr1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        titlePadding: const EdgeInsets.all(15),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        actionsPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      title: alert,
      content: content,
      actions: [
        Visibility(
          visible: actionno!=null,
          child: TextButton(
              onPressed:actionno??() {
                Navigator.pop(context);
              },
              child: Apptextwidget(
               ationtitleno??"Cancel",
                style: TxtStls.stl14,
              )),
        ),
         Visibility(
          visible: actionsyes!=null,
          child: TextButton(
              onPressed:actionsyes??(){},
              child: Apptextwidget(
               ationtitleyes??"Ok",
                style: TxtStls.stl14,
              )),
        ),
        Visibility(
        visible: actionextra!=null,
        child: CupertinoButton(
            onPressed: actionextra??(){},
            child: Apptextwidget(
              ationtitlextra??"Ok",
              style: TxtStls.stl14,
            )),
      )
      ],
    );
  }
}

void showSheet({context,required Widget child}) {
    showModalBottomSheet(
      isDismissible: true,
      shape: ShapeBorder.lerp(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        0.5,
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return child;
      },
    );
  }
