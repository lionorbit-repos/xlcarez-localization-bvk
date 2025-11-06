import 'package:XLcarez/env/appexports.dart';
import 'package:XLcarez/l10n/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Consumer<Localizationcontroller> apptheme({required Widget home}) {
  return Consumer<Localizationcontroller>(
    builder: (_, ctr, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: genthemedata(),
        supportedLocales: L10n.all,
        locale: ctr.locale,
        //Locale("fr"),
        //ctr.locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: home,
      );
    },
  );
}

ThemeData genthemedata() {
  return ThemeData(
    scaffoldBackgroundColor: transparentcol,
    // textTheme: TextTheme(
    //   titleLarge: TxtStls.splashlablestyle,
    //     displayMedium: TxtStls.displaymeduin,
    //     displayLarge: TxtStls.displaylarge,
    //     displaySmall: TxtStls.displaysmall,
    //     labelLarge: TxtStls.labelarge,
    //     labelMedium: TxtStls.labelmeduin,
    //     labelSmall: TxtStls.labelsmall),
    chipTheme: ChipThemeData(
        labelStyle: TxtStls.wstl13,
        backgroundColor: primary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            side: BorderSide(color: primary))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: primary)),
    colorScheme: ColorScheme.fromSeed(seedColor: primary),
  );
}

MediaQueryData genratemediaquery(context) {
  return MediaQuery.of(context);
}
