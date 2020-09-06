import 'package:geolocator/geolocator.dart';

import 'launch_internal_components_service_interface.dart';

class LaunchInternalComponentsService implements ILaunchInternalComponentsService {
  
  var position;
  var latitude;
  var longitude;

  @override
  Future<double> getLatitude() async {
    position = await getPosition();
    return position.latitude;
  }

  @override
  Future<double> getLongitude() async {
    position = await getPosition();
    return position.longitude;
  }

  Future getPosition() async {
    return await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}