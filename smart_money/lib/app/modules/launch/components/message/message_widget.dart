import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/modules/launch/launch_controller.dart';
import 'package:asuka/asuka.dart' as asuka;

class MessageWidget extends StatelessWidget {

  final LaunchController controller;
  final int id;
  MessageWidget({this.controller, this.id});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: Text('Atenção'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Você tem certeza que deseja apagar?')
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Não'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('Sim'),
            onPressed: () {
              // TODO - Refactoring
              controller.launchService.deleteData(id);
              Navigator.of(context).pop();
              Modular.to.pop();

              asuka.showSnackBar(SnackBar(
                content: Text('Lançamento apagado com sucesso!'),
                backgroundColor: Colors.red,
                )
              );
            },
          ),
        ],
      ),
    );
  }
}
