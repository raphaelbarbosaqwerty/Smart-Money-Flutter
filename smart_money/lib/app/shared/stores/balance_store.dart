import 'package:mobx/mobx.dart';
import 'package:smart_money/app/shared/databases/general_database_interface.dart';

part 'balance_store.g.dart';

class BalanceStore = _BalanceStoreBase with _$BalanceStore;

abstract class _BalanceStoreBase with Store {
  
  final IGeneralDatabase _generalDatabase;

  _BalanceStoreBase(this._generalDatabase) {
    getBalance();
  }

  @observable
  double value = 0.0;

  @action
  Future getBalance() async {
    value = await _generalDatabase.entrieDao.sumBalance();
  }
}