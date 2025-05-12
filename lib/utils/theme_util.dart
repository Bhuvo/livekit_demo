import 'package:flutter/material.dart';

import '../constant/theme.dart';

extension ThemeUtil on BuildContext {
  // Color get primary => Color(0xFF1D5BBF);
  ThemeData get theme => Theme.of(this);
  Color get primary => MTheme.primaryColor;
  Color get colorInActive => Colors.grey;
  Color? get iconColor => Theme.of(this).iconTheme.color;
  Color get cardColor => Theme.of(this).cardColor;
  Color? get surface => Theme.of(this).brightness == Brightness.light ? Colors.white : Colors.black;
  Color? get onSurface => Theme.of(this).colorScheme.onSurface;
  Color? get inverseSurface => Theme.of(this).colorScheme.inverseSurface;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get dividerColor => Theme.of(this).dividerColor;
  TextStyle? get caption => Theme.of(this).textTheme.bodySmall?.copyWith( fontSize: 12, fontWeight: FontWeight.w500, color: dividerColor);
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get overline => Theme.of(this).textTheme.labelSmall;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  Color get oppositeBubble => Theme.of(this).colorScheme.primary;
  Color get oppositeText => Colors.white;

  Gradient get gradient => const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: <Color>[Color(0xFF00AEBD),Color(0xFF1D5BBF), ],
  );
}

extension BrigthnessUtils on Brightness {
  bool get isDark => this == Brightness.dark;
  bool get isLight => this == Brightness.light;
  Brightness get invert => this == Brightness.dark ? Brightness.light : Brightness.dark;
}