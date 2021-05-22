import 'locales.dart';
import '../constants/language_code.dart';

class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    LanguageCode.kEnglish: Locales.en,
    LanguageCode.kChinese: Locales.zh,
    LanguageCode.kPortuguese: Locales.pt,
  };
}
