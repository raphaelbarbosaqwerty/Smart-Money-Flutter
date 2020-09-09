import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'camera_button_controller.g.dart';

@Injectable()
class CameraButtonController = _CameraButtonControllerBase
    with _$CameraButtonController;

abstract class _CameraButtonControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
