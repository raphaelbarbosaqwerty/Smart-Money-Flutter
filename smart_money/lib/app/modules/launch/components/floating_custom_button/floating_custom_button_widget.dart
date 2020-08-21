import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FloatingCustomButtonWidget extends StatelessWidget {

  final child;
  final heroTag;
  final onPressed;

  FloatingCustomButtonWidget({this.child, this.heroTag, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      backgroundColor: Hexcolor('#34495e'),
      elevation: 0,
      child: child,
    );
  }
}
