import 'package:language_getx/models/export_models.dart';
import 'package:language_getx/translations/labels.dart';

class LocaleModel {
  LocaleModel({
    required this.app,
    required this.home,
    required this.settings,
  });

  final LabelsAppModel app;
  final LabelsHomeModel home;
  final LabelsSettingsModel settings;

  Map<String, String> toJson() {
    var data = <String, String>{};

    Labels.app.toJson().forEach((keyLabels, valueLabels) {
      app.toJson().forEach((key, value) {
        if (keyLabels == key) {
          data.putIfAbsent(valueLabels, () => value);
        }
      });
    });

    Labels.home.toJson().forEach((keyLabels, valueLabels) {
      home.toJson().forEach((key, value) {
        if (keyLabels == key) {
          data.putIfAbsent(valueLabels, () => value);
        }
      });
    });

    Labels.settings.toJson().forEach((keyLabels, valueLabels) {
      settings.toJson().forEach((key, value) {
        if (keyLabels == key) {
          data.putIfAbsent(valueLabels, () => value);
        }
      });
    });

    return data;
  }
}
