import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/components/floating_custom_button/floating_custom_button_widget.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/calender_button/calender_button_widget.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/camera_button/camera_button_widget.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/gps_button/gps_button_widget.dart';
import 'package:smart_money/app/modules/launch/components/message/message_widget.dart';
import 'package:smart_money/app/modules/launch/launch_controller.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';

import 'components/edit_button/edit_button_widget.dart';

class EntryButtonsWidget extends StatefulWidget {
  final LaunchController controller;
  final Entrie entryObject;

  EntryButtonsWidget({this.controller, this.entryObject});

  @override
  _EntryButtonsWidgetState createState() => _EntryButtonsWidgetState();
}

class _EntryButtonsWidgetState extends State<EntryButtonsWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
        Padding(
          padding: EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if(widget.entryObject.id != null)
                FloatingCustomButtonWidget(
                  heroTag: 'Delete',
                  backgroundColor: Hexcolor('#c0392b'),
                  onPressed: () {
                    asuka.showDialog(
                      builder: (context) => MessageWidget(controller: widget.controller, id: widget.entryObject.id)
                    );
                  },
                  child: Icon(Icons.delete_forever),
                ),
                SizedBox(
                  width: 8,
                ),
              CalenderButtonWidget(controller: widget.controller, entryObject: widget.entryObject,),
              SizedBox(
                width: 8,
              ),
              EditButtonWidget(controller: widget.controller, entryObject: widget.entryObject),
              SizedBox(
                width: 8,
              ),
              GpsButtonWidget(controller: widget.controller, entryObject: widget.entryObject),
              SizedBox(
                width: 8,
              ),
              CameraButtonWidget(entryObject: widget.entryObject),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlineButton(
                child: Observer(
                  name: 'ValueButtonText',
                  builder: (_) {
                    return Text("${widget.controller.valueButtonText}", style: TextStyle(fontSize: 18));
                  },
                ),
                onPressed: () async {
                  widget.controller.setDebitCredit();
                  Modular.to.pop();
                },
                textColor: Colors.green,
                borderSide: BorderSide(color: Colors.green),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)
                )
              ),
              FlatButton(
                child: Text("CANCELAR", style: TextStyle(fontSize: 18)),
                onPressed: () {
                  Modular.to.pop();
                },
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
