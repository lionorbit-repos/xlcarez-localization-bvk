
// ignore_for_file: deprecated_member_use

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:XLcarez/env/appexports.dart';

pw.Widget arpdfConfigWidget(context,{val, lable, loc, font, font1}) {
    return pw.Directionality(textDirection: pw.TextDirection.rtl, child: pw.Padding(
      padding: const pw.EdgeInsets.all(8.0),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          // Interpretation Label
          pw.Text(
            "${fetchlocale(context).intrpret}:",
            style: pw.TextStyle(
                fontSize: 16, fontWeight: pw.FontWeight.bold, font: font),
          ),
          //Interpretation Values
          pw.Text(
            interpretonvalues(lable, loc),
            style: pw.TextStyle(fontSize: 14, font: font1 ?? font),
          ),
        ],
      ),
    ));
  }

  pw.Directionality arcolhead({lablel, font}) {
    return pw.Directionality(textDirection: pw.TextDirection.rtl, child: pw.Container(
        padding: const pw.EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        color: convertFlutterColorToPdfColor(primary),
        child: pw.Flexible(
            child: pw.Text("$lablel",
                style: pw.TextStyle(
                    fontSize: 12.0, color: PdfColors.white, font: font),
                textAlign: pw.TextAlign.center))));
  }

  pw.Page argenratepage({child, bg, loc}) {
    return pw.Page(
      //theme: pw.ThemeData.withFont(base: ttf),
      textDirection:
           pw.TextDirection.rtl,
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) => pw.Container(
          height: double.infinity,
          width: double.infinity,
          // decoration: pw.BoxDecoration(
          //     image: pw.DecorationImage(
          //         image: pw.MemoryImage(bg), fit: pw.BoxFit.cover)),
          child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.SizedBox(
                  height: 100,
                  width: 150,
                  child: pw.Image(pw.MemoryImage(bg)),
                ),
                pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        right: 60, left: 60, top: 20.0),
                    child: child ?? pw.SizedBox.shrink()),
              ])),
    );
  }

  pw.Directionality argenratelabel({label, vale, font}) {
    return pw.Directionality(textDirection: pw.TextDirection.rtl, child: pw.Row(children: [
      pw.Text("$label:",
          style: pw.TextStyle(
              font: font,
              fontSize: 12,
              color: convertFlutterColorToPdfColor(hintClr))),
      pw.SizedBox(width: 5),
      pw.Text(vale, style: pw.TextStyle(font: font, fontSize: 12)),
    ]));
  }

  pw.Directionality argenrateblerow({value, font}) {
    return pw.Directionality(textDirection: pw.TextDirection.rtl, child: pw.Text(value ?? "-",
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(
            font: font, color: convertFlutterColorToPdfColor(headerClr))));
  }
pw.Text genrateblerow({value, font}) {
    return  pw.Text(value ?? "-",
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(
            font: font, color: convertFlutterColorToPdfColor(headerClr)));
  }

  PdfColor convertFlutterColorToPdfColor(Color flutterColor) {
    return PdfColor.fromInt(flutterColor.value);
  }

  pw.Widget pdfConfigWidget(context,{val, lable, loc}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8.0),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          // Interpretation Label
          pw.Text(
            "${fetchlocale(context).intrpret}:",
            style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
          ),
          // Interpretation Values
          pw.Text(
            interpretonvalues(lable, loc),
            style: const pw.TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  pw.Container colhead({lablel}) {
    return pw.Container(
        padding: const pw.EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        color: convertFlutterColorToPdfColor(primary),
        child: pw.Flexible(
            child: pw.Text("$lablel",
                style:
                    const pw.TextStyle(fontSize: 12.0, color: PdfColors.white),
                textAlign: pw.TextAlign.center)));
  }

  pw.Page genratepage({child, bg}) {
    return pw.Page(
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) => pw.Container(
          height: double.infinity,
          width: double.infinity,
          // decoration: pw.BoxDecoration(
          //     image: pw.DecorationImage(
          //         image: pw.MemoryImage(bg), fit: pw.BoxFit.cover)),
          child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.SizedBox(
                  height: 100,
                  width: 150,
                  child: pw.Image(pw.MemoryImage(bg)),
                ),
                pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        right: 60, left: 60, top: 20.0),
                    child: child ?? pw.SizedBox.shrink()),
              ])),
    );
  }

  pw.Row genratelabel({label, vale}) {
    return pw.Row(children: [
      pw.Text("$label:",
          style: pw.TextStyle(
              fontSize: 12, color: convertFlutterColorToPdfColor(hintClr))),
      pw.SizedBox(width: 5),
      pw.Text(vale, style: const pw.TextStyle(fontSize: 12)),
    ]);
  }