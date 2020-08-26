import 'package:mobx/mobx.dart';
import 'package:smart_money/app/shared/database/services/database_service_interface.dart';
import 'package:smart_money/app/shared/database/tables/categories/services/categories_service.dart';
import 'package:smart_money/app/shared/database/tables/entries/services/entries_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  // ReactionDisposer  dispose;

  final IDatabaseService _databaseService;
  
  _HomeControllerBase(this._databaseService) {
    initTable();
  }

  @observable
  double value = 0;

  @action 
  initTable() async {
    CategoriesService categoriesService = CategoriesService(_databaseService);
    await categoriesService.initColumnsDatabase();
    await getBalance();
  }

  @action
  Future<double> getBalance() async {
    EntriesService entriesService = EntriesService(_databaseService);
    value = await entriesService.getAmount();
    return value;
  }
}
