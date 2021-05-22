import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog({required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      elevation: 25.0,
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
