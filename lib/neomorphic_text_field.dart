import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neomorphic_design/neomorphic_theme.dart';

class NeomorphicTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String initialValue;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final StrutStyle strutStyle;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions toolbarOptions;
  final bool showCursor;
  final bool obscureText;
  final bool autocorrect;
  final bool enableSuggestions;
  final bool autovalidate;
  final bool maxLengthEnforced;
  final int maxLines;
  final int minLines;
  final bool expands;
  final int maxLength;
  final ValueChanged<String> onChanged;
  final GestureTapCallback onTap;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius cursorRadius;
  final Color cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final InputCounterWidgetBuilder buildCounter;
  final String hintText;

  //neomorphic properties
  final _animationDuration = Duration(milliseconds: 60);
  final double borderRadius;
  final double width;
  final double horizontalMargin;
  final double verticalMargin;
  final double verticalPadding;
  final double horizontalPadding;
  final Icon leadingIcon;
  final Icon trailingIcon;
  final NeomorphicTheme theme;

  NeomorphicTextFormField({
    Key key,
    this.hintText,
    this.controller,
    this.initialValue,
    FocusNode focusNode,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.autovalidate = false,
    this.maxLengthEnforced = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.buildCounter,
    @required this.theme,
    this.leadingIcon,
    this.trailingIcon,
    this.borderRadius = 8.0,
    this.width,
    this.horizontalMargin = .0,
    this.verticalMargin= .0,
    this.verticalPadding = 4,
    this.horizontalPadding = 16,
  })  : this.focusNode = focusNode ??= FocusNode(),
        super(key: key);

  @override
  _NeomorphicTextFormFieldState createState() => _NeomorphicTextFormFieldState();
}

class _NeomorphicTextFormFieldState extends State<NeomorphicTextFormField> {
  List<BoxShadow> _shadow;
  TextFormField _textFormField;
  @override
  void initState() {
    _shadow = _normal();
    widget.focusNode.addListener(() {
      setState(() => widget.focusNode.hasFocus ? _shadow = _focused() : _normal());
    });
    _textFormField = TextFormField(
      decoration: InputDecoration(border: InputBorder.none, hintText: widget.hintText, hintStyle: widget.theme.textStyleLight, counterStyle: widget.theme.textStyleLight),
      controller: widget.controller,
      initialValue: widget.initialValue,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      textInputAction: widget.textInputAction,
      style: widget.theme.textStyleTextField,
      strutStyle: widget.strutStyle,
      textDirection: widget.textDirection,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      toolbarOptions: widget.toolbarOptions,
      showCursor: widget.showCursor,
      obscureText: widget.obscureText,
      autocorrect: widget.autocorrect,
      enableSuggestions: widget.enableSuggestions,
      autovalidate: widget.autovalidate,
      maxLengthEnforced: widget.maxLengthEnforced,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      cursorWidth: widget.cursorWidth,
      cursorRadius: widget.cursorRadius,
      cursorColor: widget.cursorColor,
      keyboardAppearance: widget.keyboardAppearance,
      scrollPadding: widget.scrollPadding,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      buildCounter: widget.buildCounter,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin, vertical: widget.verticalMargin),
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: AnimatedContainer(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: widget.verticalPadding, horizontal: widget.horizontalPadding),
          duration: widget._animationDuration,
          width: widget.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(widget.borderRadius), boxShadow: _shadow),
          child: _textFormField,
        ),
      ),
    );
  }

  List<BoxShadow> _normal() => [
        BoxShadow(
            color: widget.theme.lightColor,
            offset: Offset(widget.theme.shadowOffset, widget.theme.shadowOffset),
            blurRadius: widget.theme.shadowBlurRadius),
        BoxShadow(
            color: widget.theme.darkColor,
            offset: Offset(-widget.theme.shadowOffset, -widget.theme.shadowOffset),
            blurRadius: widget.theme.shadowBlurRadius),
        BoxShadow(color: widget.theme.baseColor, blurRadius: widget.theme.shadowBlurRadius),
      ];

  List<BoxShadow> _focused() => [
        BoxShadow(
            color: widget.theme.lightColor,
            offset: Offset(widget.theme.shadowOffset, widget.theme.shadowOffset),
            blurRadius: widget.theme.shadowBlurRadius,
            spreadRadius: -2),
        BoxShadow(
            color: widget.theme.darkColor,
            offset: Offset(-widget.theme.shadowOffset, -widget.theme.shadowOffset),
            blurRadius: widget.theme.shadowBlurRadius,
            spreadRadius: -2),
        BoxShadow(color: widget.theme.baseColor, spreadRadius: -3, blurRadius: widget.theme.shadowBlurRadius),
      ];
}
