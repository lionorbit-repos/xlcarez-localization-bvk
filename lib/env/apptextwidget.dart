// ignore_for_file: must_be_immutable

import 'package:XLcarez/env/appexports.dart';

class Apptextwidget extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final Locale? locale;
  final bool? softWrap;
  final int? maxLines;
  final String? semanticsLabel;
  final Color? selectionColor;
  final TextWidthBasis? textWidthBasis;
  final TextDirection? textDirection;
  const Apptextwidget(this.data,
      {super.key,
      this.style,
      this.textAlign,
      this.textDirection,
      this.strutStyle,
      this.locale,
      this.softWrap,
      this.overflow,
      this.maxLines,
      this.semanticsLabel,
      this.textWidthBasis,
      this.selectionColor});

  @override
  Widget build(BuildContext context) {
    return Consumer<Localizationcontroller>(builder: (context, ctrl, child) {
      return Text(
        data,
        textDirection: ctrl.locale == const Locale("ar")
            ? TextDirection.rtl
            : TextDirection.ltr,
        style: style,
        textScaler: TextScaler.noScaling,
      );
    });
  }
}

AppLocalizations fetchlocale(context) {
  return AppLocalizations.of(context)!;
}

class Appscalemedia extends StatelessWidget {
  Widget child;
  Appscalemedia({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Consumer<Localizationcontroller>(builder: (context, ctrl, q) {
      return Directionality(
          textDirection: ctrl.locale == const Locale("ar")
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: TextScaler.noScaling),
              child: child));
    });
  }
}
