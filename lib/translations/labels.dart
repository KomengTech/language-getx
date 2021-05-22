import '../models/export_models.dart';

class Labels {
  Labels._();

  static const LabelsAppModel app = const LabelsAppModel(
    title: 'app_title',
  );

  static const LabelsHomeModel home = const LabelsHomeModel(
    title: 'home_title',
    name: 'home_name',
    email: 'home_email',
  );

  static const LabelsSettingsModel settings = const LabelsSettingsModel(
    title: 'settings_title',
    edit: 'settings_edit',
    submit: 'settings_submit',
    language: 'settings_language',
    selectedLanguage: 'settings_selected_language',
    languageSelectionText: 'settings_language_selection_text',
    english: 'settings_english',
    chinese: 'settings_chinese',
    portuguese: 'settings_portuguese',
  );
}
