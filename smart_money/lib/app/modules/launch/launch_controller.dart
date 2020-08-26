import 'package:mobx/mobx.dart';
import 'package:smart_money/app/modules/home/components/last_launchs/last_launchs_controller.dart';
import 'package:smart_money/app/modules/home/home_controller.dart';
import 'package:smart_money/app/shared/database/services/database_service_interface.dart';
import 'package:smart_money/app/shared/database/tables/categories/models/categories_model.dart';
import 'package:smart_money/app/shared/database/tables/entries/models/entries_model.dart';

part 'launch_controller.g.dart';

class LaunchController = _LaunchControllerBase with _$LaunchController;

abstract class _LaunchControllerBase with Store {
  
  IDatabaseService _databaseService;
  HomeController _homeController;
  LastLaunchsController _lastLaunchsController;

  _LaunchControllerBase(this._databaseService, this._homeController, this._lastLaunchsController) {
    getDebit();
  }
  
  @observable
  double value = 0.0;

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
  changeValue(double newValue) => value = newValue;

  @action
  getDebit() async {
    dropDownCategories = "Alimentação";
    categoriesModels = [];
    var categoriesDao = await _databaseService.accessCategoriesTable();
    categoriesModels = await categoriesDao.getDebit();
  }

  @action
  getCredit() async {
    dropDownCategories = "Empréstimos";
    categoriesModels = [];
    var categoriesDao = await _databaseService.accessCategoriesTable();
    categoriesModels = await categoriesDao.getCredit();
  }

  @action 
  changeCategories(String newDropDownCategories) async {
    dropDownCategories = newDropDownCategories;
  }


  @action
  setDebitCredit() async {
    var categoriesDao = await _databaseService.accessCategoriesTable();
    var response = await categoriesDao.getAll();
    var categoryId;

    for(var category in response) {
      if(category.name == dropDownCategories) {
        categoryId = category.id;
      }
    }

    if(debit) {
      value *= -1;
    }

    var entriesDao = await _databaseService.accessEntriesTable();
    
    EntriesModel entriesModel = EntriesModel(amount: value, description: dropDownCategories, categoryId: categoryId);
    await entriesDao.insertEntry(entriesModel);
    _homeController.getBalance();
    _lastLaunchsController.updateWidget();
  }
}
