import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:smart_money/app/components/container_gradient/container_gradient_widget.dart';

class HeaderWidget extends StatelessWidget {

  final balance;

  HeaderWidget({this.balance=0.0});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ContainerGradientWidget(
          colors: GradientColors.violet,
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                child: Center(
                  child: Text(
                    'Saldo Atual',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text('R\$ ${balance.toStringAsFixed(2)}', style: TextStyle(color: Colors.white, fontSize: 32)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
