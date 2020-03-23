import 'package:flutter/material.dart';

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

  NeomorphicTheme({
    this.lightColor,
    this.darkColor,
    this.baseColor,
    this.textStyleLight,
    this.textStyleDark,
    this.textStyleButtonLabel,
    this.textStyleTextField,
    this.shadowOffset = 5.0,
    this.shadowBlurRadius = 16.0
  });
}