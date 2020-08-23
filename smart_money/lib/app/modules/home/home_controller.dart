import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/shared/database/repositories/database_repository_interface.dart';
import 'package:smart_money/app/shared/database/tables/categories/services/categories_service.dart';
import 'package:smart_money/app/shared/database/tables/entries/models/entries_model.dart';
import 'package:smart_money/app/shared/database/tables/entries/services/entries_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase extends Disposable with Store {
  // ReactionDisposer  dispose;

  IDatabaseRepository _databaseRepository = Modular.get();
  
  _HomeControllerBase() {
    testFunction();
  }

  @override
  void dispose() {
    autorun((_) {
      print(value);
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
  getBalance() async {
    EntriesService entriesService = EntriesService();
    value = await entriesService.getAmount();
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
