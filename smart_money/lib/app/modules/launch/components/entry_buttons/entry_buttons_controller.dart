import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'entry_buttons_controller.g.dart';

@Injectable()
class EntryButtonsController = _EntryButtonsControllerBase
    with _$EntryButtonsController;

abstract class _EntryButtonsControllerBase with Store {

  @observable
  File image;

  @observable
  ImagePicker picker = ImagePicker();

  @observable
  PickedFile pickedFile;

  @observable
  var errorImage;

  @action
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    image = File(pickedFile.path);
  }

  @computed
  bool get isImageNull => getImageNull() == null; 

  getImageNull() {
    if(image == null) {
      return true;
    }
    
    return null;
  }

  @action
  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }

    if (response.file != null) {
      pickedFile = response.file;
    } else {
      errorImage = response.exception;
    }
  }
}
