import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smart_money/app/components/form_field/form_field_widget.dart';
import 'package:smart_money/app/modules/launch/launch_controller.dart';

class ValueButtonWidget extends StatelessWidget {
  
  final LaunchController controller;

  ValueButtonWidget({this.controller});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: SizedBox(
            height: 60,
            child: FlatButton(
              child: Observer( 
                name: 'FlatButtonValueType',
                builder: (_) {
                  return Text('${controller.valueType} R\$', style: TextStyle(color: Colors.white, fontSize: 24));
                },
              ),
              onPressed: controller.changeValueType,
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
            child: FormFieldWidget(
              controller: controller.moneyMask,
              labelText: 'Valor',
              onChanged: (money) {
                controller.changeValue(controller.moneyMask.numberValue);
              }
            ),
          ),
        ),
      ],
    );
  }
}
