import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/modules/home/home_controller.dart';
import 'package:smart_money/app/shared/database/services/database_service_interface.dart';
import 'package:smart_money/app/shared/database/tables/categories/models/categories_model.dart';
import 'package:smart_money/app/shared/database/tables/categories/services/categories_service.dart';
import 'package:smart_money/app/shared/database/tables/entries/models/entries_model.dart';
import 'package:smart_money/app/shared/database/tables/entries/services/entries_service.dart';

part 'last_launchs_controller.g.dart';

@Injectable()
class LastLaunchsController = _LastLaunchsControllerBase
    with _$LastLaunchsController;

abstract class _LastLaunchsControllerBase extends Disposable with Store {

  final IDatabaseService _databaseService;
  final HomeController _homeController;
  
  _LastLaunchsControllerBase(this._databaseService, this._homeController) {
    updateWidget();
  }

  @observable
  List<EntriesModel> entriesModel = [];

  @observable
  List<CategoriesModel> categoriesModel = [];


  @override
  void dispose() {
  }

  @action
  updateWidget() async {
    await getEntries();
    await getCategoriesColor();
  }

  @action 
  testFunction() async {
    CategoriesService categoriesService = CategoriesService(_databaseService);
    await categoriesService.initColumnsDatabase();
  }

  @action
  Future<List<EntriesModel>> getEntries() async {
    var entriesDao = await _databaseService.accessEntriesTable();
    entriesModel = await entriesDao.getAllEntries();
    await getCategoriesColor();
    return entriesModel;
  }

  @action
  getCategoriesColor() async {
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
}
