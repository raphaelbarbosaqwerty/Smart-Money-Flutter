import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/modules/launch/components/floating_custom_button/floating_custom_button_widget.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:smart_money/app/modules/launch/launch_controller.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';

class EditButtonWidget extends StatelessWidget {

  final Entrie entryObject;
  final LaunchController controller;

  EditButtonWidget({this.entryObject, this.controller});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return FloatingCustomButtonWidget(
          heroTag: 'Edit',
          backgroundColor: entryObject?.description != null || controller.launchStore.description != '' ? Colors.blueAccent : Hexcolor('#34495e'),
          onPressed: () {
            asuka.showDialog(
              builder: (context) => AlertDialog(
                title: Text('Insira uma descrição'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      TextFormField(
                        onChanged: controller.changeDescription,
                        initialValue: controller.launchStore.description,
                      )
                    ],
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text('Continuar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ), 
            );
          },
          child: Icon(Icons.edit),
        );
      },
    );
  }
}
