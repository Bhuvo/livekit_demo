import 'package:demo/utils/size_util.dart';
import 'package:demo/utils/theme_util.dart';
import 'package:flutter/material.dart';

import '../constant/const.dart';

extension OutlinedButtonUtil on OutlinedButton {
  Widget originalButton(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style:  ButtonStyle(
        minimumSize: context.buttonSize,
        side: WidgetStateProperty.all(BorderSide(color: context.primary,width: 2)),
    shape: WidgetStateProperty.all(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
    ),
    ),surfaceTintColor:   WidgetStateProperty.all(context.primary),
      ),
    child: DefaultTextStyle(
        style: Constants.textStyle.copyWith(color: Colors.black),
        child: child!,  // Your child text widget
      ),
    );
  }
}