import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/modules/home/home_controller.dart';
import 'package:smart_money/app/shared/database/repositories/database_repository_interface.dart';
import 'package:smart_money/app/shared/database/tables/categories/models/categories_model.dart';
import 'package:smart_money/app/shared/database/tables/entries/models/entries_model.dart';

part 'launch_controller.g.dart';

class LaunchController = _LaunchControllerBase with _$LaunchController;

abstract class _LaunchControllerBase with Store {
  
  IDatabaseRepository _databaseRepository = Modular.get();
  HomeController _homeController = Modular.get();

  _LaunchControllerBase() {
    getDebit();
  }
  
  @observable
  String value = "";

  @observable
  List<CategoriesModel> categoriesModels = [];

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
  changeValue(String newValue) => value = newValue;

  @action
  getDebit() async {
    dropDownCategories = "Alimentação";
    categoriesModels = [];
    var categoriesDao = await _databaseRepository.accessCategoriesTable();
    categoriesModels = await categoriesDao.getDebit();
  }

  @action
  getCredit() async {
    dropDownCategories = "Empréstimos";
    categoriesModels = [];
    var categoriesDao = await _databaseRepository.accessCategoriesTable();
    categoriesModels = await categoriesDao.getCredit();
  }

  @action
  setDebitCredit() async {
    var entriesDao = await _databaseRepository.accessEntriesTable();
    EntriesModel entriesModel = EntriesModel(amount: 1000);
    await entriesDao.insertEntry(entriesModel);
    _homeController.getBalance();
  }

  @action 
  changeCategories(String newDropDownCategories) async {
    dropDownCategories = newDropDownCategories;
  }
}
