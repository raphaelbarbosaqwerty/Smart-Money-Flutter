// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_image_picker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LaunchImagePickerStore on _LaunchImagePickerStoreBase, Store {
  final _$imageAtom = Atom(name: '_LaunchImagePickerStoreBase.image');

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

  final _$pickerAtom = Atom(name: '_LaunchImagePickerStoreBase.picker');

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

  final _$pickedFileAtom = Atom(name: '_LaunchImagePickerStoreBase.pickedFile');

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

  final _$errorImageAtom = Atom(name: '_LaunchImagePickerStoreBase.errorImage');

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
      AsyncAction('_LaunchImagePickerStoreBase.getImage');

  @override
  Future<dynamic> getImage() {
    return _$getImageAsyncAction.run(() => super.getImage());
  }

  final _$retrieveLostDataAsyncAction =
      AsyncAction('_LaunchImagePickerStoreBase.retrieveLostData');

  @override
  Future<void> retrieveLostData() {
    return _$retrieveLostDataAsyncAction.run(() => super.retrieveLostData());
  }

  final _$_LaunchImagePickerStoreBaseActionController =
      ActionController(name: '_LaunchImagePickerStoreBase');

  @override
  File getImageSaved(String imagePath) {
    final _$actionInfo = _$_LaunchImagePickerStoreBaseActionController
        .startAction(name: '_LaunchImagePickerStoreBase.getImageSaved');
    try {
      return super.getImageSaved(imagePath);
    } finally {
      _$_LaunchImagePickerStoreBaseActionController.endAction(_$actionInfo);
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
