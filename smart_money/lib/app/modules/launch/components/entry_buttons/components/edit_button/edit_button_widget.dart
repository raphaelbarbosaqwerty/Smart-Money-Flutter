import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/components/floating_custom_button/floating_custom_button_widget.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/edit_button/stores/edit_store.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:smart_money/app/modules/launch/launch_controller.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';

class EditButtonWidget extends StatefulWidget {

  final Entrie entryObject;
  final LaunchController controller;

  EditButtonWidget({this.entryObject, this.controller});

  @override
  _EditButtonWidgetState createState() => _EditButtonWidgetState();
}

class _EditButtonWidgetState extends State<EditButtonWidget> {
  EditStore editStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return FloatingCustomButtonWidget(
          heroTag: 'Edit',
          backgroundColor: widget.entryObject?.description != null || editStore.description != '' ? Colors.blueAccent : Hexcolor('#34495e'),
          onPressed: () {
            asuka.showDialog(
              builder: (context) => AlertDialog(
                title: Text('Insira uma descrição'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      TextFormField(
                        onChanged: widget.controller.changeDescription,
                        initialValue: editStore.description,
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
