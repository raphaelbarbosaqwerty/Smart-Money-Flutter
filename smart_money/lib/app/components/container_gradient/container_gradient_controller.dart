import 'package:mobx/mobx.dart';

part 'container_gradient_controller.g.dart';

class ContainerGradientController = _ContainerGradientControllerBase
    with _$ContainerGradientController;

abstract class _ContainerGradientControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
