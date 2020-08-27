import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/shared/database/services/database_service.dart';
import 'package:smart_money/app/shared/database/tables/categories/models/categories_model.dart';
import 'package:smart_money/app/shared/database/tables/entries/models/entries_model.dart';

part 'chart_categories_controller.g.dart';

@Injectable()
class ChartCategoriesController = _ChartCategoriesControllerBase
    with _$ChartCategoriesController;

abstract class _ChartCategoriesControllerBase with Store {

  _ChartCategoriesControllerBase() {
    updateWidget();
  }

  @action
  updateWidget() async {
    await getEntries();
    await getCategoriesColor();
  }

  @observable
  List<EntriesModel> entriesModel = [];
  
  @observable
  List<CategoriesModel> categoriesModel = [];

  @action
  Future<List<EntriesModel>> getEntries() async {
    DatabaseService _databaseService = Modular.get();
    var entriesDao = await _databaseService.accessEntriesTable();
    entriesModel = await entriesDao.getAllEntries();
    await getCategoriesColor();
    return entriesModel;
  }

  @action
  getCategoriesColor() async {
    DatabaseService _databaseService = Modular.get();
    var categoriesDao = await _databaseService.accessCategoriesTable();
    categoriesModel = await categoriesDao.getAll();
  }

  @action
  String getColor(int index) {
    print(entriesModel[index].categoryId);
    
    for(var category in categoriesModel) {
      if(entriesModel[index].categoryId == category.id) {
        return category.color;
      }
    }

    return "";
  }
  
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
