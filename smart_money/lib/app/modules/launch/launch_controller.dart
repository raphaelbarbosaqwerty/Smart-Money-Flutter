import 'package:mobx/mobx.dart';

part 'launch_controller.g.dart';

class LaunchController = _LaunchControllerBase with _$LaunchController;

abstract class _LaunchControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
