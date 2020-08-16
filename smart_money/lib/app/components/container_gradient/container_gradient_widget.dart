import 'package:flutter/material.dart';

class ContainerGradientWidget extends StatelessWidget {
  final List<Color> colors;

  const ContainerGradientWidget({this.colors});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Container(
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: colors,
          ),
        ),
      ),
      ],
    );
  }
}
