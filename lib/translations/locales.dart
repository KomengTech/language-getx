import '../models/export_models.dart';

class Locales {
  static Map<String, String> en = LocaleModel(
    app: LabelsAppModel(
      title: 'Language GetX',
    ),
    home: LabelsHomeModel(
      title: 'Home',
      name: 'Name',
      email: 'Email',
    ),
    settings: LabelsSettingsModel(
      title: 'Settings',
      edit: 'Edit',
      submit: 'Submit',
      language: 'Language',
      selectedLanguage: 'English',
      languageSelectionText: 'Select your preferred language',
      english: 'English',
      chinese: 'Chinese',
      portuguese: 'Portuguese',
    ),
  ).toJson();

  static Map<String, String> zh = LocaleModel(
    app: LabelsAppModel(
      title: '语 GetX',
    ),
    home: LabelsHomeModel(
      title: '主页',
      name: '名称',
      email: '电子邮件',
    ),
    settings: LabelsSettingsModel(
      title: '设定页面',
      edit: '编辑',
      submit: '提交',
      language: '语',
      selectedLanguage: '普通话',
      languageSelectionText: '选择您喜欢的语言',
      english: '英语',
      chinese: '普通话',
      portuguese: '葡萄牙语',
    ),
  ).toJson();

  static Map<String, String> pt = LocaleModel(
    app: LabelsAppModel(
      title: 'Língua GetX',
    ),
    home: LabelsHomeModel(
      title: 'Pagina Inicial',
      name: 'Nome',
      email: 'E-mail',
    ),
    settings: LabelsSettingsModel(
      title: 'Página de Configurações',
      edit: 'Editar',
      submit: 'Enviar',
      language: 'Língua',
      selectedLanguage: 'Português',
      languageSelectionText: 'Escolha o seu idioma preferido',
      english: 'Inglês',
      chinese: 'Chinês',
      portuguese: 'Português',
    ),
  ).toJson();
}
