import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neomorphic_design/neomorphic_theme.dart';

class NeomorphicCheckbox extends StatefulWidget {
  static const _defaultCheckboxDimension = 24.0;

  final bool isChecked;
  final Function onCheck;
  final double borderRadius;
  final double height;
  final double width;
  final double horizontalMargin;
  final double verticalMargin;
  final double horizontalPadding;
  final double verticalPadding;
  final Icon checkedIcon;
  final Icon uncheckedIcon;
  final Color checkedColor;
  final Color uncheckedColor;
  final Duration checkAnimationDuration;
  final NeomorphicTheme theme;

  NeomorphicCheckbox(
      {Key key,
        this.isChecked,
        @required this.theme,
        this.borderRadius = 8.0,
        this.height = _defaultCheckboxDimension,
        this.width = _defaultCheckboxDimension,
        this.horizontalMargin = .0,
        this.verticalMargin= .0,
        this.horizontalPadding = 8.0,
        this.verticalPadding = 8.0,
        this.onCheck,
        this.checkedIcon,
        this.uncheckedIcon,
        this.checkedColor,
        this.uncheckedColor,
        this.checkAnimationDuration = const Duration(milliseconds: 60)}) : super(key: key) {
    if (checkedIcon != null && checkedIcon.size != min(width, height) / 2 ||
        uncheckedIcon != null && uncheckedIcon.size != min(width, height) / 2) {
      throw Exception('Icon size has to be half of the minor between height and width');
    }
  }

  @override
  _NeomorphicCheckboxState createState() => _NeomorphicCheckboxState();
}

class _NeomorphicCheckboxState extends State<NeomorphicCheckbox> {
  bool _isChecked;
  List<BoxShadow> _shadow;

  @override
  void initState() {
    _isChecked = widget.isChecked;
    _shadow = _isChecked ? _checked() : _unchecked();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onTapCancel: onTapCancel,
        child: AnimatedContainer(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: widget.horizontalMargin, vertical: widget.verticalMargin),
            padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding, vertical: widget.verticalPadding),
            duration: widget.checkAnimationDuration,
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(widget.borderRadius), boxShadow: _shadow),
            child: Center(
              child: _isChecked ? widget.checkedIcon : widget.uncheckedIcon,
            )));
  }

  void onTapDown(TapDownDetails detail) {
    setState(() {
      _shadow = _isChecked ? _unchecked() : _checked();
      _isChecked = !_isChecked;
    });
  }

  void onTapUp(TapUpDetails detail) {
    widget.onCheck?.call(_isChecked);
  }

  void onTapCancel() {
    setState(() => _shadow = _isChecked ? _checked() : _unchecked());
  }

  List<BoxShadow> _unchecked() => [
    BoxShadow(
        color: widget.theme.darkColor,
        offset: Offset(widget.theme.shadowOffset, widget.theme.shadowOffset),
        blurRadius: widget.theme.shadowBlurRadius),
    BoxShadow(
        color: widget.theme.lightColor,
        offset: Offset(-widget.theme.shadowOffset, -widget.theme.shadowOffset),
        blurRadius: widget.theme.shadowBlurRadius),
    BoxShadow(color: widget.uncheckedColor ?? widget.theme.baseColor),
    BoxShadow(color: widget.theme.baseColor, spreadRadius: -1)
  ];

  List<BoxShadow> _checked() => [
    BoxShadow(
        color: widget.theme.lightColor,
        offset: Offset(widget.theme.shadowOffset, widget.theme.shadowOffset),
        blurRadius: widget.theme.shadowBlurRadius),
    BoxShadow(
        color: widget.theme.darkColor,
        offset: Offset(-widget.theme.shadowOffset, -widget.theme.shadowOffset),
        blurRadius: widget.theme.shadowBlurRadius),
    BoxShadow(color: widget.checkedColor ?? widget.theme.baseColor),
    BoxShadow(color: widget.theme.baseColor, spreadRadius: -1)
  ];
}
