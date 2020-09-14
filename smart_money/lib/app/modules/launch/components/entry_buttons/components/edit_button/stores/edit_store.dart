import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/calender_button/stores/calender_store_widget.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/camera_button/stores/camera_image_picker_store.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/gps_button/stores/gps_store.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';

part 'edit_store.g.dart';

class EditStore = _EditStoreBase with _$EditStore;

abstract class _EditStoreBase with Store {
  
  CameraImagePickerStore cameraImagePickerStore;
  CalenderStore calenderStore;
  GpsStore gpsStore;

  _EditStoreBase({
    this.gpsStore, 
    this.cameraImagePickerStore,
    this.calenderStore
  });

  @observable
  double amount = 0.0;

  @observable
  dynamic newEntry = Entrie();

  @observable
  String description = '';

  Categorie categoryDropDownObject;

  @observable
  var addressSplitted;

  @action
  changeEntry(Entrie genericObject) async {
    newEntry = genericObject;
    changeDescription(newEntry.description);
    changeValue(newEntry.amount);
    await changeImagePreview();
  }

  @action
  changeDescription(String value) => description = value ?? '';

  @action
  changeValue(double value) => amount = value;

  @action
  changeImagePreview() {
    if (newEntry.image != null) {
      cameraImagePickerStore.image = File(newEntry.image);
    }
  }

  @action
  double getAmount() => amount;

  @action
  changeCategoryDropDownObject(Categorie value) => categoryDropDownObject = value;

  @action
  Future<dynamic> createObjectEntry() async {
    
    await updateAdressSplitted();
    verifyEntryContains();

    return Entrie(
      id: verifyEntryId(), 
      amount: verifyAmount(), 
      description: verifyDescription(), 
      entryAt: verifyEntryAt(),
      latitude: gpsStore.getLatitude(), 
      longitude: gpsStore.getLongitude(), 
      address: verifyAddress(), 
      image: verifyImage(), 
      isInit: 0, 
      category_id: getCategoryDropDownObject(),
    );
  }

  @action
  updateAdressSplitted() async {
    if(gpsStore.addresses != null) {
      addressSplitted = await gpsStore.addresses.first.addressLine.split(',');
    } else {
      addressSplitted = [null];
    }
  }

  verifyEntryAt() {
    if(newEntry.entryAt != null) {
      return newEntry.entryAt;
    }

    return calenderStore.getDateTime();
  }

  verifyEntryContains() {
    if(newEntry.amount.toString().contains('-') ? true : false) {
      amount *= -1;
    }
  }

  verifyEntryId() {
    return newEntry?.id;
  }

  verifyAmount() {
    return amount == 0.0 && newEntry.amount != null ? newEntry.amount : amount;
  }

  verifyDescription() {
    return newEntry.description == null || description != null ? description : newEntry.description;
  }

  verifyAddress() {
    return newEntry.address == null ? addressSplitted[0] : newEntry.address;
  }

  verifyImage() {
    return newEntry.image != null ? newEntry.image : cameraImagePickerStore.image?.path;
  }

  getCategoryDropDownObject() {
    return categoryDropDownObject.id;
  }
}