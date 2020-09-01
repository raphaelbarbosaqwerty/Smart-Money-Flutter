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
  double value;

  @observable
  List<dynamic> categoriesModels = [];

  @observable
  String dropDownCategories;

  @observable
  bool debit = true;

  @observable
  String valueType = '-';

  @action
  void changeValueType() {
    debit = !debit;
    debit ? valueType = "-" : valueType = "+";
    debit ? getDebit() : getCredit();
  }

  @action
  changeValue(double newValue) => value = newValue;

  @action
  getDebit() async {
    dropDownCategories = "Alimentação";
    categoriesModels = [];
    categoriesModels = await _generalDatabase.categorieDao.getDebit();
  }

  @action
  getCredit() async {
    dropDownCategories = "Empréstimos";
    categoriesModels = [];
    categoriesModels = await _generalDatabase.categorieDao.getCredit();
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

    await _generalDatabase.entrieDao.addEntry(
      Entrie(
        id: null, 
        amount: value, 
        description: dropDownCategories, 
        entryAt: DateTime.now(), 
        latitude: 0, 
        longitude: 0, 
        address: 'null', 
        image: 'null', 
        isInit: 0, 
        category_id: categoryId
      )
    ); 

    balanceStore.getBalance();
  }
}
