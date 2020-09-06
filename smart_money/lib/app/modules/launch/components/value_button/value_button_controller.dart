import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'value_button_controller.g.dart';

@Injectable()
class ValueButtonController = _ValueButtonControllerBase
    with _$ValueButtonController;

abstract class _ValueButtonControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
