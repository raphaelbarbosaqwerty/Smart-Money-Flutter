import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'calender_button_controller.g.dart';

@Injectable()
class CalenderButtonController = _CalenderButtonControllerBase
    with _$CalenderButtonController;

abstract class _CalenderButtonControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
