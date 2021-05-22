class LabelsSettingsModel {
  const LabelsSettingsModel({
    required this.title,
    required this.edit,
    required this.submit,
    required this.language,
    required this.selectedLanguage,
    required this.languageSelectionText,
    required this.english,
    required this.chinese,
    required this.portuguese,
  });

  final String title;
  final String edit;
  final String submit;
  final String language;
  final String selectedLanguage;
  final String languageSelectionText;
  final String english;
  final String chinese;
  final String portuguese;

  Map<int, dynamic> toJson() {
    return {
      1: title,
      2: edit,
      3: submit,
      4: language,
      5: selectedLanguage,
      6: languageSelectionText,
      7: english,
      8: chinese,
      9: portuguese,
    };
  }
}
