import 'package:demo/utils/size_util.dart';
import 'package:flutter/material.dart';

class MFilledButton extends StatelessWidget {
  final ButtonStyle? style;
  final Widget? child;
  const MFilledButton({super.key, this.style, this.child});

  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: (){}, style: style ??  ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
        backgroundColor: WidgetStatePropertyAll(Colors.blue.shade50),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)))),
      child:child?? Text('View All',style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.black),),);
  }
}