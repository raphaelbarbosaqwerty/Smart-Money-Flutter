import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/shared/database/repositories/database_repository_interface.dart';
import 'package:smart_money/app/shared/database/tables/entries/models/entries_model.dart';

part 'money_balance_controller.g.dart';

@Injectable()
class MoneyBalanceController = _MoneyBalanceControllerBase
    with _$MoneyBalanceController;

abstract class _MoneyBalanceControllerBase with Store {

  IDatabaseRepository _databaseRepository = Modular.get();

  _MoneyBalanceControllerBase() {
    getEntries();
  }

  @observable
  double value = 0;

  @observable
  List<EntriesModel> allEntries = [];

  @action 
  getEntries() async {
    var entriesDao = await _databaseRepository.accessEntriesTable();
    allEntries = await entriesDao.getAllEntries();
    getBalance();
  }

  @action 
  getBalance() async {
    print('Teste');
    for (var entry in allEntries) {
      value += entry.amount;
    }
  }

  Future<double> getBalancess() async {
    getBalance();
    return value;
  }

  @action
  void increment() {
    value++;
  }
}
