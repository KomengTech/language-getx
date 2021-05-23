# language_getx

A Language Translations Management App using GetX to support the development process.

## Getting Started

To add a new translation is a 3 step process. 

You start by going to either the **labels_app_model.dart** or **labels_home_model.dart** or **labels_settings_model.dart** in the **models folder**.

This is depending on which screen you want to add the translation to: **AppScreen()**, **HomeScreen()** or **SettingsScreen()**. 

For this app, we only have the **HomeScreen()** but will use all three label models in it.

### Step 1:
For this example go to **labels_app_model.dart**, add a **variable** to the model.
<pre lang="javascript"><code>
final String title;
</code></pre>

### Step 2:
Then add the same **variable** to the **toJson()** function.
<pre lang="javascript"><code>
Map<int, dynamic> toJson() {
    return {
      1: title,
    };
  }
</code></pre>

### Step 3:
Finally add the **variable** to the class with the **required** syntax.
<pre lang="javascript"><code>
const LabelsAppModel({
    required this.title,
  });
</code></pre>
The **required** syntax will create the first **MAGIC**, where it will show errors in **labels.dart** and **locales.dart** files.
This error is created from the polymorphism of the classes by using the LabelsAppModel() in both of this files.
The error is a form of reminder for the developer to add in the the relevant key-value pair for the translation.

### Step 3.1:
Go to labels.dart file in the translations folder and fix the error by adding the "key" for the translation.
<pre lang="javascript"><code>
static const LabelsAppModel app = const LabelsAppModel(
    title: 'app_title',
  );
</code></pre>

### Step 3.2:
Go to locales.dart file in the translations folder and fix the error by adding the "value" for the translation.
<pre lang="javascript"><code>
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

The toJson() for the LocaleModel(): locale_model.dart in the models folder, is the second MAGIC where it links the "key" in the labels.dart file and the "value" in the locales.dart file into a MAP for the translation to happen in app_translation.dart that is in the translations folder.
<pre lang="javascript"><code>
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
