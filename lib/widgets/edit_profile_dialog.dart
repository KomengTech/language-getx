import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../translations/labels.dart';

class EditProfileDialog extends StatelessWidget {
  EditProfileDialog({
    required this.title,
    required this.controller,
    required this.onPressed,
  });

  final String title;
  final TextEditingController controller;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        Text(
          '${Labels.settings.edit.tr} $title',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: TextField(
            controller: controller,
            autofocus: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: title,
              contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            onSubmitted: (val) {
              controller.text = val;
            },
          ),
        ),
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
            onPressed: onPressed,
            child: Text(Labels.settings.submit.tr,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        ),
      ],
    );
  }
}
