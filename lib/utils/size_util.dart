import 'package:demo/widgets/m_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension SizeUtil on BuildContext{
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  WidgetStateProperty<Size?> get buttonSize => WidgetStatePropertyAll(Size(height * 0.1, width * 0.1));

  mShowDialog() => showDialog(context: this, builder: (context) => Dialog(
      insetPadding: EdgeInsets.all(8),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      child: MDialog()));
}