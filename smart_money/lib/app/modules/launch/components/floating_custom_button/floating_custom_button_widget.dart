import 'package:flutter/material.dart';

class FloatingCustomButtonWidget extends StatelessWidget {
  final Widget child;
  final String heroTag;
  final Function onPressed;
  final Color backgroundColor;

  FloatingCustomButtonWidget(
      {this.child, this.heroTag, this.onPressed, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      elevation: 0,
      child: child,
    );
  }
}
