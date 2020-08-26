import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'chart_categories_controller.g.dart';

@Injectable()
class ChartCategoriesController = _ChartCategoriesControllerBase
    with _$ChartCategoriesController;

abstract class _ChartCategoriesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
