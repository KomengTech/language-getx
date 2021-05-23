# language_getx

A Language Translations Management App using GetX to support the development process.

## Getting Started

To add a new translation is a 3 step process. 

You start by going to either the labels_app_model.dart or labels_home_model.dart or labels_settings_model.dart in the models folder.

This is depending on which screen you want to add the translation to: AppScreen(), HomeScreen() or SettingsScreen(). 

For this app, we only have the HomeScreen() but will use all three label models in it.

### Step 1:
For this example go to labels_app_model.dart, add a variable to the model.
<pre lang="javascript"><code>
final String title;
</code></pre>

### Step 2:
Then add the same variable to the toJson() function.
<pre lang="javascript"><code>
Map<int, dynamic> toJson() {
    return {
      1: title,
    };
  }
</code></pre>

### Step 3:
For this example go to labels_app_model.dart, add a variable to the model.
<pre lang="javascript"><code>
final String title;
</code></pre>
