import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/shared/database/services/database_service.dart';
import 'package:smart_money/app/shared/database/tables/categories/models/categories_model.dart';
import 'package:smart_money/app/shared/database/tables/categories/services/categories_service.dart';
import 'package:smart_money/app/shared/database/tables/entries/models/entries_model.dart';
import 'package:smart_money/app/shared/database/tables/entries/services/entries_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase extends Disposable with Store {
  // ReactionDisposer  dispose;

  DatabaseService _databaseService = Modular.get();
  
  _HomeControllerBase() {
    testFunction();
  }

  @observable
  List<EntriesModel> entriesModel = [];

  @observable
  CategoriesModel categoriesModel;

  @override
  void dispose() {
    autorun((_) {
      print(getEntries());
      print(getCategoriesColor());
    });
  }

  @observable
  double value = 0;

  @action 
  testFunction() async {
    CategoriesService categoriesService = CategoriesService();
    await categoriesService.initColumnsDatabase();
    await getBalance();
  }

  @action
  getEntries() async {
    var entriesDao = await _databaseService.accessEntriesTable();
    entriesModel = await entriesDao.getAllEntries();
    var teste = await entriesModel[1].getCategoryModel();
    print(teste);
  }

  @action
  Future<CategoriesModel> getCategoriesColor() async {
    var category;
    var entriesDao = await _databaseService.accessEntriesTable();
    for(var i in entriesModel) {
      return category = await entriesDao.getCategoryId(i.getCategoryId);
    }
  }

  @action
  getBalance() async {
    EntriesService entriesService = EntriesService();
    value = await entriesService.getAmount();
    await getEntries();
    // var entriesDao = await _databaseRepository.accessEntriesTable();
    // var response = await entriesDao.getAllEntries();

    // for (var entry in response) {
      // value += entry.amount;
    // }
  }

  // @action
  // void increment() async {
  //   getBalance();
  //   // var entriesDao = await _databaseRepository.accessEntriesTable();
  //   // EntriesModel entriesModel = EntriesModel(amount: 1000);
  //   // entriesDao.insertEntry(entriesModel);
  // }
}
