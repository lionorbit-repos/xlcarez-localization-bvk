import 'dart:developer';

import '../env/appexports.dart';

class Localizationcontroller extends ChangeNotifier {
  Locale? _locale = const Locale("en");

  Locale? get locale => _locale;

  List langugelist = [
    {"lable": "English", "loc": const Locale("en")},
    {"lable": "German", "loc": const Locale("de")},
    {"lable": "French", "loc": const Locale("fr")},
    {"lable": "Portuguese", "loc": const Locale("pt")},
    {"lable": "Arabic", "loc": const Locale("ar")},
    {"lable": "Italian", "loc": const Locale("it")},
    {"lable": "Ukrainian", "loc": const Locale("uk")},
    {"lable":"Spanish","loc":const Locale("es")}
  ];

  void setLocale(Locale locale) {
    var check = langugelist.any((ele) => ele["loc"] == locale);
    log(check.toString());
    log(locale.toString());
    _locale = check ? locale : const Locale("en");
    selectLanguage(language: _locale?.languageCode);
    log("the current locale is ${_locale?.languageCode}");
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }

  void selectLanguageid({language}) async {
    var box = await Hive.openBox('XLcarezstore');
    box.put('lanid', language);
    //   SharedPreferencesAsync sharedPreferences = SharedPreferencesAsync();
    //  await sharedPreferences.setInt("lanid", language);
    //notifyListeners();
  }

  void selectLanguage({language}) async {
    var box = await Hive.openBox('XLcarezstore');
    box.put('language', language);
    // SharedPreferencesAsync sharedPreferences = SharedPreferencesAsync();
    // await sharedPreferences.setString("language", language);
    //notifyListeners();
  }

  Future fetchlanguage()async{
    var box = await Hive.openBox('XLcarezstore');
    var language = box.get('language');
    if(language!=null){
   var check = langugelist.firstWhere((ele)=>ele["loc"]==Locale(language),orElse: ()=>{});
  // print(check["lable"]);
   return check["lable"]??"English";
    }
    else{
      return "English";
    }
    
  }
}
