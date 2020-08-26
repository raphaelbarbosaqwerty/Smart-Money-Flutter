import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/shared/database/services/database_service.dart';
import 'package:smart_money/app/shared/database/tables/entries/models/entries_model.dart';

part 'money_balance_controller.g.dart';

@Injectable()
class MoneyBalanceController = _MoneyBalanceControllerBase
    with _$MoneyBalanceController;

abstract class _MoneyBalanceControllerBase with Store {

  final DatabaseService _databaseService;

  @observable
  var moneyMask = MoneyMaskedTextController(leftSymbol: '');

  _MoneyBalanceControllerBase(this._databaseService) {
    getEntries();
  }

  @observable
  double value = 0.0;

  @observable
  // String valueMask = "0.0";

  @observable
  List<EntriesModel> allEntries = [];

  @action 
  getEntries() async {
    var entriesDao = await _databaseService.accessEntriesTable();
    allEntries = await entriesDao.getAllEntries();
    getBalance();
  }

  @action 
  getBalance() async {
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
