import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/language_code.dart';
import '../controller/language_controller.dart';
import '../translations/labels.dart';

class EditLanguageDialog extends StatelessWidget {
  EditLanguageDialog({
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            color: Colors.white,
            child: Text(Labels.settings.languageSelectionText.tr)),
        Flexible(
          child: LanguageList(), //Custom ListView
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            ),
            onPressed: onPressed(),
            child: Text(Labels.settings.submit.tr),
          ),
        ),
      ],
    );
  }
}

class LanguageList extends StatefulWidget {
  @override
  _LanguageListState createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {
  final languageController = LanguageController.to;
  List<LanguageTileModel> sampleData = <LanguageTileModel>[];

  @override
  void initState() {
    super.initState();
    sampleData.add(LanguageTileModel(
        title: Labels.settings.english.tr,
        selected: false,
        languageCode: LanguageCode.kEnglish));
    sampleData.add(LanguageTileModel(
        title: Labels.settings.chinese.tr,
        selected: false,
        languageCode: LanguageCode.kChinese));
    sampleData.add(LanguageTileModel(
        title: Labels.settings.portuguese.tr,
        selected: false,
        languageCode: LanguageCode.kPortuguese));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                sampleData.forEach((element) => element.selected = false);
                sampleData[index].selected = true;
                languageController.selectedLanguageCode.value =
                    sampleData[index].languageCode;
              });
            },
            child: LanguageTile(sampleData[index]),
          );
        },
      ),
    );
  }
}

class LanguageTileModel {
  bool selected;
  String title;
  String languageCode;

  LanguageTileModel({
    required this.selected,
    required this.title,
    required this.languageCode,
  });
}

class LanguageTile extends StatelessWidget {
  final LanguageTileModel model;
  LanguageTile(this.model);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(model.title),
          this.model.selected
              ? Icon(
                  Icons.radio_button_checked,
                  color: Colors.blue,
                )
              : Icon(Icons.radio_button_unchecked),
        ],
      ),
    );
  }
}
