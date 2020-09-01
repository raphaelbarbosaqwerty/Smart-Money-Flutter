import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../app/components/container_gradient/container_gradient_widget.dart';
import '../../../../../app/modules/home/home_controller.dart';

class HeaderWidget extends StatelessWidget {

  final HomeController controller;

  HeaderWidget({this.controller});

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
              child: Observer(
                builder: (_) {
                  return Center(
                    child: Text('R\$ ${controller.balanceStore.value.toStringAsFixed(2)}', style: TextStyle(color: Colors.white, fontSize: 32)),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
