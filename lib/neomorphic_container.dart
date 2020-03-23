import 'package:flutter/material.dart';
import 'package:neomorphic_design/neomorphic_theme.dart';

class NeomorphicContainer extends StatelessWidget {

  final double borderRadius;
  final double height;
  final double width;
  final double horizontalMargin;
  final double verticalMargin;
  final double horizontalPadding;
  final double verticalPadding;
  final Alignment alignment;
  final ContainerType containerType;
  final NeomorphicTheme theme;

  NeomorphicContainer({
    Key key,
    @required this.containerType,
    @required this.theme,
    this.borderRadius = 8.0,
    this.height,
    this.width,
    this.alignment = Alignment.topLeft, 
    this.horizontalMargin = .0, 
    this.verticalMargin = .0, 
    this.horizontalPadding = .0, 
    this.verticalPadding = .0
  }): super(key: key);


  @override
  Widget build(BuildContext context) => containerType == ContainerType.positive
      ? _positive(context)
      : _negative(context);

  Widget _negative(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: verticalMargin),
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalMargin),
          height: height,
          width: width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius), boxShadow: [
            BoxShadow(color: Theme.of(context).primaryColorLight, offset: Offset(theme.shadowOffset, theme.shadowOffset), blurRadius: theme.shadowBlurRadius),
            BoxShadow(color: Theme.of(context).primaryColorDark, offset: Offset(-theme.shadowOffset, -theme.shadowOffset), blurRadius: theme.shadowBlurRadius),
            BoxShadow(color: Theme.of(context).primaryColor, blurRadius: theme.shadowBlurRadius),
          ]),
        ),
      ),
    );
  }

  Widget _positive(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: verticalMargin),
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalMargin),
      height: height,
      width: width,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(borderRadius), boxShadow: [
        BoxShadow(color: Theme.of(context).primaryColorDark, offset: Offset(theme.shadowOffset, theme.shadowOffset), blurRadius: theme.shadowBlurRadius),
        BoxShadow(color: Theme.of(context).primaryColorLight, offset: Offset(-theme.shadowOffset, -theme.shadowOffset), blurRadius: theme.shadowBlurRadius)
      ]),
    );
  }

}

enum ContainerType {
  positive,
  negative
}
