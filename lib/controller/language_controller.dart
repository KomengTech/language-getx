import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/edit_language_dialog.dart';
import '../constants/strings.dart';
import '../constants/language_code.dart';

class LanguageController extends GetxController {
  static final LanguageController to = Get.find();
  final _box = GetStorage();

  var selectedLanguageCode = 'en'.obs;

  Locale? get currentLocale {
    if (_box.hasData(Strings.kLanguage)) {
      return Locale(_box.read(Strings.kLanguage));
    } else {
      _box.write(
          Strings.kLanguage, Locale(LanguageCode.kEnglish).toLanguageTag());
      return Locale(_box.read(Strings.kLanguage));
    }
  }

  void editLanguage() {
    Get.dialog(
      CustomDialog(children: [
        EditLanguageDialog(
          onPressed: () async {
            await _box.write(Strings.kLanguage, selectedLanguageCode.value);
            Get.updateLocale(Locale(selectedLanguageCode.value));
            Get.back();
          },
        )
      ]),
      barrierDismissible: false,
    );
  }
}
