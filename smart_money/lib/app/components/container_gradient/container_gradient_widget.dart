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
      Positioned(
        top: 20,
        left: 0,
        right: 0,
        child: Container(
          child: Center(
            child: Text(
              'Saldo Atual',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 55,
        left: 0,
        right: 0,
        child: Container(
          child: Center(
            child: Text(
              'R\$ 0,00',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
        ),
      )
      ],
    );
  }
}
