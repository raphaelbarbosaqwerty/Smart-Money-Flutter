import 'package:geocoder/geocoder.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/camera_button/stores/camera_image_picker_store.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/gps_button/stores/gps_store.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';
part 'edit_store.g.dart';

class EditStore = _EditStoreBase with _$EditStore;

abstract class _EditStoreBase with Store {
  
  CameraImagePickerStore cameraImagePickerStore;
  GpsStore gpsStore;

  _EditStoreBase({
    this.gpsStore, 
    this.cameraImagePickerStore
  });

  @observable
  double value = 0.0;

  @observable
  dynamic newEntry = Entrie();

  @observable
  String description = '';

  Categorie categoryDropDownObject;

  @action
  changeEntry(Entrie genericObject) async {
    newEntry = genericObject;
    description = newEntry.description ?? '';
    value = newEntry.amount;
  }

  @action
  Future<dynamic> createObjectEntry() async {
    var addressSplitted;

    if(gpsStore.addresses != null) {
      addressSplitted = await gpsStore.addresses.first.addressLine.split(',');
    } else {
      addressSplitted = [null];
    }

    if(newEntry.amount.toString().contains('-') ? true : false) {
      value *= -1;
    }

    return Entrie(
      id: newEntry?.id, 
      amount: value == 0.0 && newEntry.amount != null ? newEntry.amount : value, 
      description: newEntry.description == null || description != null ? description : newEntry.description, 
      entryAt: DateTime.now(), 
      latitude: gpsStore.latitude, 
      longitude: gpsStore.longitude, 
      address: newEntry.address == null ? addressSplitted[0] : newEntry.address, 
      image: newEntry.image != null ? newEntry.image : cameraImagePickerStore.image?.path, 
      isInit: 0, 
      category_id: categoryDropDownObject.id
    );
  }
}