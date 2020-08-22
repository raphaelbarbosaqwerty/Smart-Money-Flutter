import 'package:mobx/mobx.dart';
import 'package:smart_money/app/shared/database/tables/categories/services/categories_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  _HomeControllerBase() {
    testFunction();
  }

  @observable
  int value = 0;

  @action testFunction() async {
    CategoriesService categoriesService = CategoriesService();
    await categoriesService.initColumnsDatabase();

    print('Criado');
  }

  @action
  void increment() {
    value++;
  }
}
