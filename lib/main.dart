import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controller/export_controllers.dart';
import 'screens/home_screen.dart';
import 'translations/app_translation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put<LanguageController>(LanguageController());
  Get.put<UserController>(UserController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final languageController = LanguageController.to;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Language GetX',
      debugShowCheckedModeBanner: false,
      locale: languageController.currentLocale,
      translationsKeys: AppTranslation.translations,
      home: HomeScreen(),
    );
  }
}
