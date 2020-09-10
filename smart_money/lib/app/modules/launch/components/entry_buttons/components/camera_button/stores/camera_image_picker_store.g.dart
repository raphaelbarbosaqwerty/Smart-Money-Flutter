// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_image_picker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CameraImagePickerStore on _CameraImagePickerStoreBase, Store {
  final _$imageAtom = Atom(name: '_CameraImagePickerStoreBase.image');

  @override
  File get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(File value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$pickerAtom = Atom(name: '_CameraImagePickerStoreBase.picker');

  @override
  ImagePicker get picker {
    _$pickerAtom.reportRead();
    return super.picker;
  }

  @override
  set picker(ImagePicker value) {
    _$pickerAtom.reportWrite(value, super.picker, () {
      super.picker = value;
    });
  }

  final _$pickedFileAtom = Atom(name: '_CameraImagePickerStoreBase.pickedFile');

  @override
  PickedFile get pickedFile {
    _$pickedFileAtom.reportRead();
    return super.pickedFile;
  }

  @override
  set pickedFile(PickedFile value) {
    _$pickedFileAtom.reportWrite(value, super.pickedFile, () {
      super.pickedFile = value;
    });
  }

  final _$errorImageAtom = Atom(name: '_CameraImagePickerStoreBase.errorImage');

  @override
  dynamic get errorImage {
    _$errorImageAtom.reportRead();
    return super.errorImage;
  }

  @override
  set errorImage(dynamic value) {
    _$errorImageAtom.reportWrite(value, super.errorImage, () {
      super.errorImage = value;
    });
  }

  final _$getImageAsyncAction =
      AsyncAction('_CameraImagePickerStoreBase.getImage');

  @override
  Future<dynamic> getImage() {
    return _$getImageAsyncAction.run(() => super.getImage());
  }

  final _$retrieveLostDataAsyncAction =
      AsyncAction('_CameraImagePickerStoreBase.retrieveLostData');

  @override
  Future<void> retrieveLostData() {
    return _$retrieveLostDataAsyncAction.run(() => super.retrieveLostData());
  }

  final _$_CameraImagePickerStoreBaseActionController =
      ActionController(name: '_CameraImagePickerStoreBase');

  @override
  File getImageSaved(String imagePath) {
    final _$actionInfo = _$_CameraImagePickerStoreBaseActionController
        .startAction(name: '_CameraImagePickerStoreBase.getImageSaved');
    try {
      return super.getImageSaved(imagePath);
    } finally {
      _$_CameraImagePickerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
image: ${image},
picker: ${picker},
pickedFile: ${pickedFile},
errorImage: ${errorImage}
    ''';
  }
}
