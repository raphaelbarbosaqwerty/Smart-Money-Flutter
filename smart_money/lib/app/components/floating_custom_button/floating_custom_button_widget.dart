import 'package:flutter/material.dart';

class FloatingCustomButtonWidget extends StatelessWidget {
  final Widget child;
  final String heroTag;
  final Function onPressed;
  final Color backgroundColor;
  final double elevation;

  FloatingCustomButtonWidget(
      {this.child, this.heroTag, this.elevation, this.onPressed, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      elevation: elevation,
      child: child,
    );
  }
}
