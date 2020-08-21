import 'package:mobx/mobx.dart';

part 'database_controller.g.dart';

class DatabaseController = _DatabaseControllerBase with _$DatabaseController;

abstract class _DatabaseControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
