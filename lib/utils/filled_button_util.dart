import 'package:demo/constant/const.dart';
import 'package:demo/utils/size_util.dart';
import 'package:demo/utils/theme_util.dart';
import 'package:flutter/material.dart';

extension FilledButtonStyleExtension on FilledButton {
  Widget greyButton() {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.all(10)),
        backgroundColor: WidgetStateProperty.all(Colors.blue.shade50),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: DefaultTextStyle(
        style: Constants.textStyle.copyWith(color: Colors.black),
        child: child!,  // Your child text widget
      ),
    );
  }

  Widget originalButton(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: context.buttonSize,
        backgroundColor: WidgetStatePropertyAll(context.primary),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      ),
      child: DefaultTextStyle(
        style: Constants.textStyle,
        child: child!,  // Your child text widget
      ),
    );
  }



}
