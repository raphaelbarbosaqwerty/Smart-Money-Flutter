import 'package:mobx/mobx.dart';

part 'balance_controller.g.dart';

class BalanceController = _BalanceControllerBase with _$BalanceController;

abstract class _BalanceControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
