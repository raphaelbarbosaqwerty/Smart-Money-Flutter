import 'dart:io';

import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_money/app/components/card/card_widget.dart';
import 'package:smart_money/app/modules/launch/components/floating_custom_button/floating_custom_button_widget.dart';
import 'package:smart_money/app/modules/launch/components/message/message_widget.dart';
import 'package:smart_money/app/modules/launch/launch_controller.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';

import 'entry_buttons_controller.dart';

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
              
              FloatingCustomButtonWidget(
                heroTag: 'Calender',
                backgroundColor: widget.entryObject?.entryAt != null ? Colors.blueAccent : Hexcolor('#34495e'),
                onPressed: () {
                  print('Configure Table Calendar');
                },
                child: Icon(Icons.calendar_today),
              ),
              SizedBox(
                width: 8,
              ),
              Observer(
                builder: (_) {
                  return FloatingCustomButtonWidget(
                    heroTag: 'Edit',
                    backgroundColor: widget.entryObject?.description != null || widget.controller.descriptionChanged != '' ? Colors.blueAccent : Hexcolor('#34495e'),
                    onPressed: () {
                      asuka.showDialog(
                        builder: (context) => AlertDialog(
                          title: Text('Insira uma descrição'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                TextFormField(
                                  onChanged: widget.controller.changeDescription,
                                  initialValue: widget.controller.descriptionChanged,
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
                                print(widget.controller.descriptionChanged);
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
              ),
              SizedBox(
                width: 8,
              ),
              Observer(
                builder: (_) {
                  return FloatingCustomButtonWidget(
                    heroTag: 'Pin',
                    backgroundColor: widget.controller.launchStore.latitude != 0.0 ? Colors.blueAccent : Hexcolor('#34495e'),
                    onPressed: widget.controller.activateLocalization,
                    child: Icon(Icons.pin_drop),
                  );
                },
              ),
              SizedBox(
                width: 8,
              ),
              Observer(
                builder: (_) {
                  return FloatingCustomButtonWidget(
                    heroTag: 'Camera',
                    backgroundColor: widget.entryObject?.image != null || widget.controller.image != null ? Colors.blueAccent : Hexcolor('#34495e'),
                    onPressed: () {
                      if(widget.entryObject?.image != null || widget.controller.image != null) {
                        print('Imagem existente');
                        asuka.showDialog(
                          builder: (context) => _alertImage()
                        );
                      } else {
                        widget.controller.getImage();
                        print('Imagem nula');
                      }
                    },
                  child: Icon(Icons.add_a_photo),
                  );
                }
              ),
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

  _alertImage() {
    return Center(
      child: AlertDialog(
      backgroundColor: Hexcolor('#34495e'),
        content: AspectRatio(
          aspectRatio: 1.0,
          child: Observer(
            builder: (_) {
              return Center(
              child: widget.controller.image.path == null && widget.entryObject?.image == null
                  ? Text('No image selected.')
                  : Image.file(widget.controller.getImageSaved(
                    widget.entryObject?.image == null ? 
                    widget.controller.image.path : 
                    widget.entryObject.image)),
              );
            },
          ),
        ),
        actions: [
          FlatButton(
            child: Text('Fechar'),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
          FlatButton(
            child: Text('Nova foto'),
            onPressed: () {
              print('New Picture here');
              widget.controller.getImage();
            },
          ),
        ],
      ),
    );
  }
}
