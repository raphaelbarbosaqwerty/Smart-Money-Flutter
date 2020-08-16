import 'package:mobx/mobx.dart';

part 'pie_chart_controller.g.dart';

class PieChartController = _PieChartControllerBase with _$PieChartController;

abstract class _PieChartControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
