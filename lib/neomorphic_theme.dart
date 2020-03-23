import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class NeomorphicTheme {
  final Color lightColor;
  final Color darkColor;
  final Color baseColor;
  final TextStyle textStyleLight;
  final TextStyle textStyleDark;
  final TextStyle textStyleButtonLabel;
  final TextStyle textStyleTextField;
  final double shadowOffset;
  final double shadowBlurRadius;

  NeomorphicTheme._(
    this.lightColor,
    this.darkColor,
    this.baseColor,
    this.textStyleLight,
    this.textStyleDark,
    this.textStyleButtonLabel,
    this.textStyleTextField,
    this.shadowOffset,
    this.shadowBlurRadius,
  );

  static void init({
    Color lightColor,
    Color darkColor,
    Color baseColor,
    TextStyle textStyleLight,
    TextStyle textStyleDark,
    TextStyle textStyleButtonLabel,
    TextStyle textStyleTextField,
    double shadowOffset = 5.0,
    double shadowBlurRadius = 16.0
  }) => getIt.registerSingleton<NeomorphicTheme>(NeomorphicTheme._(
      lightColor,
      darkColor,
      baseColor,
      textStyleLight,
      textStyleDark,
      textStyleButtonLabel,
      textStyleTextField,
      shadowOffset,
      shadowBlurRadius,
  ), signalsReady: true);
}