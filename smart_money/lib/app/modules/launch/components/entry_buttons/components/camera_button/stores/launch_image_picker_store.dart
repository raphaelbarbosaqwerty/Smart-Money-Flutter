import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'launch_image_picker_store.g.dart';

class LaunchImagePickerStore = _LaunchImagePickerStoreBase with _$LaunchImagePickerStore;

abstract class _LaunchImagePickerStoreBase with Store {
  
  @observable
  File image = null;

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

  @action
  File getImageSaved(String imagePath) {
    print(imagePath);
    return File(imagePath);
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