import 'package:demo/utils/navigation_util.dart';
import 'package:demo/utils/size_util.dart';
import 'package:demo/utils/theme_util.dart';
import 'package:flutter/material.dart';

class MCloseButton extends StatelessWidget {
  const MCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pop(),
      child: Container(
        width:context.width * 0.07,
        height: context.height * 0.07,
        decoration: BoxDecoration(
            color: context.primary,
            gradient:context.gradient,
            shape: BoxShape.circle
        ),
        child: Icon(Icons.close_rounded,color: Colors.white,),
      ),
    );
  }
}
