
import 'package:demo/widgets/space.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final IconData? icon;
  final String? title, content;
  final Widget? child;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? padding;
  const InfoWidget({Key? key,
    this.icon,
    this.padding,
    this.title,
    this.content,
    this.textAlign,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(icon, size: 56, color: Colors.black),
            if (icon != null) const Space(),
            if (title != null)
              Text(
                  title!,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black),
                  textAlign: textAlign ?? TextAlign.center
              ),
            if (title != null) const Space(8),
            if (content != null)
              Text(
                  content!,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black),
                  textAlign: textAlign ?? TextAlign.center
              ),
            if (content != null) const Space(8),
            if (child != null) child!
          ],
        ),
      ),
    );
  }
}