import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/components/floating_custom_button/floating_custom_button_widget.dart';
import 'package:smart_money/app/modules/launch/launch_controller.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';

class GpsButtonWidget extends StatelessWidget {

  final Entrie entryObject;
  final LaunchController controller;

  const GpsButtonWidget({Key key, this.entryObject, this.controller}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return FloatingCustomButtonWidget(
          heroTag: 'Pin',
          backgroundColor: controller.gpsStore.latitude != 0.0 ? Colors.blueAccent : Hexcolor('#34495e'),
          onPressed: controller.activateLocalization,
          child: controller.loading ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white)) : Icon(Icons.pin_drop),
        );
      },
    );
  }
}
