import 'package:mobx/mobx.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';
import 'package:smart_money/app/shared/databases/general_database_interface.dart';
import 'package:smart_money/app/shared/stores/balance_store.dart';

part 'launch_controller.g.dart';

class LaunchController = _LaunchControllerBase with _$LaunchController;

abstract class _LaunchControllerBase with Store {
  
  IGeneralDatabase _generalDatabase;
  BalanceStore balanceStore;

  _LaunchControllerBase(this._generalDatabase, this.balanceStore) {
    getDebit();
  }
  
  @observable
  double value = 0;

  @observable
  List<dynamic> categoriesModels = [];

  @observable
  String dropDownCategories;

  @observable
  bool debit = true;

  @observable
  String valueType = '-';

  @observable
  String valueButtonText = "DEBITAR";

  Entrie editEntryModel;

  @action
  editEntry(Entrie entryModel) => editEntryModel = entryModel;

  @action
  changeValue(double newValue) => value = newValue;
  
  @action
  void changeValueType() {
    debit = !debit;
    debit ? valueType = "-" : valueType = "+";
    debit ? getDebit() : getCredit();
  }

  @action
  getDebit() async {
    dropDownCategories = "Alimentação";
    categoriesModels = [];
    categoriesModels = await _generalDatabase.categorieDao.getDebit();
    valueButtonText = "DEBITAR";
  }

  @action
  getCredit() async {
    dropDownCategories = "Empréstimos";
    categoriesModels = [];
    categoriesModels = await _generalDatabase.categorieDao.getCredit();
    valueButtonText = "CREDITAR";
  }

  @action 
  changeCategories(String newDropDownCategories) async {
    dropDownCategories = newDropDownCategories;
  }

  @action
  setDebitCredit() async {
    var response = await _generalDatabase.categorieDao.getAllCategories();
    var categoryId;
    for(var category in response) {
      if(category.name == dropDownCategories) {
        categoryId = category.id;
      }
    }

    if(debit) {
      value *= -1;
    }

    Entrie object = Entrie(
      id: editEntryModel?.id, 
      amount: value, 
      description: dropDownCategories, 
      entryAt: DateTime.now(), 
      latitude: 0, 
      longitude: 0, 
      address: 'null', 
      image: 'null', 
      isInit: 0, 
      category_id: categoryId
    );

    if(editEntryModel != null) {
      await _generalDatabase.entrieDao.updateEntry(object);
      balanceStore.getBalance();
    } else {
      await _generalDatabase.entrieDao.addEntry(object); 
      balanceStore.getBalance();
    }
  }

  @action
  Future deleteEntry(int id) async {
    _generalDatabase.entrieDao.removeEntry(id);
  }
}
