import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/components/floating_custom_button/floating_custom_button_widget.dart';
import 'package:smart_money/app/modules/launch/launch_controller.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';

import 'stores/calender_store_widget.dart';

class CalenderButtonWidget extends StatefulWidget {
  final LaunchController controller;
  final Entrie entryObject;

  const CalenderButtonWidget({Key key, this.controller, this.entryObject}) : super(key: key);

  @override
  _CalenderButtonWidgetState createState() => _CalenderButtonWidgetState();
}

class _CalenderButtonWidgetState extends State<CalenderButtonWidget> {

  CalenderStore calenderStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    return FloatingCustomButtonWidget(
      heroTag: 'Calender',
      backgroundColor: widget.entryObject?.entryAt != null || calenderStore.getDateTime() != null ? Colors.blueAccent : Hexcolor('#34495e'),
      onPressed: () async {
        showDatePicker(
          context: context, 
          initialDate: widget.entryObject.entryAt != null ? widget.entryObject.entryAt : DateTime.now(), 
          firstDate: DateTime(2020), 
          lastDate: DateTime(2033),
        ).then((value) {
          calenderStore.changeDateTime(value);
        });
      },
      child: Icon(Icons.calendar_today),
    );
  }
}
