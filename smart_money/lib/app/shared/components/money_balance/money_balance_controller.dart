import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/shared/stores/balance_store.dart';

part 'money_balance_controller.g.dart';

@Injectable()
class MoneyBalanceController = _MoneyBalanceControllerBase
    with _$MoneyBalanceController;

abstract class _MoneyBalanceControllerBase with Store {

  final BalanceStore balanceStore;

  @observable
  var moneyMask = MoneyMaskedTextController(leftSymbol: '');

  _MoneyBalanceControllerBase(this.balanceStore) {
    balanceStore.getBalance();
  }
}
