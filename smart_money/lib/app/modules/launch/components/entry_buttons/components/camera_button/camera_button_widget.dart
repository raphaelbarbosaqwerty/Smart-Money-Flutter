import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/camera_button/stores/launch_image_picker_store.dart';
import 'package:smart_money/app/modules/launch/components/floating_custom_button/floating_custom_button_widget.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';

class CameraButtonWidget extends StatefulWidget {
  final Entrie entryObject;

  const CameraButtonWidget({Key key, this.entryObject}) : super(key: key);
  
  @override
  _CameraButtonWidgetState createState() => _CameraButtonWidgetState();
}

class _CameraButtonWidgetState extends State<CameraButtonWidget> {
  LaunchImagePickerStore launchImagePickerStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return FloatingCustomButtonWidget(
          heroTag: 'Camera',
          backgroundColor: widget.entryObject?.image != null || launchImagePickerStore.image != null ? Colors.blueAccent : Hexcolor('#34495e'),
          onPressed: () {
            if(widget.entryObject?.image != null || launchImagePickerStore.image != null) {
              asuka.showDialog(
                builder: (context) => _alertImage()
              );
            } else {
              launchImagePickerStore.getImage();
              print('Imagem nula');
            }
          },
        child: Icon(Icons.add_a_photo),
        );
      }
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
              child: launchImagePickerStore.image.path == null && widget.entryObject?.image == null
                  ? Text('No image selected.')
                  : Image.file(launchImagePickerStore.getImageSaved(
                    widget.entryObject?.image == null ? 
                    launchImagePickerStore.image.path : 
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
              launchImagePickerStore.getImage();
            },
          ),
        ],
      ),
    );
  }
}
