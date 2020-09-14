import 'package:geocoder/geocoder.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/modules/launch/services/internal/gps/launch_internal_components_service_interface.dart';
part 'gps_store.g.dart';

class GpsStore = _GpsStoreBase with _$GpsStore;

abstract class _GpsStoreBase with Store {
  
  ILaunchInternalComponentsService launchInternalComponentsService;
  
  _GpsStoreBase({
    this.launchInternalComponentsService
    });

  @observable
  double latitude = 0.0;

  @observable
  double longitude = 0.0;

  @observable
  bool localizationActivate = false;

  @observable
  List<Address> addresses;

  @action
  Future getCoordinates() async {
    latitude = await launchInternalComponentsService.getLatitude();
    longitude = await launchInternalComponentsService.getLongitude();
  }

  @action
  Future decodeCoordinates() async {
    var coordinates = Coordinates(latitude, longitude);
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
  }

  @action
  changeLatitude(double value) => latitude = value;

  @action
  changeLongitude(double value) => longitude = value;

  @action
  double getLatitude() => latitude;

  @action
  double getLongitude() => longitude;

}