import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../constants/strings.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/edit_profile_dialog.dart';

class UserController extends GetxController {
  static final UserController to = Get.find();
  final _box = GetStorage();

  var _editController = TextEditingController();

  var name = ''.obs;
  var email = ''.obs;

  @override
  onReady() {
    super.onReady();
    if (_box.hasData(Strings.kName)) {
      name.value = _box.read(Strings.kName);
    } else {
      _box.write(Strings.kName, 'Default Name');
      name.value = _box.read(Strings.kName);
    }

    if (_box.hasData(Strings.kEmail)) {
      email.value = _box.read(Strings.kEmail);
    } else {
      _box.write(Strings.kEmail, 'Default Email');
      email.value = _box.read(Strings.kEmail);
    }
  }

  void editProfileDialog({
    required String type,
    required String title,
  }) {
    Get.dialog(
        CustomDialog(children: [
          EditProfileDialog(
              title: title,
              controller: _editController,
              onPressed: () async {
                if (_editController.text.isNotEmpty) {
                  switch (type) {
                    case Strings.kName:
                      {
                        await _box.write(Strings.kName, _editController.text);
                        name.value = _editController.text;
                      }
                      break;
                    case Strings.kEmail:
                      {
                        await _box.write(Strings.kEmail, _editController.text);
                        email.value = _editController.text;
                      }
                      break;
                  }
                  _editController.clear();
                  Get.back();
                }
              })
        ]),
        barrierDismissible: true);
  }
}
