import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/shared/components/money_balance/money_balance_controller.dart';

class MoneyBalanceWidget extends StatefulWidget {
  
  final double fontSize;
  final color;

  MoneyBalanceWidget({this.fontSize, this.color});

  @override
  _MoneyBalanceWidgetState createState() => _MoneyBalanceWidgetState();
}

class _MoneyBalanceWidgetState extends ModularState<MoneyBalanceWidget, MoneyBalanceController> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      name: 'MoneyBalance',
      builder: (_) {
        return Text('R\$ ${controller.balanceStore.value.toStringAsFixed(2)}', style: TextStyle(color: widget.color, fontSize: widget.fontSize)); 
      },
    );
  }
}
