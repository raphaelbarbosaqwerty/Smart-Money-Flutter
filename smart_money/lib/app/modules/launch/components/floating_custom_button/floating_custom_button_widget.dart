import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FloatingCustomButtonWidget extends StatelessWidget {

  final child;
  final heroTag;
  final onPressed;
  final backgroundColor;

  FloatingCustomButtonWidget({this.child, this.heroTag, this.onPressed, this.backgroundColor});

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
