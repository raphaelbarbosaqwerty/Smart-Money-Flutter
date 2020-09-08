import 'package:geocoder/geocoder.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/modules/launch/services/internal/gps/launch_internal_components_service_interface.dart';
part 'launch_store.g.dart';

class LaunchStore = _LaunchStoreBase with _$LaunchStore;

abstract class _LaunchStoreBase with Store {
  
  ILaunchInternalComponentsService launchInternalComponentsService;

  _LaunchStoreBase({this.launchInternalComponentsService});

  @observable
  double latitude = 0.0;

  @observable
  double longitude = 0.0;

  @observable
  List<Address> addresses;

  @action
  Future decodeCoordinates() async {
    var coordinates = Coordinates(latitude, longitude);
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
  }
}