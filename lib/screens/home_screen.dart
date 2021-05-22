import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/strings.dart';
import '../controller/export_controllers.dart';
import '../translations/labels.dart';

class HomeScreen extends StatelessWidget {
  final userController = UserController.to;
  final languageController = LanguageController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Labels.app.title.tr),
      ),
      body: Obx(() => Container(
            color: Colors.white,
            child: ListView(
              children: ListTile.divideTiles(context: context, tiles: [
                Container(
                  color: Colors.grey.shade200,
                  child: ListTile(
                    dense: true,
                    title: Text(Labels.home.title.tr),
                  ),
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.person),
                  title: Text(Labels.home.name.tr),
                  subtitle: Text(userController.name.value),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    userController.editProfileDialog(
                      type: Strings.kName,
                      title: Labels.home.name.tr,
                    );
                  },
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.email),
                  title: Text(Labels.home.email.tr),
                  subtitle: Text(userController.email.value),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    userController.editProfileDialog(
                      type: Strings.kEmail,
                      title: Labels.home.email.tr,
                    );
                  },
                ),
                Container(
                  color: Colors.grey.shade200,
                  child: ListTile(
                    dense: true,
                    title: Text(Labels.settings.title.tr),
                  ),
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.language),
                  title: Text(Labels.settings.language.tr),
                  subtitle: Text(Labels.settings.selectedLanguage.tr),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    languageController.editLanguage();
                  },
                ),
              ]).toList(),
            ),
          )),
    );
  }
}
