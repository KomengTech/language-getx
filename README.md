# Getting Started

A Language Translations Management App using GetX to support the development process.

## Setup:
Setup by adding **GetMaterialApp()** in the **main.dart** and **AppTranslation()** in the **app_translation.dart**. This app will have three translations.
<pre lang="javascript"><code>
main.dart

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Language GetX',
      debugShowCheckedModeBanner: false,
      locale: Locale('en'),
      translationsKeys: AppTranslation.translations,
      home: HomeScreen(),
    );
  }
}
</code></pre>

<pre lang="javascript"><code>
app_translation.dart

class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    LanguageCode.kEnglish: Locales.en,
    LanguageCode.kChinese: Locales.zh,
    LanguageCode.kPortuguese: Locales.pt,
  };
}
</code></pre>

## Adding Translation:
To add a new translation is a *3 Step Process**. 

You start by going to either the **labels_app_model.dart** or **labels_home_model.dart** or **labels_settings_model.dart** in the **models folder**.

This is depending on which screen you want to add the translation to: **AppScreen()**, **HomeScreen()** or **SettingsScreen()**. 

For this app, we only have the **HomeScreen()** but will use all three label models in it.

### Step 1:
For this example go to **labels_app_model.dart**, add a **variable** to the model.
<pre lang="javascript"><code>
labels_app_model.dart

final String title;
</code></pre>

### Step 2:
Then add the same **variable** to the **toJson()** function.
<pre lang="javascript"><code>
labels_app_model.dart

Map<int, dynamic> toJson() {
    return {
      1: title,
    };
  }
</code></pre>

### Step 3:
Finally add the **variable** to the class with the **"required"** syntax.
<pre lang="javascript"><code>
labels_app_model.dart

const LabelsAppModel({
    required this.title,
  });
</code></pre>
The **required** syntax will create the first **MAGIC**, where it will show errors in **labels.dart** and **locales.dart** files.
This error is created from the polymorphism of the classes by using the **LabelsAppModel()** in both of this files.
The error is a form of reminder for the developer to add in the the relevant **key-value pair** for the translation.
<pre lang="javascript"><code>
labels_app_model.dart

class LabelsAppModel {
  const LabelsAppModel({
    required this.title,
  });

  final String title;

  Map<int, dynamic> toJson() {
    return {
      1: title,
    };
  }
}
</code></pre>

### Step 3.1:
Go to **labels.dart** file in the **translations folder** and fix the error by adding the **"key"** for the translation.
<pre lang="javascript"><code>
labels.dart

static const LabelsAppModel app = const LabelsAppModel(
    title: 'app_title',
  );
</code></pre>

### Step 3.2:
Go to **locales.dart** file in the **translations folder** and fix the error by adding the **"value"** for the translation.
<pre lang="javascript"><code>
locales.dart

static Map<String, String> en = LocaleModel(
    app: LabelsAppModel(
      title: 'Language GetX',
    ),
  ).toJson();
    
static Map<String, String> zh = LocaleModel(
    app: LabelsAppModel(
      title: '语 GetX',
    ),
 ).toJson();
    
static Map<String, String> pt = LocaleModel(
    app: LabelsAppModel(
      title: 'Língua GetX',
    ),
 ).toJson();
</code></pre>

The **toJson()** for the **LocaleModel()**: **locale_model.dart** in the **models folder**, is the second **MAGIC** where it links the **"key"** in the **labels.dart** file and the **"value"** in the **locales.dart** file into a **MAP {key: value}** for the translation to happen in **app_translation.dart** that is in the **translations folder**.
<pre lang="javascript"><code>
locale_model.dart

Map<String, String> toJson() {
    var data = <String, String>{};

    Labels.app.toJson().forEach((keyLabels, valueLabels) {
      app.toJson().forEach((key, value) {
        if (keyLabels == key) {
          data.putIfAbsent(valueLabels, () => value);
        }
      });
    });

    return data;
  }
</code></pre>

## Usage:
After the setup, to use the variable you can add the translation in as **Labels.app.title.tr**, the **.tr** is a GetX function that translate the value.
<pre lang="javascript"><code>
home_screen.dart

class HomeScreen extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
     title: Text(Labels.app.title.tr),
    ),
   );
  }
}
</code></pre>

## Adding Additional Translation Model:
To add another label model you can add the model in the **locale_model.dart** file. For example adding a labels home model:
<pre lang="javascript"><code>
locale_model.dart

class LocaleModel {
  LocaleModel({
    required this.app,
    required this.home,
  });

  final LabelsAppModel app;
  final LabelsHomeModel home;

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

    return data;
  }
}
</code></pre>
