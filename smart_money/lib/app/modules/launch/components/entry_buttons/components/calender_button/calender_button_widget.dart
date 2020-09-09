import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/modules/launch/components/floating_custom_button/floating_custom_button_widget.dart';
import 'package:smart_money/app/modules/launch/launch_controller.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';

class CalenderButtonWidget extends StatelessWidget {
  final LaunchController controller;
  final Entrie entryObject;

  const CalenderButtonWidget({Key key, this.controller, this.entryObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return FloatingCustomButtonWidget(
          heroTag: 'Calender',
          backgroundColor: entryObject?.entryAt != null ? Colors.blueAccent : Hexcolor('#34495e'),
          onPressed: () {
            print('Configure Table Calendar');
          },
          child: Icon(Icons.calendar_today),
        );
      },
    );
  }
}
