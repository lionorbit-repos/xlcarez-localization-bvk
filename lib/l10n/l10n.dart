import 'dart:ui';

class L10n {
  static final all = [
    const Locale("en"),
    const Locale("de"),
    const Locale("fr"),
    const Locale("pt"),
    const Locale("ar"),
    const Locale("it"),
    const Locale("uk"),
    const Locale("es")
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'de':
        return "Deutsch";
      case 'fr':
        return "French";
      case 'pt':
        return "Portuguese";
      case 'ar':
        return "Arabic";
      case 'it':
        return "Italian";
      case 'uk':
        return "Ukrainian";
      case 'es':
      return "Spanish";  
      default:
        return 'English';
    }
  }
}
