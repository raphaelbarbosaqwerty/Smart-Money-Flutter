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

  // var moneyMask = MoneyMaskedTextController(leftSymbol: '');

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
    
  //   moneyMask.updateValue(controller.value);
  //   moneyMask.afterChange = (String masked, double raw) {
  //     print("$masked | $raw");
  //   };
    
  //   // Future.delayed(Duration(milliseconds: 1000)).then((value) {
  //   //   _password.value = _password.value.copyWith(
  //   //     text: controller.internalPassword == null ? "" : controller.internalPassword,
  //   //     selection: TextSelection(
  //   //       baseOffset: controller.internalPassword == null ? 0 : controller.internalPassword.length, 
  //   //       extentOffset: controller.internalPassword == null ? 0 : controller.internalPassword.length
  //   //     )
  //   //   );

  //   //   _username.value = _username.value.copyWith(
  //   //     text: controller.internalUsername == null ? "" : controller.internalUsername 
  //   //   );

  //   // });
  // } 
  
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
