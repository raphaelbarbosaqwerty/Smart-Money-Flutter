import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/shared/database/repositories/database_repository_interface.dart';
import 'package:smart_money/app/shared/database/tables/categories/models/categories_model.dart';
import 'package:smart_money/app/shared/database/tables/categories/services/categories_service.dart';

part 'launch_controller.g.dart';

class LaunchController = _LaunchControllerBase with _$LaunchController;

abstract class _LaunchControllerBase with Store {
  
  IDatabaseRepository _databaseRepository = Modular.get();

  @observable
  int value = 0;

  @action testFunction() async {
    var categoriesDao = await _databaseRepository.accessCategoriesTable();
    CategoriesModel categoriesModel = CategoriesModel(name: 'Test', color: 'Null', isCredit: 0, isDebit: 1, isDefault:0);

    CategoriesService categoriesService = CategoriesService();
    await categoriesService.initColumnsDatabase();
    // await categoriesDao.insertCategory(categoriesModel);
    var response = await categoriesDao.getAll();
    print(response);
  }

  @action
  void increment() {
    value++;
  }
}
