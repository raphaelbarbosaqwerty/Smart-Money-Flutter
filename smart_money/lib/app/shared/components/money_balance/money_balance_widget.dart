import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
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

  var moneyMask = MoneyMaskedTextController(leftSymbol: '');

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Text('R\$ ${controller.value}', style: TextStyle(color: widget.color, fontSize: widget.fontSize)); 
      },
    );
  }
}
