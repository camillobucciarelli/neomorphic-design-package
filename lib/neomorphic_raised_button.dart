import 'package:flutter/material.dart';
import 'package:neomorphic_design/neomorphic_theme.dart';

class NeomorphicRaisedButton extends StatefulWidget {

  final String label;
  final Function onPressed;
  final double borderRadius;
  final double height;
  final double width;
  final double horizontalMargin;
  final double verticalMargin;
  final double horizontalPadding;
  final double verticalPadding;
  final TextAlign textAlignment;
  final Icon leadingIcon;
  final Icon trailingIcon;
  final Duration pressAnimationDuration;
  final NeomorphicTheme theme;

  NeomorphicRaisedButton({
    Key key,
    this.label,
    @required this.theme,
    this.onPressed,
    this.borderRadius = 8.0,
    this.height,
    this.width,
    this.horizontalMargin = .0,
    this.verticalMargin= .0,
    this.horizontalPadding = 8.0,
    this.verticalPadding = 8.0,
    this.leadingIcon,
    this.trailingIcon,
    this.textAlignment = TextAlign.center,
    this.pressAnimationDuration = const Duration(milliseconds: 60)
  }): super(key: key);

  double get _pressedShadowOffset => (theme.shadowOffset * 2) / 5;

  @override
  _NeomorphicRaisedButtonState createState() => _NeomorphicRaisedButtonState();
}

class _NeomorphicRaisedButtonState extends State<NeomorphicRaisedButton> {

  List<BoxShadow> _shadow;

  @override
  void initState() {
    _shadow = _normal();
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
          duration: widget.pressAnimationDuration,
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              color: widget.theme.baseColor,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              boxShadow: _shadow
          ),
          child: Row(
            children: <Widget>[
              widget.leadingIcon,
              Expanded(
                  child: Text(widget.label, textAlign: widget.textAlignment, style: widget.theme.textStyleButtonLabel,)
              ),
              widget.trailingIcon
            ]..removeWhere((item)=> item == null),
          )
      ),
    );
  }

  void onTapDown(TapDownDetails detail) {
    setState(() => _shadow = _pressed());
  }

  void onTapUp(TapUpDetails detail) {
    setState(() => _shadow = _normal());
    widget.onPressed?.call();
  }

  void onTapCancel() {
    setState(() => _shadow = _normal());
  }

  List<BoxShadow> _normal() => [
    BoxShadow(
        color: widget.theme.darkColor,
        offset: Offset(widget.theme.shadowOffset, widget.theme.shadowOffset),
        blurRadius: widget.theme.shadowBlurRadius
    ),
    BoxShadow(
        color: widget.theme.lightColor,
        offset: Offset(-widget.theme.shadowOffset, -widget.theme.shadowOffset),
        blurRadius: widget.theme.shadowBlurRadius
    )
  ];

  List<BoxShadow> _pressed() => [
    BoxShadow(
        color: widget.theme.darkColor,
        offset: Offset(widget._pressedShadowOffset, widget._pressedShadowOffset),
        blurRadius: widget.theme.shadowBlurRadius
    ),
    BoxShadow(
        color: widget.theme.lightColor,
        offset: Offset(-widget._pressedShadowOffset, -widget._pressedShadowOffset),
        blurRadius: widget.theme.shadowBlurRadius
    )
  ];

}
