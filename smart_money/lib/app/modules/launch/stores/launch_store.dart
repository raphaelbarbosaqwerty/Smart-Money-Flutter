import 'package:geocoder/geocoder.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/modules/launch/services/internal/gps/launch_internal_components_service_interface.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/camera_button/stores/launch_image_picker_store.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';

part 'launch_store.g.dart';

class LaunchStore = _LaunchStoreBase with _$LaunchStore;

abstract class _LaunchStoreBase with Store {
  
  ILaunchInternalComponentsService launchInternalComponentsService;
  LaunchImagePickerStore launchImagePickerStore;

  _LaunchStoreBase({
    this.launchInternalComponentsService,
    this.launchImagePickerStore
    });

  @observable
  double value = 0.0;

  @observable
  dynamic newEntry = Entrie();

  @observable
  String description = '';

  @observable
  double latitude = 0.0;

  @observable
  double longitude = 0.0;

  Categorie categoryDropDownObject;

  @observable
  bool localizationActivate = false;

  @observable
  List<Address> addresses;

  @action
  Future decodeCoordinates() async {
    var coordinates = Coordinates(latitude, longitude);
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
  }

  @action
  changeEntry(Entrie genericObject) async {
    newEntry = genericObject;
    description = newEntry.description ?? '';
  }

  @action
  Future<dynamic> createObjectEntry() async {
    var addressSplitted;

    if(addresses != null) {
      addressSplitted = await addresses.first.addressLine.split(',');
    } else {
      addressSplitted = [null];
    }

    return Entrie(
      id: newEntry?.id, 
      amount: value == 0.0 && newEntry.amount != null ? newEntry.amount : value, 
      description: newEntry.description == null || description != null ? description : newEntry.description, 
      entryAt: DateTime.now(), 
      latitude: latitude, 
      longitude: longitude, 
      address: newEntry.address == null ? addressSplitted[0] : newEntry.address, 
      image: newEntry.image != null ? newEntry.image : launchImagePickerStore.image?.path, 
      isInit: 0, 
      category_id: categoryDropDownObject.id
    );
  }
}