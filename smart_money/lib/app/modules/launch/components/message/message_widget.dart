import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/modules/launch/launch_controller.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:smart_money/app/shared/stores/balance_store.dart';

class MessageWidget extends StatefulWidget {

  final LaunchController controller;
  final int id;
  MessageWidget({this.controller, this.id});

  @override
  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {

  BalanceStore balanceStore = Modular.get();

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
            onPressed: () async {
              widget.controller.launchService.deleteData(widget.id);
              await balanceStore.getBalance();
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
